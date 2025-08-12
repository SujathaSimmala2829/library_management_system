-- Create Authors table
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Country VARCHAR(50)
);

-- Create Books table
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(150) NOT NULL,
    AuthorID INT,
    Genre VARCHAR(50),
    PublishedYear INT,
    Price DECIMAL(6,2),
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Create Borrowers table
CREATE TABLE Borrowers (
    BorrowerID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    MembershipDate DATE
);

-- Create BorrowedBooks table
CREATE TABLE BorrowedBooks (
    BorrowID INT PRIMARY KEY,
    BookID INT,
    BorrowerID INT,
    BorrowDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (BorrowerID) REFERENCES Borrowers(BorrowerID)
);

-- Insert Authors
INSERT INTO Authors VALUES
(1, 'J.K. Rowling', 'UK'),
(2, 'George Orwell', 'UK'),
(3, 'Harper Lee', 'USA'),
(4, 'Paulo Coelho', 'Brazil');

-- Insert Books
INSERT INTO Books VALUES
(1, 'Harry Potter', 1, 'Fantasy', 1997, 20.50),
(2, '1984', 2, 'Dystopian', 1949, 15.99),
(3, 'To Kill a Mockingbird', 3, 'Classic', 1960, 18.00),
(4, 'The Alchemist', 4, 'Fiction', 1988, 12.99);

-- Insert Borrowers
INSERT INTO Borrowers VALUES
(1, 'Alice', '2022-01-15'),
(2, 'Bob', '2023-03-10'),
(3, 'Charlie', '2024-07-20');

-- Insert BorrowedBooks
INSERT INTO BorrowedBooks VALUES
(1, 1, 1, '2023-06-01', '2023-06-15'),
(2, 3, 2, '2023-06-05', NULL),
(3, 4, 3, '2024-08-01', NULL);


-- 1. Show all books with their author names
SELECT b.Title, a.Name AS Author, b.Genre
FROM Books b
JOIN Authors a ON b.AuthorID = a.AuthorID;

-- 2. Find all books published after 1950
SELECT Title, PublishedYear
FROM Books
WHERE PublishedYear > 1950;

-- 3. Show all currently borrowed books (ReturnDate is NULL)
SELECT br.Name AS Borrower, b.Title, bb.BorrowDate
FROM BorrowedBooks bb
JOIN Borrowers br ON bb.BorrowerID = br.BorrowerID
JOIN Books b ON bb.BookID = b.BookID
WHERE bb.ReturnDate IS NULL;


-- 4. Count books per author
SELECT a.Name AS Author, COUNT(*) AS BookCount
FROM Books b
JOIN Authors a ON b.AuthorID = a.AuthorID
GROUP BY a.Name
ORDER BY BookCount DESC;

-- 5. Find borrowers who borrowed more than 1 book
SELECT br.Name, COUNT(*) AS BorrowCount
FROM BorrowedBooks bb
JOIN Borrowers br ON bb.BorrowerID = br.BorrowerID
GROUP BY br.Name
HAVING COUNT(*) > 1;

-- 6. Find the most expensive book(s)
SELECT Title, Price
FROM Books
WHERE Price = (SELECT MAX(Price) FROM Books);

-- 7. Rank books by price
SELECT Title, Price,
RANK() OVER (ORDER BY Price DESC) AS PriceRank
FROM Books;
