import connectionInfo

def clientHistoryQueriesListFetch():
    
    cursor = None
    try:
        cursor = connectionInfo.conn.cursor()
        
        cursor.execute("SELECT queryid, queryheading, querydescription, mailid, mobilenumber, TO_CHAR(querycreatedtime, 'DD-MM-YYYY HH12:MI AM') AS querycreatedtime_formatted, status,  TO_CHAR(queryclosedtime, 'DD-MM-YYYY HH12:MI AM') AS queryclosedtime_formatted FROM public.queries where DATE(queryclosedtime) < '2025-12-01' order by queryid desc")
        result = cursor.fetchall()
        
        if result is None:
            return False # no queries found
        
    except Exception as e:
        print(f"Database error: {e}")
        return False
    
    return result