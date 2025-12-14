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


sql = "show tables in %s"
values = ("alx_book_store", )

if mycursor.execute(sql, values):
    print ("Tables in 'alx_book_store':")
    tables = mycursor.fetchall()
    for table in tables:
        print(table)
else:
    print("Failed to retrieve tables from 'alx_book_store'.")
mydb.close()