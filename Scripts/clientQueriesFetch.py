import connectionInfo

def clientQueriesFetch(user_id):
    
    cursor = None
    try:
        cursor = connectionInfo.conn.cursor()
        
        cursor.execute("SELECT queryid, queryheading, querycreatedtime, status FROM public.queries WHERE userid = %s order by queryid desc", (user_id,))
        result = cursor.fetchall()
        
        if result is None:
            return False # no queries found
        
    except Exception as e:
        print(f"Database error: {e}")
        return False
    
    return result