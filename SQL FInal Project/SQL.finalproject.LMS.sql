CREATE PROCEDURE finaldbproject

AS
BEGIN

CREATE DATABASE LibraryMngmtSystDB

CREATE TABLE library_branch (
BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
BranchName VARCHAR (50) NOT NULL,
Address VARCHAR (50) NOT NULL
);

CREATE TABLE publisher (
PublisherName VARCHAR(50) PRIMARY KEY NOT NULL,
Address VARCHAR (50) NOT NULL,
Phone VARCHAR (50) NOT NULL
);


CREATE TABLE books (
BookID INT PRIMARY KEY NOT NULL IDENTITY (300,1),
Title VARCHAR (50) NOT NULL,
PublisherName VARCHAR(50) NOT NULL FOREIGN KEY REFERENCES publisher(PublisherName)
);

CREATE TABLE book_copies (
BookID INT NOT NULL FOREIGN KEY REFERENCES books(BookID),
BranchID INT NOT NULL FOREIGN KEY REFERENCES library_branch(BranchID),
Number_Of_Copies INT NOT NULL
);

CREATE TABLE borrower (
CardNo INT PRIMARY KEY NOT NULL IDENTITY (400,1),
Name VARCHAR (50) NOT NULL,
Address VARCHAR (50) NOT NULL,
Phone VARCHAR (50) NOT NULL
);

CREATE TABLE book_loans (
BookID INT NOT NULL FOREIGN KEY REFERENCES books(BookID),
BranchID INT NOT NULL FOREIGN KEY REFERENCES library_branch(BranchID),
CardNo INT NOT NULL FOREIGN KEY REFERENCES borrower(CardNo),
DateOut VARCHAR (50) NOT NULL,
DateDue VARCHAR (50) NOT NULL
);

CREATE TABLE book_authors (
BookID INT NOT NULL FOREIGN KEY REFERENCES books(BookID),
AuthorName VARCHAR (50) NOT NULL
);



INSERT INTO library_branch
	(BranchName, Address)
	 VALUES
	 ('Sharpstown', '123 Any Street Sharpstown'),
	 ('Central', '111 Central Street Sharpstown'),
	 ('East', '456 Eastern Ave Sharpstown'),
	 ('West', '789 Western Drive Sharpstown')
	 ;

INSERT INTO publisher
	(PublisherName, Address, Phone)
	VALUES
	('Bigname', 'New York', '1211211211'),
	('Holt', 'California', '3833833333'),
	('Harper', 'Florida', '2342332343'),
	('Flatiron', 'Oklahoma', '3193967777'),
	('Macmillan', 'Virginia', '8175856767'),
	('Scholastic', 'Pennsylvania', '7566367878'),
	('Chronicle', 'California', '9623837474'),
	('Random Canada', 'Toronto', '2423837878'),
	('Random', 'Vancouver', '2427876464'),
	('Little, Brown/Knopf', 'Missouri', '6547872222'),
	('Hachette', 'Maine', '8456362424'),
	('Andrews McMeel', 'Massachusettes', '9876543211'),
	('S&S', 'Rhode Island', '321654987'),
	('Abrams', 'South Carolina', '654987321'),
	('Morrow', 'Illinois', '5613638989'),
	('St. Martins', 'Minnesota', '3637872424')

;

INSERT INTO books
	(Title, PublisherName)
	VALUES
	('The Lost Tribe', 'Bigname'),
	('Fire and Fury: Inside the Trump White House', 'Holt'),
	('Magnolia Table', 'Harper'),
	('A Higher Loyalty', 'Flatiron'),
	('A Wrinkle in Time', 'Macmillan'),
	('Dog Man and Cat Kid', 'Scholastic'),
	('A Day in the LIfe of Marlon Bundo', 'Chronicle'),
	('12 Rules for LIfe', 'Random Canada'),
	('Oh, the Places Youll Go!', 'Random'),
	('The President Is Missing', 'Little, Brown/Knopf'),
	('You Are a Badass', 'Hachette'),
	('The Subtle Art of Not Giving A F*ck', 'Harper'),
	('The Sun and Her Flowers', 'Andrews McMeel'),
	('Wonder', 'Random'),
	('Milk and Honey', 'Andrews McMeel'),
	('The Outsider', 'S&S'),
	('Green Eggs and Ham', 'Random'),
	('Diary of a Wimpy Kid #12', 'Abrams'),
	('The Woman in the Window', 'Morrow'),
	('The Great Alone', 'St. Martins')
;

