import connectionInfo
from datetime import datetime
def addClientQuery(emailID, mobileNumber, queryHeading, queryDescription, userID, categoryID):
    cursor = None
    isSuccess = False
    try:
        cursor = connectionInfo.conn.cursor()
        
        insert_query = f"""
            INSERT INTO queries (mailid, mobilenumber, queryheading, querydescription, userid, status, categoryid, querycreatedtime) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
        """
        data_to_insert = []
        
        row_data = (emailID, mobileNumber, queryHeading, queryDescription, userID, 'Open', categoryID, datetime.now())
        data_to_insert.append(row_data)

        if data_to_insert:
            cursor.executemany(insert_query, data_to_insert)
            rows_inserted = cursor.rowcount
            connectionInfo.conn.commit()
            
            if rows_inserted > 0:
                isSuccess = True
    
    except Exception as e:
        print(f"Database error: {e}")
        return False

    return isSuccess
    