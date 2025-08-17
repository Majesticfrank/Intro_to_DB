import mysql.connector
from mysql.connector import Error

host = "localhost"
user = "root"
password = "Wallet"

try:
    # Attempt connection
    conn = mysql.connector.connect(
        host=host,
        user=user,
        password=password
    )

    if conn.is_connected():
        print("✅ Connection successful!")
        cursor = conn.cursor()
        cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
        print("✅ Database checked/created successfully.")
        
except mysql.connector.Error as e:
    print(f"❌ Error: {e}")

finally:
    # Ensure cleanup
    if 'cursor' in locals() and cursor is not None:
        cursor.close()
    if 'conn' in locals() and conn.is_connected():
        conn.close()
        print("🔒 MySQL connection closed.")
