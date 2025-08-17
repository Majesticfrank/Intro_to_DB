import mysql.connector

host = "localhost"
user = "root"
password = "Wallet"

# Attempt connection
conn = mysql.connector.connect(
    host=host,
    user=user,
    password=password
)

if conn.is_connected():
    print("Connection successful!")
    cursor = conn.cursor()
    cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
    print("Database checked/created successfully.")

    # Close connection
    cursor.close()
    conn.close()
    print("MySQL connection closed.")
else:
    print("Connection failed!")