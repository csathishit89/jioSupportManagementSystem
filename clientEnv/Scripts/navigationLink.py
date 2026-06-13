def set_page(page_name, st):
    """Sets the new page state and forces a rerun."""
    st.session_state['current_page'] = page_name
    st.rerun()
    
def navigation_link(label, key, icon, st):
    """Renders a Streamlit button styled to look like a highlighted text link."""
    
    is_active = st.session_state.get('current_page') == key
    
    # 1. Check for button click to update state
    if st.button(f"{icon} {label}", key=f"nav_{key}"):
        set_page(key, st)
    
    # 2. Inject CSS to force the active highlight
    if is_active:
        # This CSS overrides the default button look to apply the active color
        st.markdown(f"""
            <style>
            [data-testid*="nav_{key}"] button {{
                background-color: #007bff !important; 
                color: white !important;
            }}
            </style>
        """, unsafe_allow_html=True)