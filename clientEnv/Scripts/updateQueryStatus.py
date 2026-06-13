import connectionInfo
from datetime import datetime
def updateQueryStatus(query_ID, new_status):
    cursor = None
    isSuccess = False
    try:
        cursor = connectionInfo.conn.cursor()
        query_id = int(query_ID) 
        update_query = """
            UPDATE queries
            SET status = %s, queryclosedtime = NOW()
            WHERE queryid = %s;
        """
        cursor.execute(update_query, (new_status, query_id))
        rows_affected = cursor.rowcount
        connectionInfo.conn.commit()
        
        if rows_affected > 0:
            isSuccess = True
    
    except Exception as e:
        print(f"Database error: {e} {update_query}")
        return False

    return isSuccess