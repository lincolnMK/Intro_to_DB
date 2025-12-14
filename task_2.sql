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
    CREATE TABLE IF NOT EXISTS Books (
    book_id INT (PRIMARY KEY),
    title VARCHAR(130),
    FOREIGN KEY (author_id) REFERENCES Authors(author_id),
    price DOUBLE,
    publication_date DATE
);
CREATE TABLE IF NOT EXISTS Authors (
    author_id INT (PRIMARY KEY),
    author_name VARCHAR(215)
);
CREATE TABLE IF NOT EXISTS Customers(
    customer_id INT (PRIMARY KEY),
    customer_name VARCHAR(215),
    email VARCHAR(215),
    address TEXT
);

CREATE TABLE IF NOT EXISTS Orders(
    order_id INT (PRIMARY KEY),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    order_date DATE

);

CREATE TABLE IF NOT EXISTS Order_Details(

    orderdetailid INT (PRIMARY KEY),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    quantity DOUBLE
);
"

if mycursor.execute(sql):
    commit = mydb.commit()
    print(" Tables created successfully!")
else:
    print("Failed to create tables.")
    
mydb.close()