def clientDashboard(st, clientDashboardCountFetch, user_id):
    total_count = 0
    open_count = 0
    closed_count = 0
    resolvedRate = 0
    
    recordCount = clientDashboardCountFetch.clientDashboardCountFetch(user_id)
    open_count = recordCount[0]
    closed_count = recordCount[1]
    total_count = recordCount[2]
    resolvedRate = int((closed_count/total_count)*100)
    
    col1, col2, col3, col4 = st.columns([1,4,4,1]) 

    with col2:
        st.metric(
            label="Total Count", 
            value=total_count,  
        )

    with col3:
        st.metric(
            label="Resolved Queries Rate",
            value=str(resolvedRate)+' %', 
        )

    col1, col2, col3, col4 = st.columns([1,4,4,1]) 
    with col2:
        st.metric(
            label="Open Queries", 
            value=open_count,  
        )
    
    with col3:
        st.metric(
            label="Closed Queries", 
            value=closed_count,  
        )
        
    st.markdown("""
        <style>
        /* Targets the main container of all st.metric widgets */
        [data-testid="stMetric"] {
            /* --- Card Appearance --- */
            border: none; /* Remove default border */
            border-radius: 16px; /* KEY: Highly rounded corners */
            padding: 20px 25px; /* Increased internal padding */
            background-color: #ffffff; /* White background */
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); /* KEY: Soft shadow for depth */
            overflow: hidden; 
            
            /* --- Optional: Add a subtle hover effect --- */
            transition: transform 0.2s ease-in-out;
        }

        [data-testid="stMetric"]:hover {
            transform: translateY(-3px); /* Lifts the card slightly on hover */
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.15);
        }

        /* --- Internal Text Styling --- */

        /* Targets the main value (e.g., '66.6%' number) */
        [data-testid="stMetricValue"] {
            font-size: 2.5rem; /* Larger font size */
            font-weight: 700;
            color: #1a1a1a; /* Darker main text */
        }

        /* Targets the label (e.g., 'Attendance') */
        [data-testid="stMetricLabel"] {
            font-size: 1rem;
            font-weight: 500;
            color: #6c757d; /* Gray for descriptive text */
        }

        /* Targets the delta text (e.g., '+0.0%') */
        [data-testid="stMetricDelta"] {
            font-weight: 600;
        }
        </style>
        """, unsafe_allow_html=True)