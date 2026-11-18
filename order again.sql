CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT,
    ProductID INT,
    Quantity INT
);
GO

INSERT INTO OrderDetails (OrderID, ProductID, Quantity)
VALUES 
    (101, 11, 5),
    (101, 12, 3),
    (102, 11, 10),
    (103, 14, 7);
GO


-- 1. Return the sum of Quantity for ProductID 11
SELECT SUM(Quantity)
FROM OrderDetails
WHERE ProductID = 11;

-- 2. Give the summarized column the alias "total"
SELECT SUM(Quantity) AS total
FROM OrderDetails;

-- 3. Return the total Quantity for each OrderID
SELECT OrderID, SUM(Quantity) AS [Total Quantity]
FROM OrderDetails
GROUP BY OrderID;