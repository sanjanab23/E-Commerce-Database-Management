import streamlit as st
import psycopg2
from contextlib import closing
from datetime import datetime
import pandas as pd

# Database connection configuration
config = {
    'user': 'postgres',
    'password': 'root',
    'host': 'localhost',
    'port': 5432,
    'database': 'ecom'
}

# Function to create a database connection
def create_connection():
    try:
        db = psycopg2.connect(**config)
    except psycopg2.OperationalError as e:
        st.error(f"Error connecting to the database: {e}")
        st.stop()
    return db

# Function to fetch data from the database
def fetch_data(query):
    with closing(create_connection()) as conn:
        with conn.cursor() as cursor:
            cursor.execute(query)
            return cursor.fetchall()

# Function to insert data into the database
def insert_data(query, data):
    with closing(create_connection()) as conn:
        with conn.cursor() as cursor:
            cursor.execute(query, data)
            conn.commit()
            st.success("Data inserted successfully")

# Streamlit app layout
def main():
    st.title("E-commerce Database Management System")

    st.sidebar.title("Navigation")
    pages = ["Home", "Products", "Customers", "Orders", "Payments"]
    choice = st.sidebar.radio("Go to", pages)

    if choice == "Home":
        
        st.markdown("""
            This system allows you to manage various aspects of the e-commerce platform, including product details, customer management, order processing, and payments.
            Use the sidebar to navigate to different sections.
        """)

    elif choice == "Products":
        st.header("Product Management")

       

        st.subheader("Add New Product")
        with st.form("product_form"):
            product_name = st.text_input("Product Name")
            category = st.text_input("Category")
            price = st.number_input("Price", min_value=0.0, step=0.01)
            stock_quantity = st.number_input("Stock Quantity", min_value=0, step=1)
            submit_button = st.form_submit_button(label="Add Product")

            if submit_button:
                query = """
                INSERT INTO Products (product_name, category, price, stock_quantity)
                VALUES (%s, %s, %s, %s)
                """
                data = (product_name, category, price, stock_quantity)
                insert_data(query, data)
                
                
        products = st.checkbox("View Products")


        if products:
            products = fetch_data("SELECT * FROM Products")
        if products:
            df_products = pd.DataFrame(products, columns=["Product ID", "Product Name", "Category", "Price", "Stock Quantity"])
            st.dataframe(df_products)
        else:
           pass

   
    elif choice == "Customers":
        st.header("Customer Management")

        

        st.subheader("Add New Customer")
        with st.form("customer_form"):
            first_name = st.text_input("First Name")
            last_name = st.text_input("Last Name")
            email = st.text_input("Email")
            address = st.text_input("Address")
            phone = st.text_input("Phone")
            submit_button = st.form_submit_button(label="Add Customer")

            if submit_button:
                query = """
                INSERT INTO Customers (first_name, last_name, email, address, phone)
                VALUES (%s, %s, %s, %s, %s)
                """
                data = (first_name, last_name, email, address, phone)
                insert_data(query, data)
                
                
        customers = st.checkbox("View Customers")
        if customers:
           customers = fetch_data("SELECT * FROM Customers")
        if customers:
            df_customers = pd.DataFrame(customers, columns=["Customer ID", "First Name", "Last Name", "Email", "Address", "Phone"])
            st.dataframe(df_customers)
        else:
            pass   
                
                
    elif choice == "Orders":
    
        st.header("Order Management")

     
        st.subheader("Add New Order")
        with st.form("order_form"):
            customer_id = st.number_input("Customer ID", min_value=1, step=1)
            order_date = st.date_input("Order Date", datetime.today())
            total_amount = st.number_input("Total Amount", min_value=0.0, step=0.01)
            submit_button = st.form_submit_button(label="Add Order")

            if submit_button:
                query = """
                INSERT INTO Orders (customer_id, order_date, total_amount)
                VALUES (%s, %s, %s)
                """
                data = (customer_id, order_date, total_amount)
                insert_data(query, data)
                
        orders = st.checkbox("View Orders")
        if orders:
            orders = fetch_data("SELECT * FROM Orders")
        if orders:
            df_orders = pd.DataFrame(orders, columns=["Order ID", "Customer ID", "Order Date", "Total Amount"])
            st.dataframe(df_orders)
        else:
            pass


    elif choice == "Payments":
        st.header("Payment Management")

        

        st.subheader("Add New Payment")
        with st.form("payment_form"):
            order_id = st.number_input("Order ID", min_value=1, step=1)
            payment_date = st.date_input("Payment Date", datetime.today())
            amount = st.number_input("Amount", min_value=0.0, step=0.01)
            payment_method = st.text_input("Payment Method")
            submit_button = st.form_submit_button(label="Add Payment")

            if submit_button:
                query = """
                INSERT INTO Payments (order_id, payment_date, amount, payment_method)
                VALUES (%s, %s, %s, %s)
                """
                data = (order_id, payment_date, amount, payment_method)
                insert_data(query, data)
        
        
        payments= st.checkbox("View Payments")
        if payments:
            payments = fetch_data("SELECT * FROM Payments")
        if payments:
            df_payments = pd.DataFrame(payments, columns=["Payment ID", "Order ID", "Payment Date", "Amount", "Payment Method"])
            st.dataframe(df_payments)
        else:
            pass

if __name__ == '__main__':
    main()
