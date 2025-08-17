import mysql.connector
from mysql.connector import Error

# Connection parameters
host = "localhost"
user = "root"
password = "Wallet"
database_name = "alx_book_store"

try:
    
    conn = mysql.connector.connect(
        host=host,
        user=user,
        password=password
    )

    if conn.is_connected():
        cursor = conn.cursor()

        cursor.execute(f"SHOW DATABASES LIKE '{database_name}'")
        result = cursor.fetchone()

        if result:
            print(f"✅ Database '{database_name}' already exists.")
        else:
            cursor.execute(f"CREATE DATABASE {database_name}")
            print(f"🎉 Database '{database_name}' created successfully.")

        # Close connection
        cursor.close()
        conn.close()
        print("MySQL connection closed.")

except Error as e:
    print(f"❌ Error: {e}")
