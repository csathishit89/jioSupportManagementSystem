import connectionInfo

def allClientsDashboardCountFetch():
    
    cursor = None
    try:
        cursor = connectionInfo.conn.cursor()
        
        cursor.execute("SELECT SUM(CASE WHEN status = 'Open' THEN 1 ELSE 0 END) AS openCount, SUM(CASE WHEN status = 'Closed' THEN 1 ELSE 0 END) AS closedCount, COUNT(queryid) as totalCount FROM public.queries")
        result = cursor.fetchone()
        
        if result is None:
            return False # User not found
        
    except Exception as e:
        print(f"Database error: {e}")
        return False
    
    return result