

# 💼 JOB PORTAL MANAGEMENT SYSTEM
### MySQL Database Design and Query Implementatio

---

## 📌 1. Project Overview

The **Job Portal Management System** is a database management project developed using MySQL. It is designed to manage job seekers, employers, job vacancies, applications, and interview details in a structured and efficient manner.

The system maintains candidate information, company details, job postings, application records, and interview schedules. It provides an organized way to store, retrieve, update, and analyze recruitment-related information.

This project demonstrates the practical implementation of SQL concepts, including database design, constraints, functions, joins, subqueries, views, stored procedures, triggers, and transaction management.

---

## 🎯 2. Project Objectives

The main objectives of this project are:

- To design and develop a relational database for a job portal.
- To maintain candidate information such as name, phone number, email, and city.
- To store employer details, including company names and industries.
- To manage job vacancies with job titles, locations, and salary information.
- To track candidate applications and their statuses.
- To maintain interview schedules, modes, and results.
- To retrieve meaningful information using SQL queries.
- To implement database operations using advanced SQL concepts.
- To automate database activities using triggers and stored procedures.
- To maintain data consistency using primary keys and foreign keys.

---

## 🛠️ 3. Technologies Used

| Technology | Purpose |
|---|---|
| MySQL | Relational database management |
| MySQL Workbench | Database creation and query execution |
| SQL | Data definition, manipulation and retrieval |

---

## 🗄️ 4. Database Design

The project consists of five relational tables.

### 4.1 Candidates Table

Stores personal information about job seekers.

| Column | Description |
|---|---|
| candidate_id | Unique candidate ID (Primary Key) |
| full_name | Candidate's full name |
| phone | Unique phone number |
| email | Unique email address |
| city | Candidate's city |

### 4.2 Employers Table

Stores information about companies registered in the job portal.

| Column | Description |
|---|---|
| employer_id | Unique employer ID (Primary Key) |
| company_name | Name of the company |
| industry | Company industry |

### 4.3 Jobs Table

Stores job vacancy details posted by employers.

| Column | Description |
|---|---|
| job_id | Unique job ID (Primary Key) |
| employer_id | Employer reference (Foreign Key) |
| title | Job title |
| location | Job location |
| salary | Offered salary |

### 4.4 Applications Table

Maintains candidate job application information.

| Column | Description |
|---|---|
| application_id | Unique application ID (Primary Key) |
| candidate_id | Candidate reference (Foreign Key) |
| job_id | Job reference (Foreign Key) |
| application_date | Date of application |
| status | Current application status |

### 4.5 Interviews Table

Maintains interview schedules and results.

| Column | Description |
|---|---|
| interview_id | Unique interview ID (Primary Key) |
| application_id | Application reference (Foreign Key) |
| interview_date | Scheduled interview date |
| mode | Online or Offline |
| result | Interview result |

---

## 🔗 5. Database Relationships

The database uses primary keys and foreign keys to establish relationships between tables.

1. **Employers → Jobs:** One employer can post multiple jobs.
2. **Candidates → Applications:** One candidate can submit multiple applications.
3. **Jobs → Applications:** One job can receive multiple applications.
4. **Applications → Interviews:** One application can have multiple interview records.

### Relationship Summary

| Parent Table | Child Table | Relationship |
|---|---|---|
| Employers | Jobs | One-to-Many |
| Candidates | Applications | One-to-Many |
| Jobs | Applications | One-to-Many |
| Applications | Interviews | One-to-Many |

---

## 📊 6. Sample Database Records

Sample records were inserted into all five tables to test the database operations.

- 10 Candidate records
- 5 Employer records
- 6 Job records
- 10 Application records
- 6 Interview records

Sample companies include:

- TechNova
- DataWave
- CloudEdge
- FinCore
- HealthSoft

Sample job roles include:

- Python Developer
- SQL Developer
- Data Analyst
- Cloud Engineer
- BI Developer
- ML Engineer

---

## 💻 7. SQL Concepts Implemented

### 7.1 DDL – Data Definition Language

Used to define and modify the database structure.

Commands:
- CREATE
- ALTER
- DROP
- TRUNCATE

### 7.2 DML – Data Manipulation Language

Used to insert, modify, and delete database records.

Commands:
- INSERT
- UPDATE
- DELETE

### 7.3 DQL – Data Query Language

Used to retrieve information from database tables.

Command:
- SELECT

### 7.4 Numeric Functions

Used to perform mathematical operations on numerical values.

Functions:
- ABS()
- ROUND()
- CEIL()
- FLOOR()
- MOD()
- POWER()
- SQRT()
- TRUNCATE()

### 7.5 Aggregate Functions

Used to calculate summarized information from database records.

Functions:
- COUNT() – Counts the number of records.
- SUM() – Calculates the total salary.
- AVG() – Calculates average salary.
- MAX() – Returns the highest salary.
- MIN() – Returns the lowest salary.

Additional clauses:
- GROUP BY
- HAVING
- ORDER BY

### 7.6 String Functions

Used to manipulate and process text values.

**Case Conversion**
- UPPER()
- LOWER()

**Length Functions**
- LENGTH()
- CHAR_LENGTH()

**Extraction Functions**
- SUBSTRING()
- LEFT()
- RIGHT()

**Modification Functions**
- REPLACE()
- REVERSE()
- INSERT()

**Joining Functions**
- CONCAT()
- CONCAT_WS()

**Trimming Functions**
- TRIM()
- LTRIM()
- RTRIM()

