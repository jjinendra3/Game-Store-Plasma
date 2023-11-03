CREATE DATABASE GameStore;
USE GameStore;

CREATE TABLE Game (
    GameID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(200),
    Price DECIMAL(12, 2),
    Developer VARCHAR(128), 
    Genre VARCHAR(128),    
    Image VARCHAR(128)
);

CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(128),
    Password VARCHAR(16)
);

CREATE TABLE Customer (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerName VARCHAR(128),
    CustomerPhone VARCHAR(12),
    CustomerEmail VARCHAR(200),
    CustomerAddress VARCHAR(200),
    CustomerGender VARCHAR(10),
    UserID INT,
    CONSTRAINT fk_UserID FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    GameID INT, 
    DatePurchase DATETIME,
    Quantity INT,
    TotalPrice DECIMAL(12, 2),
    Status VARCHAR(1),
    CONSTRAINT fk_CustomerID FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    CONSTRAINT fk_GameID FOREIGN KEY (GameID) REFERENCES Game(GameID)
);

CREATE TABLE Cart (
    CartID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    GameID INT, 
    Price DECIMAL(12, 2),
    Quantity INT,
    TotalPrice DECIMAL(12, 2),
    CONSTRAINT fk_CustomerID_cart FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    CONSTRAINT fk_GameID_cart FOREIGN KEY (GameID) REFERENCES Game(GameID)
);

INSERT INTO Game (Title, Price, Developer, Genre, Image) VALUES 
('Game Title 1', 29.99, 'Developer A', 'Action', './image/food.jpg'),
('Game Title 2', 19.99, 'Developer B', 'Adventure', './image/technology.jpg');
