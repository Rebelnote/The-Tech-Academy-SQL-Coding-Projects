CREATE DATABASE Library_PDX;

USE Library_PDX;

CREATE TABLE Library_Branch (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY (1000,100),
	BranchName VARCHAR(100) NOT NULL,
	BranchAddress VARCHAR(100) NOT NULL
);

CREATE TABLE Publisher (
	PublisherName VARCHAR(50) PRIMARY KEY NOT NULL,
	PublisherAddress VARCHAR(100) NOT NULL,
	PublisherPhone VARCHAR (50) NOT NULL
);

CREATE TABLE Books (
	BookID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Title VARCHAR(100) NOT NULL,
	PublisherName VARCHAR(50) NOT NULL FOREIGN KEY REFERENCES Publisher(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Book_Authors (
	BookID INT NOT NULL FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR(100) NOT NULL
);

CREATE TABLE Book_Copies (
	BookID INT NOT NULL FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL FOREIGN KEY REFERENCES Library_Branch(BranchID),
	Copies VARCHAR(50) NOT NULL
);

CREATE TABLE Book_Loans (
	BookID INT NOT NULL FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL FOREIGN KEY REFERENCES Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo INT NOT NULL FOREIGN KEY REFERENCES Borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut VARCHAR(50) NOT NULL,
	DateDue VARCHAR(50) NOT NULL
);

CREATE TABLE Borrower (
	CardNo INT NOT NULL PRIMARY KEY IDENTITY (1000000,1),
	BorrowerName VARCHAR(50) NOT NULL,
	BorrowerAddress VARCHAR(50) NOT NULL,
	BorrowerPhone VARCHAR(50) NOT NULL
);

INSERT INTO Library_Branch
(BranchName, BranchAddress)
VALUES
('Sharpstown', '354 SW Couch St, Portland OR, 97205'),
('Central', '1273 SW Central Dr, Hillsboro OR, 97034'),
('Alberta', '8873 NW Alberta St, Portland OR, 97205'),
('Woodstock', '345 SE Woodstock Blvd, Portland OR, 97206'),
('St Johns', '345 NE Smith Rd, Portland OR, 97203')
;

INSERT INTO Publisher
(PublisherName, PublisherAddress, PublisherPhone)
VALUES
('Random House', '459 E Allemany Blvd, San Francisco CA, 90293','403-345-3454'),
('Penguin Publishing', '4532 Broadway Ave, New York NY, 03948', '204-562-9721'),
('Oxford University Press', 'Oxford OXI 2JD, United Kingdom', '44 1845 270000'),
('North Carolina University Press', 'WX33+X6 Chapel Hill, NC 19482,', '682-593-2945')
;

INSERT INTO Books 
(Title, PublisherName)
VALUES
('The Hobbit', 'Oxford University Press'),
('Jurrasic Park', 'Penguin Publishing'),
('Jurrasic Park: The Lost World', 'Penguin Publishing'),
('War of the Worlds', 'North Carolina University Press'),
('The Lord of the Rings: The Fellowship of the Ring', 'Oxford University Press'),
('The Lord of the Rings: The Two Towers', 'Oxford University Press'),
('The Lord of the Rings: The Return of the King', 'Oxford University Press'),
('The Lost Tribe', 'Random House'),
('Lord of the Flies', 'Oxford University Press'),
('Waking Up', 'North Carolina University Press'),
('To Kill a Mocking Bird', 'Random House'),
('Star Wars: Heir to the Empire ', 'Random House'),
('Star Wars: Dark Force Rising', 'Random House'),
('Star Wars: The Last Command', 'Random House'),
('The Art of Asking', 'North Carolina University Press'),
('Where the Sidewalk Ends', 'Random House'),
('Scary Stories to Tell in the Dark', 'Random House'),
('All Things Bright and Beautiful', 'Oxford University Press'),
('Bossypants', 'Random House'),
('Me Talk Pretty One Day', 'Oxford University Press'),
('The Innocents Abroad', 'North Carolina University Press'),
('Carrie', 'Random House'),
('It', 'Random House')
;

INSERT INTO Book_Authors
(BookID, AuthorName)
VALUES
('93','J.R.R. Tolkein'),
('94', 'Michael Criton'),
('95', 'Michael Criton'),
('96', 'H.G. Wells'),
('97', 'J.R.R. Tolkein'),
('98', 'J.R.R. Tolkein'),
('99', 'J.R.R. Tolkein'),
('100', 'Mark Lee'),
('101', 'Goerge Orwell'),
('102', 'Sam Harris'),
('103', 'Harper Lee'),
('104', 'Timothy Zahn'),
('105', 'Timothy Zahn'),
('106', 'Timothy Zahn'),
('107', 'Amanda Palmer'),
('108', 'Shel Silverstein'),
('109', 'Alvin Schwartz'),
('110', 'James Harriet'),
('111', 'Tina Fey'),
('112', 'David Sedaris'),
('113', 'Mark Twain'),
('114', 'Stephen King'),
('115', 'Stephen King')
;

INSERT INTO Book_Copies
(BookID, BranchID, Copies)
VALUES
('93', '1000', '3'),
('93', '1100', '2'),
('93', '1300', '1'),
('93', '1400', '2'),
('94', '1000', '2'),
('94', '1200', '3'),
('94', '1300', '2'),
('94', '1400', '2'),
('95', '1100', '2'),
('95', '1200', '1'),
('95', '1300', '2'),
('95', '1400', '2'),
('96', '1000', '2'),
('96', '1100', '3'),
('96', '1400', '1'),
('97', '1000', '3'),
('97', '1100', '3'),
('97', '1200', '2'),
('97', '1300', '2'),
('97', '1400', '2'),
('98', '1000', '1'),
('98', '1100', '2'),
('98', '1200', '2'),
('98', '1300', '2'),
('98', '1400', '2'),
('99', '1000', '2'),
('99', '1100', '2'),
('99', '1200', '3'),
('99', '1300', '2'),
('99', '1400', '2'),
('100', '1000', '2'),
('100', '1200', '2'),
('102', '1100', '2'),
('102', '1300', '2'),
('103', '1000', '2'),
('103', '1100', '2'),
('103', '1200', '3'),
('103', '1300', '1'),
('103', '1400', '2'),
('104', '1000', '1'),
('104', '1200', '2'),
('104', '1400', '2'),
('105', '1200', '1'),
('105', '1300', '2'),
('106', '1300', '2'),
('106', '1000', '1'),
('106', '1400', '2'),
('107', '1000', '3'),
('107', '1100', '2'),
('107', '1400', '1'),
('108', '1100', '2'),
('108', '1200', '2'),
('108', '1300', '2'),
('108', '1400', '1'),
('109', '1100', '2'),
('109', '1400', '2'),
('110', '1000', '2'),
('110', '1100', '1'),
('110', '1400', '2'),
('111', '1100', '2'),
('111', '1400', '2'),
('112', '1000', '2'),
('112', '1100', '3'),
('112', '1400', '2'),
('113', '1000', '2'),
('113', '1100', '3'),
('113', '1200', '2'),
('113', '1300', '3'),
('113', '1400', '2'),
('114', '1000', '2'),
('114', '1100', '3'),
('114', '1200', '2'),
('114', '1300', '2'),
('114', '1400', '3'),
('115', '1000', '3'),
('115', '1100', '2'),
('115', '1300', '2'),
('115', '1400', '2')
;
SELECT * FROM Borrower;

INSERT INTO Borrower
(BorrowerName, BorrowerAddress, BorrowerPhone)
VALUES
('Greg Jones', '3549 NE Alberta St, #A12, Portland OR, 97204', '503-445-7982'),
('Alberto Gonzalez', '1134 SE 72 Ave, Portland OR, 97206', '613-445-0812'),
('Zeyesha Johnson', '3241 N 2nd Ave, Vancouver WA, 98601', '360-476-8735'),
('Melissa Wright', '31805 Rio Grande, Hillsboro OR', '928-667-4257'),
('Jonathan Masters', '1218 SE Hawthorne St, #204, Portland OR, 97335', '503-775-4398'),
('Xing-Ying Chan', '415 SW Caruthers St, Portland OR, 97201', '503-103-3460'),
('Melody Sevada', '21 N Lombart St, Portland OR, 97445 ', '679-125-3251'),
('Melissa Jones', '3549 NE Alberta St, #A12, Portland OR, 97204', '503-446-7994'),
('Roy Smyth', '450 SW Caynon Rd, Beaverton OR, 97045', '503-355-6698'),
('Xander Deil', '6203 SE 75 Ave, Portland Or 97206', '503-712-8929')
('Donald Trump', '123 Washington Ave, Washington DC, 00239', '554-983-4956');
;

SELECT * FROM Borrower;

INSERT INTO Book_Loans
(BookID, BranchID, CardNo, DateOut, DateDue)
VALUES
('93', '1000', '1000020', '10/12/2019', '12/12/2019'),
('93', '1000', '1000022', '08/18/2019', '11/04/2019'),
('93', '1400', '1000026', '05/06/2000', '07/06/2000'),
('95', '1100', '1000020', '10/12/2019', '12/12/2019'),
('95', '1200', '1000025', '08/24/2019', '12/24/2019'),
('95', '1400', '1000024', '06/02/2019', '08/02/2019'),
('95', '1400', '1000028', '07/13/2019', '09/13/2019'),
('96', '1000', '1000027', '10/12/2019', '12/12/2019'),
('97', '1300', '1000029', '05/14/2019', '12/14/2019'),
('98', '1300', '1000029', '11/05/2019', '01/05/2020'),

('98', '1100', '1000024', '06/02/2019', '08/02/2019'),
('99', '1000', '1000023', '02/04/2010', '07/04.2010'),
('99', '1200', '1000025', '03/23/2019', '10/23.2019'),
('99', '1200', '1000025', '11/13/2019', '01/13.2020'),
('99', '1400', '1000022', '04/22/2015', '06/22.2015'),
('100', '1000', '1000027', '10/12/2019', '12/12.2019'),
('100', '1000', '1000020', '10/12/2019', '12/12.2019'),
('100', '1200', '1000025', '11/13/2019', '11/13/2019'),
('102', '1100', '1000020', '08/05/2019', '12/12/2019'),
('102', '1300', '1000029', '11/05/2019', '01/05/2020'),

('102', '1300', '1000025', '08/13/2003', '02/13/2004'),
('103', '1000', '1000024', '06/11/2019', '12/11/2019'),
('103', '1000', '1000024', '03/18/2017', '02/18/2018'),
('103', '1100', '1000026', '08/23/2019', '12/28/2019'),
('103', '1200', '1000028', '03/14/2009', '11/14/2009'),
('103', '1200', '1000028', '11/02/2019', '01/02/2020'),
('103', '1300', '1000029', '10/02/2019', '12/02/2019'),
('103', '1400', '1000021', '04/03/2019', '11/03/2019'),
('104', '1200', '1000022', '08/18/2019', '11/18/2019'),
('104', '1400', '1000021', '04/03/2019', '11/03/2019'),

('104', '1400', '1000028', '07/13/2019', '09/13/2019'),
('105', '1300', '1000021', '04/22/2009', '06/22/2009'),
('106', '1000', '1000020', '04/11/2019', '12/11/2019'),
('106', '1300', '1000023', '07/15/2019', '01/15/2019'),
('106', '1300', '1000024', '02/26/2019', '05/26/2019'),
('107', '1000', '1000025', '06/17/2019', '08/17/2019'),
('107', '1000', '1000025', '02/22/2001', '05/22/2001'),
('107', '1100', '1000020', '03/22/2005', '08/22/2005'),
('108', '1100', '1000026', '03/12/2011', '06/12/2011'),
('108', '1100', '1000022', '6/03/2019', '10/03/2019'),

('109', '1400', '1000029', '11/01/2019', '01/01/2020'),
('109', '1400', '1000023', '01/06/2019', '06/06/2019'),
('110', '1000', '1000028', '02/24/2003', '08/24/2003'),
('111', '1100', '1000025', '08/22/2001', '08/22/2002'),
('112', '1000', '1000023', '04/12/2019', '10/12.2019'),
('113', '1000', '1000020', '08/01/2019', '10/01.2019'),
('113', '1200', '1000022', '04/11/2003', '09/13.2003'),
('114', '1200', '1000021', '11/04/2019', '01/04.2020'),
('114', '1200', '1000027', '10/12/2019', '12/12.2019'),
('115', '1400', '1000022', '09/11/2019', '12/11.2019')
;

CREATE PROCEDURE Procedure1 @BranchName NVARCHAR(50) = NULL, @Title NVARCHAR(50) = NULL
AS
SELECT Copies
FROM Book_Copies
INNER JOIN Books ON Book_Copies.BookID=Books.BookID
INNER JOIN Library_Branch ON Book_Copies.BranchID=Library_Branch.BranchID
WHERE BranchName = ISNULL(@BranchName, BranchName)
AND Title = ISNULL(@Title, Title)
GO

EXEC dbo.Procedure1 @BranchName='Sharpstown', @Title='The Lost Tribe';


CREATE PROCEDURE Procedure2 @Title NVARCHAR(50) = NUll
AS
Select Copies, BranchName
From Book_Copies
INNER JOIN Books ON Book_Copies.BookID=Books.BookID
INNER JOIN Library_Branch ON Book_Copies.BranchID=Library_Branch.BranchID
WHERE Title = ISNULL(@Title, Title)
GO

EXEC dbo.Procedure2 @Title='The Lost Tribe';


CREATE PROCEDURE Procedure3
AS
SELECT BorrowerName
FROM Borrower
FULL OUTER JOIN Book_Loans ON Borrower.CardNo=Book_Loans.CardNo
WHERE Book_Loans.CardNo IS NULL;
GO

EXEC Procedure3;


CREATE PROCEDURE Procedure4 @DateDue NVARCHAR(50) = NULL
AS
SELECT BorrowerName, BorrowerAddress, Title
FROM Borrower 
INNER JOIN Book_Loans ON Book_Loans.CardNo=Borrower.CardNo
INNER JOIN Books ON Book_Loans.BookID=Books.BookID
Where DateDue = ISNULL(@Datedue, Datedue)
GO

SELECT * FROM Library_Branch;
EXEC dbo.Procedure4 @DateDue='11/13/2019';

CREATE PROCEDURE Procedure5
AS
SELECT COUNT(Copies), BranchName
FROM Book_Copies
INNER JOIN Library_Branch ON Book_Copies.BranchID=Library_Branch.BranchID
GROUP BY BranchName;
GO
SELECT * FROM Book_Loans;

EXEC Procedure5;

CREATE PROCEDURE Procedure6
AS
SELECT COUNT (Book_Loans.CardNo), BorrowerName, BorrowerAddress
FROM Borrower
INNER JOIN Book_Loans ON Borrower.CardNo=Book_Loans.CardNo
GROUP BY BorrowerName, BorrowerAddress
HAVING COUNT (Book_Loans.CardNo) >= 5;
GO

EXEC Procedure6;



CREATE PROCEDURE Procedure7
AS
SELECT COUNT(Copies), Title
FROM Books
INNER JOIN Book_Copies ON Books.BookID=Book_Copies.BookID
INNER JOIN Library_Branch ON Book_Copies.BranchID=Library_Branch.BranchID
INNER JOIN Book_Authors ON Books.BookID=Book_Authors.BookID
WHERE AuthorName='Stephen King' AND BranchName='Central'
GROUP BY Title;
GO

EXECUTE Procedure7;