INSERT INTO book_copies
	(BookID, BranchID, Number_Of_Copies)
	VALUES
	(300, 1, 3),
	(300, 2, 3),
	(300, 3, 3),
	(301, 1, 2),
	(301, 2, 2),
	(301, 4, 2),
	(302, 1, 3),
	(302, 2, 3),
	(302, 3, 3),
	(303, 1, 2),
	(303, 2, 2),
	(303, 4, 2),
	(304, 1, 3),
	(304, 2, 3),
	(304, 3, 3),
	(305, 1, 2),
	(305, 2, 2),
	(305, 4, 2),
	(306, 1, 4),
	(306, 2, 4),
	(306, 4, 4),
	(307, 1, 3),
	(307, 2, 3),
	(307, 4, 3),
	(308, 1, 2),
	(308, 2, 2),
	(308, 4, 2),
	(309, 1, 4),
	(309, 2, 4),
	(309, 4, 4),
	(310, 3, 3),
	(310, 2, 3),
	(310, 4, 3),
	(311, 3, 4),
	(311, 2, 4),
	(311, 4, 4),
	(312, 3, 4),
	(312, 2, 4),
	(312, 4, 4),
	(313, 3, 3),
	(313, 2, 3),
	(313, 4, 3),
	(314, 3, 4),
	(314, 2, 4),
	(314, 4, 4),
	(315, 2, 3),
	(315, 3, 3),
	(315, 4, 3),
	(316, 1, 2),
	(316, 3, 2),
	(316, 4, 2),
	(317, 2, 3),
	(317, 3, 3),
	(317, 4, 3),
	(318, 1, 2),
	(318, 3, 2),
	(318, 4, 2),
	(319, 3, 3),
	(319, 2, 3),
	(319, 4, 3)
;

INSERT INTO borrower
	(Name, Address, Phone)
	VALUES
	('Bob', '123 ABC Street', '5413507777'),
	('Joe', '234 DEF Avenue', '5416786666'),
	('Sue', '456 GHI Street', '5419874562'),
	('Fred', '567 JKL Avenue', '5416263232'),
	('Jack', '678 KLM Street', '5413234566'),
	('Patty', '789 NOP Avenue', '5414509636'),
	('Angela', '890 QRS Street', '5417896455'),
	('Tara', '787 TUV Avenue', '5419871233')
;

INSERT INTO book_loans
	(BookID, BranchID, CardNo, DateOut, DateDue)
	VALUES
	(300, 1, 400, '2-3-18', '2-17-18'),
	(300, 2, 401, '2-3-18', '2-17-18'),
	(300, 3, 402, '2-4-18', '2-18-18'),
	(300, 3, 403, '2-5-18', '2-19-18'),
	(300, 2, 404, '2-6-18', '2-20-18'),
	(301, 1, 405, '2-7-18', '2-21-18'),
	(301, 2, 406, '2-8-18', '2-22-18'),
	(301, 4, 407, '2-9-18', '2-23-18'),
	(301, 4, 400, '2-3-18', '2-17-18'),
	(301, 2, 401, '2-3-18', '2-17-18'),
	(302, 1, 402, '2-4-18', '2-18-18'),
	(302, 2, 403, '2-5-18', '2-19-18'),
	(302, 3, 404, '2-6-18', '2-20-18'),
	(302, 3, 405, '2-7-18', '2-21-18'),
	(302, 2, 406, '2-8-18', '2-22-18'),
	(303, 1, 407, '2-9-18', '2-23-18'),
	(303, 2, 400, '2-3-18', '2-17-18'),
	(303, 4, 401, '2-3-18', '2-17-18'),
	(303, 2, 402, '2-4-18', '2-18-18'),
	(303, 1, 403, '2-5-18', '2-19-18'),
	(304, 1, 404, '2-6-18', '2-20-18'),
	(304, 2, 405, '2-7-18', '2-21-18'),
	(304, 3, 406, '2-8-18', '2-22-18'),
	(304, 3, 407, '2-9-18', '2-23-18'),
	(304, 2, 400, '2-3-18', '2-17-18'),
	(305, 1, 401, '2-3-18', '2-17-18'),
	(305, 2, 402, '2-4-18', '2-18-18'),
	(305, 4, 403, '2-5-18', '2-19-18'),
	(305, 4, 404, '2-6-18', '2-20-18'),
	(305, 2, 405, '2-7-18', '2-21-18'),
	(306, 1, 406, '2-8-18', '2-22-18'),
	(306, 2, 407, '2-9-18', '2-23-18'),
	(306, 4, 400, '2-3-18', '2-17-18'),
	(306, 4, 401, '2-3-18', '2-17-18'),
	(306, 2, 402, '2-4-18', '2-18-18'),
	(307, 1, 403, '2-5-18', '2-19-18'),
	(307, 2, 404, '2-6-18', '2-20-18'),
	(307, 4, 405, '2-7-18', '2-21-18'),
	(307, 1, 406, '2-8-18', '2-22-18'),
	(307, 2, 407, '2-9-18', '2-23-18'),
	(308, 1, 400, '2-3-18', '2-17-18'),
	(308, 1, 401, '2-3-18', '2-17-18'),
	(308, 2, 402, '2-4-18', '2-18-18'),
	(308, 2, 403, '2-5-18', '2-19-18'),
	(308, 4, 404, '2-6-18', '2-20-18'),
	(309, 4, 405, '2-7-18', '2-21-18'),
	(309, 4, 406, '2-8-18', '2-22-18'),
	(309, 2, 407, '2-9-18', '2-23-18'),
	(309, 2, 400, '2-3-18', '2-17-18'),
	(309, 1, 401, '2-3-18', '2-17-18'),
	(310, 3, 402, '2-4-18', '2-18-18'),
	(311, 3, 403, '2-5-18', '2-19-18'),
	(312, 3, 404, '2-6-18', '2-20-18'),
	(313, 3, 405, '2-7-18', '2-21-18'),
	(314, 3, 406, '2-8-18', '2-22-18'),
	(315, 3, 407, '2-9-18', '2-23-18'),
	(316, 3, 400, '2-3-18', '2-17-18'),
	(317, 3, 401, '2-3-18', '2-17-18'),
	(318, 3, 402, '2-4-18', '2-18-18'),
	(319, 3, 403, '2-5-18', '2-19-18')
