create database OrderManagementSystem;
use OrderManagementSystem;

-- Product Table
CREATE TABLE Products (
    productID INT PRIMARY KEY IDENTITY(1,1),
    productName VARCHAR(50),
    description VARCHAR(255),
    price FLOAT,
    quantityInStock INT,
    type NVARCHAR(50) CHECK (type IN ('Electronics', 'Clothing')),
);
-- Electronics Table (inherits from Product)
CREATE TABLE Electronics (
    productID INT PRIMARY KEY IDENTITY(1,1),
    brand VARCHAR(50),
    warrantyPeriod INT,
    FOREIGN KEY (productID) REFERENCES Products(productID)
);


-- Clothing Table (inherits from Product)
CREATE TABLE Clothing (
    productID INT PRIMARY KEY IDENTITY(1,1),
    size VARCHAR(10),
    color VARCHAR(50),
    FOREIGN KEY (productID) REFERENCES Products(productID)
);

-- User Table
CREATE TABLE Users (
userID INT PRIMARY KEY IDENTITY(1,1),
username varchar(20),
password VARCHAR(50) NOT NULL,
role VARCHAR(50) CHECK (role IN ('Admin', 'User'))
);

CREATE TABLE Orders (
	orderID INT PRIMARY KEY IDENTITY(1,1),
	userID INT FOREIGN KEY REFERENCES Users(userID),
	productID INT FOREIGN KEY REFERENCES Products(productID),
	orderDate DATETIME,
	status VARCHAR(20) CHECK (status IN ('Confirmed', 'Processing', 'Shipped', 'Canceled'))
);