import connectionInfo

def categoryListFetch():
    
    cursor = None
    try:
        cursor = connectionInfo.conn.cursor()
        
        cursor.execute("SELECT categoryid, category_name FROM public.category")
        result = cursor.fetchall()
        
        if result is None:
            return False # no queries found
        
    except Exception as e:
        print(f"Database error: {e}")
        return False
    
    return result