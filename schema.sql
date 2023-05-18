drop table if exists Titles;
CREATE TABLE Titles (
	Title_id varchar primary key unique NOT NULL,
	title varchar
);

drop table if exists Employee;
CREATE TABLE Employee (
	Employee_id int primary key Unique NOT NULL,
	Employee_title varchar(15) references Titles(Title_id),
	birth_date DATE NOT NULL,
	first_name varchar(30) NOT NULL,
	last_name varchar(30) NOT NULL,
	sex varchar,
	hire_date DATE
);

CREATE TABLE Salaries (
	emp_no int primary key references Employee(Employee_id),
	salary int
);

CREATE TABLE Departments (
	Dept_no varchar primary key unique NOT NULL,
	Dept_name varchar
);

Drop table if exists Dept_mgr;
CREATE TABLE Dept_mgr (
	dept_id varchar(10) NOT NULL,
	foreign key (dept_id) references Departments(dept_no),
	emp_no int,
	Foreign key (emp_no) references Employee(Employee_id),
	primary key (dept_id, emp_no)
);
Drop table if exists Dept_emp;
CREATE TABLE Dept_emp (
	Emp_no int,
	dept_no varchar,
	foreign key (Emp_no) references Employee(Employee_id),
	foreign key (dept_no) references Departments(dept_no),
	primary key (emp_no, dept_no)
);



select * from dept_mgr