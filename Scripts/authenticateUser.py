import hashlib
import connectionInfo

def authenticate_user(username_attempt, password_attempt):
    cursor = None
    try:
        cursor = connectionInfo.conn.cursor()
        
        cursor.execute("SELECT hashedpassword, rolename, userid FROM users WHERE username = %s", (username_attempt,))
        result = cursor.fetchone()
        
        if result is None:
            return False # User not found
            
        stored_hash = result[0]
    
    except Exception as e:
        print(f"Database error: {e}")
        return False
    
    # finally:
    #     if cursor: # Check if cursor was successfully created
    #         cursor.close()
    #     if connectionInfo.conn:
    #         connectionInfo.conn.close()

    attempt_hash = hashlib.sha256(password_attempt.encode()).hexdigest()

    if attempt_hash == stored_hash:
        return result # Authentication successful!
    else:
        return False # Password mismatch