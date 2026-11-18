CREATE TABLE Department(
    dept_id int IDENTITY(1,1) PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL,
)

INSERT INTO Department (dept_name)
VALUES
('Human Resources'),
('Finance'),
('IT'),
('Marketing');


CREATE TABLE Employee(
    emp_id INT IDENTITY(1,1) PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    dept_id INT NOT null,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id),
    email VARCHAR(50) UNIQUE NOT NULL
)


INSERT INTO Employee
    (emp_name, dept_id, email)
VALUES
    ('Alice Smith', 1, 'alice@company.com'),
    ('Bob Johnson', 2, 'bob@company.com'),
    ('Charlie Brown', 3, 'charlie@company.com'),
    ('Diana Prince', 4, 'diana@company.com'),
    ('Edward Norton', 3, 'edward@company.com');

CREATE TABLE Salary(
    sal_id INT IDENTITY(1,1) PRIMARY KEY,
    emp_id INT NOT NULL,
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id),
    bsal DECIMAL(10,2) NOT NULL,
    bonus DECIMAL(10,2),
)

INSERT INTO Salary
    (emp_id, bsal, bonus)
VALUES
    (1, 50000.00, 5000.00),
    (2, 60000.00, 6000.00),
    (3, 70000.00, 7000.00),
    (4, 55000.00, 5500.00),
    (5, 72000.00, 7500.00);


CREATE TABLE Attendance (
    at_id INT IDENTITY(1,1) PRIMARY KEY,
    emp_id INT NOT NULL,
    at_date DATE NOT NULL,
    status VARCHAR(50),
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id)
);

INSERT INTO Attendance
    (emp_id, at_date, status)
VALUES
    (1, '2025-04-01', 'Present'),
    (1, '2025-04-02', 'Present'),
    (2, '2025-04-01', 'Absent'),
    (2, '2025-04-02', 'Present'),
    (3, '2025-04-01', 'Leave'),
    (3, '2025-04-02', 'Present'),
    (4, '2025-04-01', 'Present'),
    (5, '2025-04-01', 'Absent');



SELECT * FROM Department;

SELECT * FROM Employee;

SELECT * FROM Salary;


SELECT e.dept_id, 
d.dept_name,
e.email,
s.bsal,
s.bonus,
a.at_date,
a.status

from Employee as e 
inner join Department as d
on e.dept_id = d.dept_id

inner join Salary as s
on e.emp_id = s.emp_id

inner join Attendance as a
on e.emp_id = a.emp_id
