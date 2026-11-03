# SQL Developer Interview Task

This repository contains SQL scripts for managing employee data and performing database operations using stored procedures in SQL Server.

## 📁 Files Included
1. **`database.sql`**: Database creation, `employees` table schema, and sample data insertion scripts.
2. **`procedures.sql`**: Stored procedures for business logic and aggregations.

## 🛠️ Stored Procedures Included
- `GetEmployeeSalaryReport`: Filters active employees by department and minimum salary.
- `CalculateEmployeeSalary`: Calculates HRA (20%), DA (10%), PF (12%), and Net Salary for an employee.
- `EmployeeSalaryGrade`: Assigns salary grades (A, B, C) based on basic salary.
- `GetDepartmentSummary`: Calculates employee count, average, max, min, and total salary per department.

## 🚀 How to Run
1. Execute `database.sql` to setup the database and populate initial data.
2. Execute `procedures.sql` to compile all stored procedures.
