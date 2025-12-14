import mysql.connector

# Replace with your connection details

try: 
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
    
    )
    mycursor = mydb.cursor()
# Execute SQL statements using the execute() method on the cursor
except mysql.connector.Error as err:
    print(f"Error: {err}")
    exit(1)


sql = "
    USE alx_book_store;
    SHOW TABLES;
"


if mycursor.execute(sql):
    print ("Tables in 'alx_book_store':")
   print(mycursor.fetchall())
   
else:
    print("Failed to retrieve tables from 'alx_book_store'.")
mydb.close()