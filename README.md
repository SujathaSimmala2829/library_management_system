# library_management_system

# 📚 Library Management Database (SQL Project)

## 📌 Project Overview
This project is a **beginner-to-advanced level SQL showcase** that demonstrates my proficiency in SQL concepts, including:
- Database schema design
- Table creation
- Data insertion
- Joins
- Filtering and sorting
- Aggregations
- Subqueries
- Window functions

The database models a **Library Management System**, tracking authors, books, borrowers, and borrowed book records.

---

## 🛠️ Technologies Used
- **SQL** (MySQL 8.0)
- Can be run on:
  - MySQL Workbench
  - phpMyAdmin
  - DB Fiddle ([https://dbfiddle.uk/](https://dbfiddle.uk/))
  - Any SQL-compatible tool

---

## 📂 Database Structure

### Tables
1. **Authors** – Stores author details.
2. **Books** – Stores book details and links to authors.
3. **Borrowers** – Stores borrower details.
4. **BorrowedBooks** – Records borrowed book transactions.

---

## 📜 SQL Features Demonstrated

### Beginner Level
- `CREATE TABLE` statements
- `INSERT INTO` for adding records

### Intermediate Level
- `SELECT` queries with `JOIN`
- `WHERE` filtering
- `ORDER BY` sorting

### Advanced Level
- `GROUP BY` with aggregates
- `HAVING` for conditional groups
- Subqueries for dynamic filtering
- `RANK()` window function

---

## 🚀 How to Run
1. Open your SQL environment (MySQL Workbench, phpMyAdmin, DB Fiddle).
2. Copy all code from **`library_management.sql`**.
3. Run the script to create tables, insert data, and execute queries.
4. Explore or modify queries to see different results.

---

## 📷 Example Query Output
**Example:** Books with Author Names  
```sql
SELECT b.Title, a.Name AS Author, b.Genre
FROM Books b
JOIN Authors a ON b.AuthorID = a.AuthorID;

RESULT:
| Title                 | Author        | Genre     |
| --------------------- | ------------- | --------- |
| Harry Potter          | J.K. Rowling  | Fantasy   |
| 1984                  | George Orwell | Dystopian |
| To Kill a Mockingbird | Harper Lee    | Classic   |
| The Alchemist         | Paulo Coelho  | Fiction   |

