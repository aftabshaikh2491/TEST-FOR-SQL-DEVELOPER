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
