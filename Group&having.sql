
CREATE TABLE Employees (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary INT,
    City VARCHAR(50)
);


INSERT INTO Employees (ID, Name, Department, Salary, City)
VALUES
    (1, 'Alice', 'HR', 40000, 'Dhaka'),
    (2, 'Bob', 'IT', 50000, 'Dhaka'),
    (3, 'Charlie', 'IT', 48000, 'Chittagong'),
    (4, 'David', 'Sales', 45000, 'Dhaka'),
    (5, 'Ema', 'HR', 42000, 'Chittagong'),
    (6, 'Frank', 'IT', 53000, 'Dhaka');

select Department, COUNT(*) as totalemps
FROM Employees
GROUP by Department;

SELECT Department, AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY Department;

SELECT Department, MAX(Salary) as MaxSal
from Employees
GROUP by Department


SELECT Department, count(*) as TotalEmp
from Employees
GROUP by Department
having count(*)>=2


select Department, sum(Salary)as totalSal
from Employees
GROUP by Department


select Department, sum(Salary)as totalSal
from Employees
GROUP by Department,City

SELECT Department, COUNT(ID) AS EmployeeCount
FROM Employees
GROUP BY Department;

SELECT Department, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY Department
HAVING SUM(Salary) > 100000;

SELECT Department, City, AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY Department, City;