;

INSERT INTO book_authors
	(BookID, AuthorName)
	VALUES
	(300, 'Matthew Caldwell'),
	(301, 'Michael Wolff'),
	(302, 'Joanna Gaines'),
	(303, 'James Comey'),
	(304, 'Madeleine LEngle'),
	(305, 'Dav Pilkey'),
	(306, 'Marlon Bundo'),
	(307, 'Jordan B. Peterson'),
	(308, 'Dr. Seuss'),
	(309, 'Bill Clinton/James Patterson'),
	(310, 'Jen Sincero'),
	(311, 'Mark Manson'),
	(312, 'Rupi Kaur'),
	(313, 'R.J. Palacio'),
	(314, 'Rupi Kaur'),
	(315, 'Stephen King'),
	(316, 'Dr. Seuss'),
	(317, 'Jeff Kinney'),
	(318, 'A.J. Finn'),
	(319, 'Hannah Kristin')
;
END


/* DRILL 1 */
SELECT
	Number_Of_Copies, BranchName, Title
	FROM book_copies 
	INNER JOIN   books ON books.BookID = book_copies.BookID
	INNER JOIN library_branch a2 ON book_copies.BranchID = a2.BranchID
	WHERE Title = 'The Lost Tribe' AND BranchName = 'Sharpstown'
; 

/* DRILL 2 */

SELECT
	Number_Of_Copies, BranchName, Title
	FROM book_copies 
	INNER JOIN   books ON books.BookID = book_copies.BookID
	INNER JOIN library_branch a2 ON book_copies.BranchID = a2.BranchID
	WHERE Title = 'The Lost Tribe' 
; 


/* DRILL 3 */


SELECT
	Name, DateOut
	FROM borrower 
	INNER JOIN book_loans ON borrower.CardNo = book_loans.BookID
	WHERE DateOut = NULL
;


/* DRILL 4 */
/* This query works however it wasn't specified in the assignments to used current dates so unfortunately the answer will be blank
but if you test by using one of the corresponding dates left in the inserts it will provide data */

SELECT
	Title, Name, a1.Address, BranchName
	FROM book_loans 
	INNER JOIN   borrower a1 ON book_loans.CardNo = a1.CardNo
	INNER JOIN books a2 ON book_loans.BookID = a2.BookID
	INNER JOIN library_branch a3 ON book_loans.BranchID = a3.BranchID
	WHERE DateDue = '12-20-18' AND BranchName = 'Sharpstown' 
; 
	

/* Drill 5 */

SELECT
	BranchName, COUNT(BookID) AS 'Total Number of Books Loaned'
	FROM book_loans
	INNER JOIN library_branch ON book_loans.BranchID = library_branch.BranchID
	GROUP BY BranchName
; 




/*DRILL 6 */

SELECT
	Name, Address, COUNT(BookID) AS 'Number of Books Checked Out'
	FROM book_loans
	INNER JOIN borrower ON book_loans.CardNo = borrower.CardNo
	WHERE (BookID) > 5
	GROUP BY Name, Address
; 


/*DRILL 7 */

SELECT
	Title, Number_Of_Copies
	FROM book_copies 
	INNER JOIN   library_branch ON book_copies.BranchID = library_branch.BranchID
	INNER JOIN books ON book_copies.BookID = books.BookID
	INNER JOIN book_authors ON book_copies.BookID = book_authors.BookID
	WHERE AuthorName = 'Stephen King' AND BranchName = 'Central' 
; 

	
