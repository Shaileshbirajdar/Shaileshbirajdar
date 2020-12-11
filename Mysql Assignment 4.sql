create database Assignment4;
use Assignment4;
create table department(
dept_id int(20),
dept_name varchar(20),
constraint PK_department_dept_id primary key(dept_id)
);

create table employee(
empid int(10),
emp_name varchar(20),
dept_id int(20),
salary int(20),
manager int(20),
constraint PK_employee_empid primary key(empid)
);
alter table employee add constraint FK_employee_dept_id foreign key(dept_id) references department(dept_id);
alter table employee add constraint FK_employee_manager foreign key(manager) references employee(empid);
desc employee; 

insert into department value(1	,	'Finance'),
(2	,	'Training'),
(3	,	'Marketing');
insert into employee (empid ,
emp_name ,
dept_id ,
salary )values(1,'Arun',1,	8000);
insert into employee(empid ,
emp_name ,
dept_id ,
salary ) values(2,'kiran',1,7000),
(3,'Scott',1,3000),
(4,'Max',2,9000),	
(5,'Jack',2,8000),
(6,'King',null,6000);

update employee set manager = 4 where empid=1;
update employee set manager = 1 where empid=2;
update employee set manager = 1 where empid=3;
update employee set manager = 4 where empid=5;
update employee set manager = 1 where empid=6;
select *from employee;
select emp_name, dept_name from department join employee on department.dept_id=employee.dept_id;
select * from employee join department on department.dept_id= employee.dept_id;
select department.dept_id,sum(salary)from department left join employee on department.dept_id=employee.dept_id group by department.dept_id; 
select emp_name,dept_name from department left join employee on department.dept_id=employee.dept_id; 
select emp_name,dept_name from department right join employee on department.dept_id=employee.dept_id;
select emp_name,dept_name from employee left join department on department.dept_id=employee.dept_id;
create table emp1 (emp_no int(3), emp_name varchar(3));
  insert into emp1 values(1,'A');
  insert into emp1 values(2,'B');
   insert into emp1 values(3,'C');
   create table emp2(emp_no int(4), emp_name varchar(4));
   insert into emp2 values(1,'A');
   insert into emp2 values(2,'B');
   insert into emp2 values(4,'D');
   insert into emp2 values(5,'E');
   select * from emp1 union select* from emp2;
select emp_name from employee where salary=(select salary from employee where emp_name='arun');
select emp_name from employee where dept_id=(select dept_id from employee where emp_name='jack');
select emp_name from employee where salary=(select min(salary) from employee);
update  employee set salary =15000 where dept_id=(select dept_id where emp_name= 'Max');
select * from employee;  

