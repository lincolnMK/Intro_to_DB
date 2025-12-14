import mysql.connector

# Replace with your connection details
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="rentalmanagement"
)

mycursor = mydb.cursor()
# Execute SQL statements using the execute() method on the cursor
sql = "CREATE DATABASE IF NOT EXISTS alx_book_store"
if mycursor.execute(sql):
    print(" Database 'alx_book_store' created successfully!")
else:
    print("Failed to create database 'alx_book_store'.")
mydb.close()