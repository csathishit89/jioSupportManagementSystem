def loadSideBar(st, navigationLink, streamlit_js_eval):
    getUserName = streamlit_js_eval(js_expressions="localStorage.getItem('user_name_token')", key='user_name_token_check')
    with st.sidebar:
        st.image("C:/MAMP/htdocs/clientQueryManagement/clientEnv/Scripts/jio_logo.png", 
                width=50)
        st.subheader(f"Welcome, {getUserName}")
        
        navigationLink.navigation_link("Dashboard", 'Dashboard', '📊', st)
        navigationLink.navigation_link("Queries", 'Queries', '❓', st)
        
        st.divider()
        
        if st.button("Log Out 🚪"):
            # Clear persistent token
            streamlit_js_eval(js_expressions="localStorage.removeItem('user_name_token');", key='user_name_token_clear')
            streamlit_js_eval(js_expressions="localStorage.removeItem('user_role_token');", key='user_role_token_clear')
            streamlit_js_eval(js_expressions="localStorage.removeItem('user_id_token');", key='user_id_token_clear')
            st.session_state['logged_in'] = False
            
            import time
            time.sleep(1) 
            st.rerun()