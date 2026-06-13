import connectionInfo

def clientQueriesFetch(user_id, category_id):
    
    cursor = None
    try:
        cursor = connectionInfo.conn.cursor()
        cond=''
        
        query = """
            SELECT queryid, queryheading, querycreatedtime, status
            FROM public.queries
            WHERE userid = %s
        """

        params = [user_id]

        if category_id:
            query += " AND categoryid = %s"
            params.append(category_id)

        query += " ORDER BY queryid DESC"

             
        cursor.execute(query, tuple(params))
        result = cursor.fetchall()
        
        if result is None:
            return False # no queries found
        
    except Exception as e:
        print(f"Database error: {e}")
        return False
    
    return result