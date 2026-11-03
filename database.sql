-- Database creation
Create database EmployeeManagement;
Use EmployeeManagement;

--table creation
create table employees (
    employee_id int primary key ,
    employee_name varchar(100),
    department varchar(50),
    designation varchar(50),
    basic_salary decimal(10,2),
    joining_date date,
    status varchar(20)
);

select * from employees;

-- inserting data into employees table 

 insert into employees
 values
(1, 'Aftab', 'IT', 'Developer', 23000, '2026-11-04', 'Active'),
(2, 'Saad', 'HR', 'Assistant', 30000, '2023-10-07', 'Active'),
(3, 'Ayan', 'Finance', 'Accountant', 35000, '2022-05-12', 'Active'),
(4, 'Adnan', 'IT', 'Tester', 28000, '2021-08-15', 'Active'),
(5, 'Daim', 'Sales', 'Executive', 25000, '2024-02-20', 'Active'),
(6, 'Aman', 'Marketing', 'Manager', 45000, '2020-06-10', 'Active'),
(7, 'Rehan', 'HR', 'Recruiter', 32000, '2022-11-18', 'Inactive'),
(8, 'Ziyad', 'Finance', 'Manager', 55000, '2019-04-25', 'Active'),
(9, 'Adil', 'IT', 'Developer', 40000, '2023-09-05', 'Active'),
(10, 'Farhan', 'Sales', 'Manager', 50000, '2021-12-15', 'Inactive');