CREATE DATABASE GameStore;
USE GameStore;

CREATE TABLE Game (
    GameID VARCHAR(50),
    Title VARCHAR(200),
    Price DECIMAL(12, 2),
    Developer VARCHAR(128), 
    Genre VARCHAR(128),    
    Image VARCHAR(128),
    PRIMARY KEY (GameID)
);

CREATE TABLE Users (
    UserID INT NOT NULL AUTO_INCREMENT,
    Username VARCHAR(128),
    Password VARCHAR(16),
    PRIMARY KEY (UserID)
);

CREATE TABLE Customer (
    CustomerID INT NOT NULL AUTO_INCREMENT,
    CustomerName VARCHAR(128),
    CustomerPhone VARCHAR(12),
    CustomerEmail VARCHAR(200),
    CustomerAddress VARCHAR(200),
    CustomerGender VARCHAR(10),
    UserID INT,
    PRIMARY KEY (CustomerID),
    CONSTRAINT FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Order (
    OrderID INT NOT NULL AUTO_INCREMENT,
    CustomerID INT,
    GameID VARCHAR(50), 
    DatePurchase DATETIME,
    Quantity INT,
    TotalPrice DECIMAL(12, 2),
    Status VARCHAR(1),
    PRIMARY KEY (OrderID),
    CONSTRAINT FOREIGN KEY (GameID) REFERENCES Game(GameID) ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Cart (
    CartID INT NOT NULL AUTO_INCREMENT,
    CustomerID INT,
    GameID VARCHAR(50), 
    Price DECIMAL(12, 2),
    Quantity INT,
    TotalPrice DECIMAL(12, 2),
    PRIMARY KEY (CartID),
    CONSTRAINT FOREIGN KEY (GameID) REFERENCES Game(GameID) ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID) ON DELETE SET NULL ON UPDATE CASCADE
);


INSERT INTO Game (GameID, Title, Price, Developer, Genre, Image) VALUES 
('G-001', 'Game Title 1', 29.99, 'Developer A', 'Action', './image/food.jpg'),
('G-002', 'Game Title 2', 19.99, 'Developer B', 'Adventure', './image/technology.jpg');
