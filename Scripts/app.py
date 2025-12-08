import streamlit as st
import pandas as pd
from streamlit_js_eval import streamlit_js_eval

######### Connection to SQL for Data Transaction - Start #########
import authenticateUser
import addClientQuery
import updateQueryStatus
import allClientsDashboardCountFetch
import clientDashboardCountFetch
######### Connection to SQL for Data Transaction - End #########

######### Pages - Start #########
import navigationLink
import loginForm
import loadSideBar
import clientQuery
import supportQueryList
import clientDashboard
import supportDashboard
import createClientQuery
######### Pages - End #########

checkAuthUser = None

st.set_page_config(
    page_title="Jio Support",
    page_icon="C:/MAMP/htdocs/clientQueryManagement/clientEnv/Scripts/Jio_Logo.svg",
    layout="wide"
)

## To set logged in session ##
if 'logged_in' not in st.session_state:
    st.session_state['logged_in'] = False

## To check session already logged in or not ##
if not st.session_state['logged_in']:
    stored_token = streamlit_js_eval(js_expressions="localStorage.getItem('user_name_token')", key='user_name_token_check')
    if stored_token and stored_token != 'null' and stored_token != 'undefined' and stored_token !=None:
        st.session_state['logged_in'] = True
        import time
        time.sleep(1)
        st.rerun() 

if 'current_page' not in st.session_state:
    st.session_state['current_page'] = 'Dashboard'


###### Main Flow  - Start #####
if st.session_state['logged_in'] == True:
    user_role = streamlit_js_eval(js_expressions="localStorage.getItem('user_role_token')", key='user_role_token_check')
    if user_role!='null' and user_role!='undefined' and user_role!=None:
        user_id = streamlit_js_eval(js_expressions="localStorage.getItem('user_id_token')", key='user_id_token_check')
        if st.session_state['current_page'] == 'Dashboard':
            loadSideBar.loadSideBar(st, navigationLink, streamlit_js_eval)
            if user_role == 'Client':
                clientDashboard.clientDashboard(st, clientDashboardCountFetch, user_id)
            elif user_role == 'Support':
                supportDashboard.supportDashboard(st, allClientsDashboardCountFetch)
        elif st.session_state['current_page'] == 'Queries':
            loadSideBar.loadSideBar(st, navigationLink, streamlit_js_eval)
            if user_role == 'Client':
                clientQuery.clientQuery(st, user_id)
            elif user_role == 'Support':
                supportQueryList.supportQueryList(st, updateQueryStatus, pd)
        elif st.session_state['current_page'] == 'CreateQuery':
            loadSideBar.loadSideBar(st, navigationLink, streamlit_js_eval)
            createClientQuery.createClientQuery(st, addClientQuery, user_id)
    else:
        loginForm.loginForm(st, authenticateUser, streamlit_js_eval)
else:
    loginForm.loginForm(st, authenticateUser, streamlit_js_eval)
######  Main Flow  - End #####

###### App CSS - Start ######
st.markdown("""
<style>
    /* Adjust this selector based on what F12 shows */
    .e1mlolmg0st-emotion-cache-8atqhb { 
        display: none !important;
        height: 0 !important;
        padding: 0 !important;
    }

    .st-emotion-cache-1tvzk6f {
        display: none !important;
    }
</style>
""", unsafe_allow_html=True)

st.markdown("""
    <style>
    /* Targets the primary container that wraps all your content */
    .block-container {
        padding-top: 2rem; /* Reduces the top padding from the default large value */
        padding-bottom: 0rem; /* Reduces default bottom padding */
        padding-left: 0rem;
        /* You can adjust the left/right padding if needed, but often not required */
    }
    
    /* Targets the header/toolbar placeholder element (often invisible but reserves space) */
    .stApp > header {
        display: none; 
    }
    
    </style>
    """, unsafe_allow_html=True)

st.markdown("""
    <style>
    /* Targets the primary sidebar container */
    [data-testid="stSidebar"] {
        background-color: #0A2885;
        color: #FFFFFF
    }
    div.stButton > button:first-child {
        background-color: #415eb9;
        color: #FFFFFF
    }
    # div.stButton > button:first-child:hover {
    #     background-color: #415eb9;
    # }
    </style>
    """, unsafe_allow_html=True)

st.markdown("""
    <style>
    /* Base style for the navigation text (makes it look like a link) */
    .nav-link-text {
        padding: 8px 15px;
        margin: 5px 0;
        cursor: pointer;
        transition: background-color 0.2s ease, color 0.2s ease;
        border-radius: 4px;
        font-size: 16px;
        font-weight: 500;
        color: #333333; 
        display: block; 
    }

    /* Style on mouse hover (The highlight effect) */
    .nav-link-text:hover {
        background-color: #e0f2ff; /* Light blue highlight on hover */
        color: #007bff; /* Blue text color on hover */
    }

    /* Style for the currently active/selected page */
    .nav-link-text.active {
        background-color: #007bff !important; /* Blue background */
        color: white !important; /* White text */
        font-weight: 600;
    }

    /* --- STREAMLIT BUTTON OVERRIDES (Makes the button look like text) --- */

    /* Targets ALL buttons inside the sidebar for custom styling */
    [data-testid="stSidebar"] .stButton button {
        background-color: transparent;
        border: none;
        text-align: left;
        width: 100%;
        /* Apply the base nav-link style to the button structure */
        padding: 8px 15px; 
        margin-top: -10px; /* Reduces extra space above the button */
        font-size: 16px;
        font-weight: 500;
    }

    /* Reset hover for standard buttons, and let the custom CSS handle it */
    [data-testid="stSidebar"] .stButton button:hover {
        background-color: transparent; 
    }

    </style>
""", unsafe_allow_html=True)
###### App CSS - End ######