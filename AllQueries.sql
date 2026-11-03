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


--creating store procedure to see employee salary report
create procedure as GetEmployeeSalaryReport
    @department_name VARCHAR(50), 
    @minimum_salary DECIMAL(10,2)
as
begin
    select
        employee_id,
        employee_name,
        department,
        designation,
        basic_salary,
        joining_date
    from employees
    where department = @department_name
    and basic_salary >= @minimum_salary
    and status = 'Active';
end;


exec GetEmployeeSalaryReport 'IT', 22000;




-- creating employee salary Calculation store procedure

create procedure CalculateEmployeeSalary
    @employee_id int
as
begin
    select
        employee_name,
        basic_salary,
        basic_salary * 0.20 AS hra,
        basic_salary * 0.10 AS da,
        basic_salary * 0.12 AS pf,
        basic_salary + (basic_salary * 0.20) + (basic_salary * 0.10) - (basic_salary * 0.12) as net_salary
    from employees
    where employee_id = @employee_id;
end;


exec CalculateEmployeeSalary 1


--creating EmployeesalaryGrade procedure
create procedure EmployeeSalaryGrade
    @employee_id int
as
begin
    select
        employee_name,
        basic_salary,
        case
            when basic_salary < 30000 THEN 'C'
            when basic_salary <= 60000 THEN 'B'
            else 'A'
        end as Salary_Grade
    from employees
    where employee_id = @employee_id;
end;


exec EmployeeSalaryGrade 1

--procedure creation of DepartmentSummary

create procedure GetDepartmentSummary
    @department_name varchar(50)
as	
begin
    select
        count(*) AS Total_Employees,
        avg(basic_salary) AS Average_Salary,
        max(basic_salary) AS Highest_Salary,
        min(basic_salary) AS Lowest_Salary,
        sum(basic_salary) AS Total_Salary
    from employees
    where department = @department_name;
end;

exec GetDepartmentSummary finance












 

