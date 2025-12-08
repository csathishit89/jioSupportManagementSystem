import re

# Simple regex pattern for basic email validation
# This pattern checks for:
# 1. Start with one or more characters/digits/./_/%/+/-
# 2. An @ symbol
# 3. Domain name (characters/digits)
# 4. A dot (.)
# 5. Top-level domain (2 or more characters)
EMAIL_REGEX = re.compile(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")

def validate_email_format(email):
    """Checks if the email string matches the standard format."""
    return EMAIL_REGEX.match(email)

def createClientQuery(st, addClientQuery, userID):
    col1, col2, col3 = st.columns([1,20,4])
    with col2:
        st.subheader("New Query")
        
    col1, col2, col3 = st.columns([1, 10, 10])
    with col2:
        emailID = st.text_input('Email ID')
    with col3:
        mobileNumber = st.text_input("Mobile Number", max_chars=10, key="mobile_input")
    
    
    col1, col2 = st.columns([2, 40])
    with col2:
        queryHeading = st.text_input("Query Heading")
    
    col1, col2 = st.columns([2, 40])
    with col2:  
        queryDescription = st.text_area("Query Description")
        
        newQuerysubmit = st.button("Submit")
        
        if newQuerysubmit:
            if not emailID:
                st.error('Email ID cannot be empty.')
            elif not validate_email_format(emailID):
                st.error("Please enter a valid email address (e.g., user@domain.com).")
            elif not mobileNumber:
                st.error('Mobile Number cannot be empty.')
            elif not mobileNumber.isdigit():
                st.error("Please enter numbers only (0-9).")
            elif len(mobileNumber) < 10:
                st.error("Mobile Number must be 10 digits long.")
            elif not queryHeading:
                st.error('Enter the Query Heading')
            elif not queryDescription:
                st.error('Enter the Query Description')
            else:
                isClientNewQueryInserted = addClientQuery.addClientQuery(emailID, mobileNumber, queryHeading, queryDescription, userID)
                
                if isClientNewQueryInserted:
                    st.success('Query Submitted Successfully. Redirecting...')
                    st.session_state['current_page'] = 'Queries'
                    st.rerun()
                else:
                    st.error('Failed to submit Query')