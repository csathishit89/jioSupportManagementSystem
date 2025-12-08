import clientQueriesFetch

def clientQuery(st, user_id):
    col1, col2, col3 = st.columns([1,25,1])
    with col2:
        st.subheader("Queries") 

    col1, col2, col3 = st.columns([1, 25, 1])
    with col2:
        col1, col2, col3 = st.columns([6, 6, 4])
        with col1:
            st.text_input("🔍 Search by Query Title", placeholder="Type a name to filter...")

        with col2:
            margin_top_value = "90px"
            st.markdown(f"""
                <style>
                [data-testid='stButton'] > button[key='Query'] {{
                    margin-top: {margin_top_value};
                }}
                </style>
                """, unsafe_allow_html=True)
            
            if st.button("Create Query", key="Query"):
                st.session_state['current_page'] = 'CreateQuery'
                st.rerun()
    
    ### To fetch client query list - Start ###
    clientQueriesList = clientQueriesFetch.clientQueriesFetch(user_id)
    
    if clientQueriesList:
        for record in clientQueriesList:
            (
                queryid, 
                queryheading, 
                querycreatedtime, 
                status 
            ) = record

            formatted_time = querycreatedtime.strftime("%d-%m-%Y %I:%M %p")
            
            card_html = f"""
            <div class="ticket-card">
                <div class="ticket-header">
                    <span class="ticket-id-title">Q{queryid} | {queryheading} ?</span>
                    <span class="ticket-status {status}">{status}</span>
                </div>
                <div class="ticket-info">
                    <span>{formatted_time}</span>
                </div>
            </div>
            """
            
            col1, col2, col3 = st.columns([7,3,3])
            with col1:
                st.markdown(card_html, unsafe_allow_html=True)
                
    
    st.markdown("""
        <style>
        /* --- BASE CARD STYLING (For the background and border) --- */
        div[data-testid="stMetric"], .ticket-card {
            background-color: #ffffff; /* White background */
            border-radius: 12px; /* Rounded corners */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05); /* Soft shadow */
            padding: 20px; 
            margin-bottom: 20px;
            margin-left: 40px;
            transition: transform 0.2s ease-in-out;
        }

        div[data-testid="stMetric"]:hover, .ticket-card:hover {
            transform: translateY(-3px); /* Subtle lift on hover */
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
        }

        /* --- METRIC CARD SPECIFIC STYLES (Attendance Card) --- */

        /* Targets the main value (e.g., 66.6%) */
        [data-testid="stMetricValue"] {
            font-size: 2.5rem; 
            font-weight: 700;
            color: #1a1a1a;
        }

        /* Targets the delta text (e.g., +0.0%) */
        [data-testid="stMetricDelta"] {
            font-size: 1.2rem;
            font-weight: 600;
            margin-left: 10px;
            /* Customizing the delta color to match your image */
            color: #ff9900 !important; /* Example orange/red color */
        }

        /* Targets the smaller text below the delta */
        [data-testid="stMetricLabel"] + div {
            font-size: 0.9rem;
            color: #888888;
            margin-top: 5px;
        }

        /* --- TICKET CARD SPECIFIC STYLES (Q44222 Card) --- */

        .ticket-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }

        .ticket-id-title {
            font-size: 1.1rem;
            font-weight: 600;
            color: #333;
        }

        .ticket-status.Closed {
            padding: 5px 10px;
            border-radius: 6px;
            font-size: 0.8rem;
            font-weight: 700;
            background-color: #e6ffe6; /* Light green background */
            color: #388e3c; /* Darker green text */
        }

        .ticket-status.Open {
            padding: 5px 10px;
            border-radius: 6px;
            font-size: 0.8rem;
            font-weight: 700;
            background-color: #ffe6e6; /* Light Red/Pink */
            color: #cc0000; /* Dark Red */
        }
        .ticket-info {
            font-size: 0.9rem;
            color: #6c757d;
            margin-top: 5px;
            display: flex;
            gap: 10px;
            align-items: center;
        }

        .ticket-tag {
            background-color: #f0f8ff; /* Light blue background for tags */
            color: #007bff;
            padding: 3px 8px;
            border-radius: 4px;
            font-size: 0.75rem;
            font-weight: 500;
        }
        </style>
        """, unsafe_allow_html=True)
    ### To fetch client query list - End ###