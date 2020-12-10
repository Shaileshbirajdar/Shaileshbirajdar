create database Assignment_5;
use Assignment_5;
show tables;

create table emp(empno int, ename varchar(20),job varchar(20),mgr varchar(20),hiredate date,sal int,dno int);
insert into emp values(1000,'manish','salesman',1003,'2020-02-18',600,30);
insert into emp values(1001,'manoj','salesman',1003,'2020-02-18',600,30);
insert into emp values(1002,'ashish','salesman',1003,'2020-02-18',750,30);
insert into emp values(1004,'rekha','analyst',1006,'2020-02-18',3000,10);
insert into emp values(1005,'sachin','analyst',1006,'2020-02-18',3000,10);
insert into emp values(1006,'pooja','manager',null,'2020-02-18',6000,10);
select * from emp;

Create table dept (dno int, dname varchar(10),area varchar(30));
select * from dept;
desc dept;
Insert into dept values(10,'Store','Mumbai');
Insert into dept values(20,'Purchase','Mumbai');
Insert into dept values(30,'Store', 'Delhi');
Insert into dept values(40,'Marketing','Pune');
Insert into dept values(50,'Finance','Delhi');
Insert into dept values(60,'Accounts','Mumbai');
select * from dept;
/*#1.	Write a Procedure that accepts values of two non-zero numbers using IN parameter and perform addition, subtraction, multiplication, division and print.*/
delimiter $$
create procedure ques1(num1 int, num2 int)
b1:begin
declare Addition, Subtraction, Multiplication, Division int;
set Addition=num1 + num2;
set Subtraction=num1-num2;
set Multiplication= num1*num2;
set Division = num1/num2;
select Addition, subtraction, Multiplication, Division;
end$$
call ques1(40,20);

#2.Write a Procedure to print the string in REVERSE order. Take the input using IN parameter. (Ex .Database , o/p :esabatad)
delimiter $$
create procedure ques2(in str varchar(20))
begin
select reverse(str);
end$$

call ques2('Shailesh');
#3.	Write a Procedure to display top 5 employee based on highest salary and display employee number, employee name and salary.
delimiter $$
create procedure emp_top_sal(in num int)
begin
select empno,ename,sal from emp order by sal desc limit num;
end $$

call emp_top_sal(5);
#4.	Write a Procedure to create table emp_test with e_id integer, e_name varchar(10), e_joining_date date as columns
delimiter $$
create procedure ques4()
begin
create table emp_test(e_id int, e_name varchar(10), e_joining_date date);
select * from emp_test;
end$$
call ques4();
drop procedure ques4;
desc emp_test;
#5.	Write a Procedure to add a department row in the DEPT table with the following values for columns
#deptno  value 60,Dname  value should be  ‘Education’, area value should be Pune. 
delimiter $$
create procedure add_dep()
begin
insert into dept values(60,'Education','pune');
select * from dept;
end $$
call add_dep();
#6.	Write a program that declares an integer variable called num, assigns a value to it and print, 
#the value of the variable itself, its square, and its cube.
delimiter $$
create procedure square_cube(in num int)
begin
declare num1,square,cubes int;
set num1=num;
set square=num*num;
set cubes=num*num*num;
select num1,square,cubes;
end $$
call square_cube(2);

#7.	Write a program that declares an integer variable assign a value to it and display it 
# using OUT parameter
delimiter $$
create procedure out_para(out val int)
begin
set val=10;
select val;
end$$
call out_para(@val);
drop procedure out_para
#8.	Write a program that demonstrates the usage of IN and OUT parameters question 8
delimiter $$
create procedure que8(inout num int)
begin
set num=num*num;
end $$
set @print=2;
call que8(@print);
select @print;
