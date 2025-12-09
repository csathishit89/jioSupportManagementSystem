import connectionInfo

def clientQueriesListFetch(status):
    
    cursor = None
    try:
        cursor = connectionInfo.conn.cursor()
        params = []
        
        sql_query = """
            SELECT 
                queryid, queryheading, querydescription, mailid, mobilenumber, 
                TO_CHAR(querycreatedtime, 'DD-MM-YYYY HH12:MI AM') AS querycreatedtime_formatted, 
                status, 
                TO_CHAR(queryclosedtime, 'DD-MM-YYYY HH12:MI AM') AS queryclosedtime_formatted 
            FROM 
                public.queries 
            WHERE 
                DATE(querycreatedtime) > '2025-11-30'
        """

        if status != 'All':
            sql_query += " AND status = %s"
            params.append(status)
        sql_query += " ORDER BY queryid DESC"
        
        cursor.execute(sql_query, params)
        result = cursor.fetchall()
        
        if result is None:
            return False # no queries found
        
    except Exception as e:
        print(f"Database error: {e}")
        return False
    
    # finally:
    #     if cursor: # Check if cursor was successfully created
    #         cursor.close()
    #     if connectionInfo.conn:
    #         connectionInfo.conn.close()

    return result