import connectionInfo

def clientDashboardCountFetch(user_id):
    
    cursor = None
    try:
        cursor = connectionInfo.conn.cursor()
        
        cursor.execute("SELECT SUM(CASE WHEN status = 'Open' THEN 1 ELSE 0 END) AS openCount, SUM(CASE WHEN status = 'Closed' THEN 1 ELSE 0 END) AS closedCount, COUNT(queryid) as totalCount FROM public.queries WHERE userid = %s", (user_id,))
        result = cursor.fetchone()
        
        if result is None:
            return False # no queries found
        
    except Exception as e:
        print(f"Database error: {e}")
        return False
    
    return result