**Searching Functions**
- INSTR()
- LOCATE()
- POSITION()

### 7.7 Date Functions

Used to retrieve, format, and manipulate date and time values.

**Current Date and Time**
- CURDATE()
- NOW()
- CURTIME()

**Date Extraction**
- YEAR()
- MONTH()
- DAY()
- DAYNAME()
- MONTHNAME()

**Date Formatting**
- DATE_FORMAT()
- TIME_FORMAT()

**Date Calculation**
- DATEDIFF()
- TIMEDIFF()
- TIMESTAMPDIFF()

**Date Manipulation**
- DATE_ADD()
- DATE_SUB()
- ADDDATE()
- SUBDATE()
- LAST_DAY()

**Date Conversion**
- STR_TO_DATE()
- DATE()
- TIME()

### 7.8 Joins

Used to retrieve related information from multiple tables.

- INNER JOIN – Returns matching records from both tables.
- LEFT JOIN – Returns all records from the left table and matching records from the right table.
- RIGHT JOIN – Returns all records from the right table and matching records from the left table.
- FULL OUTER JOIN – Conceptually returns matching and non-matching records from both tables; MySQL requires combining LEFT and RIGHT JOIN results using UNION.
- CROSS JOIN – Returns combinations of records from both tables.
- SELF JOIN – Joins a table with itself.

### 7.9 Subqueries

A subquery is a query written inside another SQL query. It is also known as an inner query or nested query.

Types implemented:

1. Single Row Subquery
2. Multiple Row Subquery
3. Correlated Subquery

Operators:
- IN
- NOT IN
- ANY
- ALL
- EXISTS
- NOT EXISTS

### 7.10 Views

A view is a virtual table created using an SQL query.

Views implemented include:
- Selected_Candidates – Displays selected candidates with company and job details.
- Active Job Postings – Displays active job postings.

### 7.11 TCL – Transaction Control Language

Used to manage database transactions.

Commands:
- START TRANSACTION / BEGIN
- COMMIT
- ROLLBACK
- SAVEPOINT

### 7.12 Stored Procedures

Stored procedures are reusable SQL programs stored in the database.

Types covered:
- Procedure without parameters
- IN Parameter
- OUT Parameter
- INOUT Parameter

Project implementations:
- Display jobs offered by a particular employer.
- Display applications based on a particular status.

### 7.13 Triggers

Triggers are special stored programs that automatically execute when a specified event occurs on a table.

Types covered:
- BEFORE INSERT
- AFTER INSERT
- BEFORE UPDATE
- AFTER UPDATE
- BEFORE DELETE
- AFTER DELETE

Project implementations:

1. Application Log Trigger:
   Automatically stores application details when a new application is inserted.

2. Interview Archive Trigger:
   Automatically stores deleted interview details in the archive table.

---

## ⚙️ 8. Key Features

- Candidate information management.
- Employer and company information management.
- Job posting and salary management.
- Application tracking and status management.
- Interview scheduling and result tracking.
- Company-wise job analysis.
- Candidate-wise application analysis.
- Selected and rejected candidate identification.
- Automated application logging.
- Interview record archiving.
- Transaction management and data consistency.

---

## 🚀 9. How to Run the Project

Follow these steps to execute the project in MySQL Workbench.

**Step 1: Install MySQL**

Install MySQL Server and MySQL Workbench on your computer.

**Step 2: Open MySQL Workbench**

Connect to your local MySQL server.

**Step 3: Create the Database**

```sql
CREATE DATABASE project;
USE project;
```

**Step 4: Create Tables**

Create the five tables:
- Candidates
- Employers
- Jobs
- Applications
- Interviews

Define primary keys, foreign keys, and required constraints.

**Step 5: Insert Sample Records**

Insert sample data into all five tables.

**Step 6: Execute SQL Queries**

Run the queries covering:
- Data retrieval
- Numeric and string functions
- Date functions
- Aggregate functions
- Joins
- Subqueries
- Views
- TCL
- Stored procedures
- Triggers

**Step 7: Verify Results**

Execute SELECT statements to verify the output of each operation.

---

## 📁 10. Project Folder Structure

```text
Job-Portal-Management-System/
│
├── README.md
│
├── SQL/
│   └── Job_Portal_Management_System.sql
│
├── Documentation/
│   └── Job_Portal_Management_System.pdf
│
└── Presentation/
    └── Job_Portal_Management_System.pptx
```

---

## 🎓 11. Learning Outcomes

Through this project, I gained practical knowledge of:

- Relational database design.
- Creating tables and defining constraints.
- Writing SQL queries for real-world scenarios.
- Retrieving data using joins and subqueries.
- Performing data analysis using aggregate functions.
- Creating reusable views and stored procedures.
- Automating database operations using triggers.
- Managing transactions using TCL commands.
- Understanding relationships between database tables.

---

## 🏁 12. Conclusion

The Job Portal Management System was successfully designed using MySQL with five interconnected relational tables.

The project demonstrates the practical application of SQL concepts in managing recruitment-related information. It provides structured storage and efficient retrieval of candidate, employer, job, application, and interview records.

By implementing advanced SQL concepts such as joins, subqueries, views, stored procedures, triggers, and transaction management, this project provides a strong foundation in relational database management systems.

---

## 👩‍💻 13. Project Contributors

**Sidagam Geethika**

**S. Revathi**

**Domain:** Database Management System  
**Technology:** MySQL  
**Tool:** MySQL Workbench

---

⭐ **If you find this project useful, don't forget to star the repository!**
