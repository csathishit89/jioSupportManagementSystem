import clientQueriesListFetch
import clientHistoryQueriesListFetch
def supportQueryList(st, updateQueryStatus, pd):
    searchInput = None
    clientsQueriesListFetch = clientQueriesListFetch.clientQueriesListFetch()
    data_records = clientsQueriesListFetch
    
    clientsHistoryQueriesListFetch = clientHistoryQueriesListFetch.clientHistoryQueriesListFetch()
    data_history_records = clientsHistoryQueriesListFetch
    
    column_names = ['Query ID', 'Query Heading', 'Query Description', 'Mail ID', 'Mobile Number', 'Created Date', 'Status',  'Closed Date']
    df = pd.DataFrame(data_records, columns=column_names)
    
    column_names = ['Query ID', 'Query Heading', 'Query Description', 'Mail ID', 'Mobile Number', 'Created Date', 'Status',  'Closed Date']
    df_history = pd.DataFrame(data_history_records, columns=column_names)
    
    df_filtered = df.copy()
    
    styled_df = df.style.applymap(
        color_status, 
        subset=['Status'] # Target only the 'Status' column
    )
    styled_df_filtered = None
    
    
    col1, col2 = st.columns([1, 45])
    with col2:
        st.header("Client Queries List")
    
    col1, col2 = st.columns([1, 45])
    with col2:
        tab1, tab2 = st.tabs(["New Queries", "Old Queries"])
    
    with tab1:
        col1, col2, col3 = st.columns([1, 40, 1])
        with col2:
            # col1, col2, col3 = st.columns([6, 6, 4])
            # with col1:
                # searchInput = st.text_input("🔍 Search by Query Title", placeholder="Type a name to filter...")
                
                # if searchInput:
                #     df_filtered = df_filtered[
                #                     df_filtered['Query Heading'].str.lower().str.contains(searchInput, na=False)
                #                 ]
                #     styled_df_filtered = df_filtered.style.applymap(
                #         color_status, 
                #         subset=['Status'] # Target only the 'Status' column
                #     )
            
            # Add checkbox
            df["Select"] = False
            df["Select"] = df["Select"].astype(bool)
            
            cols = ['Select'] + [c for c in df.columns if c != 'Select']
            df = df[cols]

            edited_df = st.data_editor(
                df,
                column_config={
                    "Select": st.column_config.CheckboxColumn(label="Select", required=False),
                },
                hide_index=True,
                use_container_width=True
            )
            
            
            # -------------------- enforce single-select logic --------------------
            # compute which row indices (DataFrame index) are checked now
            new_selected = set(edited_df[edited_df["Select"] == True].index.tolist())
            prev_selected = set(st.session_state.get("selected_set", set()))

            # if user checked multiple (or two remained checked), detect the newest selection
            if len(new_selected) > 1:
                # newly checked indexes = ones present now but not previously
                newly_checked = list(new_selected - prev_selected)

                if newly_checked:
                    # user explicitly checked this new row -> keep it
                    keep_idx = newly_checked[0]
                else:
                    # fallback: no difference (maybe programmatically set) -> keep highest index (or choose any)
                    keep_idx = max(new_selected)

                # create updated df state with only keep_idx True
                updated = edited_df.copy()
                updated["Select"] = False
                updated.loc[keep_idx, "Select"] = True

                # persist and rerun to update UI
                st.session_state.df = updated
                st.session_state.selected_set = {keep_idx}
                st.rerun()

            else:
                # normal case (0 or 1 selected) -> store state
                st.session_state.df = edited_df.copy()
                st.session_state.selected_set = new_selected

            # -------------------- show selected row (single) --------------------

            selected_rows = st.session_state.df[st.session_state.df["Select"] == True]

            if selected_rows.empty:
                st.info("No row selected. Click the checkbox in the first column to select a row.")
            else:
                # Show selected rows (could be multiple)
                selected_row = selected_rows.iloc[0]
                st.dataframe(selected_rows.drop(columns=["Select"]), use_container_width=True)

                # For single selection behavior, pick the first row only AFTER checking non-empty
                row = selected_rows.iloc[0]   # safe now, because we checked empty above
                query_id = row["Query ID"]
                current_status = row["Status"]

                st.write(f"Selected Query ID: **{query_id}** — Status: **{current_status}**")

                # Show action if Open
                if current_status == "Open":
                    if st.button(f"Mark Query {query_id} as Closed"):
                        edited_df.loc[edited_df["Query ID"] == query_id, "Status"] = "Closed"
                        edited_df.loc[edited_df["Query ID"] == query_id, "Closed Date"] = pd.Timestamp.now().strftime("%d-%m-%Y %I:%M %p")

                        isClientQueryUpdated = updateQueryStatus.updateQueryStatus(int(query_id), "Closed")

                        if isClientQueryUpdated:
                            st.success(f"Query {query_id} marked Closed. Redirecting...")
                            st.session_state['current_page'] = 'Dashboard'
                            st.rerun()
                        else:
                            st.error('Failed to submit Query {isClientQueryUpdated}')
                else:
                    st.info("This query is already Closed.")

            # if "Select" in edited_df.columns:
            #     selected = edited_df[edited_df["Select"] == True]
            #     st.subheader("Selected Query")
            #     st.write(selected)
                
            #     # Extract selected row
            #     row = selected.iloc[0]
            #     query_id = row["Query ID"]
            #     current_status = row["Status"]
                
            #     if current_status == "Open":
            #         if st.button("Mark as Closed"):
            #             # Update in dataframe
            #             edited_df.loc[edited_df["Query ID"] == query_id, "Status"] = "Closed"
            #             edited_df.loc[edited_df["Query ID"] == query_id, "Closed Date"] = pd.Timestamp.now().strftime("%d-%m-%Y %I:%M %p")

            #             st.success(f"Query {query_id} marked as Closed!")

            #             # OPTIONAL: Save changes back to your database here
            #             # update_query_status_in_db(query_id, "Closed")

            #             # st.rerun()
            #     else:
            #         st.write("✅ This query is already **Closed**.")
            # else:
            #     st.error("No 'Select' column found in the returned DataFrame. See the column list above.")

    
            # if searchInput==None or searchInput=='':
            #     st.dataframe(df, hide_index=True)
            # else:
            #     st.dataframe(styled_df_filtered, hide_index=True)
                    
            st.caption("Try clicking on the column headers to sort the data.")
    
    with tab2:
        col1, col2, col3 = st.columns([1, 35, 1])      
        with col2:
            st.dataframe(df_history, hide_index=True)
        
def color_status(val):
    if val == 'Open':
        color = 'blue'
    elif val == 'Closed':
        color = 'green'
    else:
        color = 'black'
    
    return f'color: {color}; font-weight: bold;'