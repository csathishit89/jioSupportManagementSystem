def loginForm(st, authenticateUser, streamlit_js_eval):
    col1, col2, col3 = st.columns([1, 12, 1])
    with col2:
        st.markdown("<h2 style='text-align: center;'>Jio Quick Support</h2>", unsafe_allow_html=True)

    col1, col2, col3 = st.columns([5, 2, 5])
    with col2:
        st.image("C:/MAMP/htdocs/clientQueryManagement/clientEnv/Scripts/Jio_Logo.svg",width=120)

    col1, col2, col3 = st.columns([3, 5, 3])
    with col2:
        form = st.form(key="login_form")

        userName = form.text_input("User Name")
        userPassword = form.text_input("Password",type="password")

        submitButton = form.form_submit_button("Login")

        if submitButton:
            if userName == '':
                st.error('Enter the Username')
            elif userPassword == '':
                st.error('Enter the Password')
            else:
                checkAuthUser = authenticateUser.authenticate_user(userName, userPassword)
                
                if checkAuthUser:
                    st.success('Authentication Successful. Redirecting...')
                    st.session_state['logged_in'] = True
                    js_code = f'localStorage.setItem("user_name_token", "{userName}");'
                    streamlit_js_eval(js_expressions=js_code, key='token_set')
                    
                    js_code = f'localStorage.setItem("user_role_token", "{checkAuthUser[1]}");'
                    streamlit_js_eval(js_expressions=js_code, key='user_role_token_set')
                    
                    js_code = f'localStorage.setItem("user_id_token", "{checkAuthUser[2]}");'
                    streamlit_js_eval(js_expressions=js_code, key='user_id_token_set')
                    
                    import time
                    time.sleep(1)
                    st.rerun()
                else:
                    st.error('Please check your credentials')
                    st.session_state['logged_in'] = False