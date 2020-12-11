create database assignment6;
use assignment6;
create table emp1(epm_name varchar(30),salary int,dept_no int);
insert into emp1 values('prafulla',5000,1);
insert into emp1 values('pranit',10000,2);
insert into emp1 values('prabhanshu',20000,3);
insert into emp1 values('pranav',15000,4);
select * from emp1;

--question 1)	Write function that accepts a positive number from a user and displays its factorial on the screen.
delimiter $$
create function assg(num int) returns int
begin
declare res int default 1;
factorial : loop
if(num = 0)
then
return res;
leave factorial;
end if;
set res=res * num;
set num=num - 1;
end loop;
end $$
select assg(5);

delimiter $$
create function assg2(num int) returns varchar(20)
begin
declare count int default 2;
shailesh : loop
if (count > num)
then
return "prime number";
leave shailesh;
elseif (num % count = 0 && num != count)
then
return "not prime";
leave shailesh;
else
set count = count +1 ;
end if;
end loop;
end $$
select assg2(13);
drop function assg2;

delimiter $$
create function Que03( val int(20)) returns varchar(200)
begin

return concat(val ,' inches ', round(val/36),' yards ',round(val/12),' foot ');
end;$$

 -- drop function Que03;

select Que03(124);

DELIMITER $$
CREATE FUNCTION CONVERT_1(VAR1 INT ) RETURNS VARCHAR(500)
BEGIN
DECLARE NUM1 INT;
DECLARE NUM2 INT;
DECLARE TEMP INT;
SET NUM1= VAR1/36;
SET TEMP = VAR1 % 36;
SET NUM2 = TEMP / 12;
SET TEMP = TEMP % 12;
RETURN CONCAT(NUM1, ' YARD ',NUM2,' FOOT ' ,TEMP,' INCHES ' );
END $$
SELECT CONVERT_1(124);

#Question 4 Write a function to update salary of the employees of specified dept by 10%. Take dept no as parameter.
delimiter $$
create function assg4(num int) returns varchar(30)
begin
update emp1 set salary= salary+(salary*0.10) where dept_no= num;
return "update sucessfully";
end$$
select assg4(3);
select* from emp1;
drop function assg4;

#Question 5 5.	Create a function named USER_ANNUAL_COMP that has a parameter p_eno for passing on the values of  an employee number of the employee and p_comp for passing the compansation. In the function calculates and returns the annual compensation of the employee by using the following formula.
annual_compensation =  (p_sal+p_comm)*12
If the salary or commission value is NULL then zero should be substituted for it.  Give a call to USER_ANNUAL_COMP.
delimiter $$
create function USER_ANNUAL_COMP (p_eno int,p_coom int) returns int
begin
declare res int;
set res= (select salary from emp1 where dept_no=p_eno);
return (res + p_coom)*12;
end $$
select USER_ANNUAL_COMP(1,100);
select* from emp1;
drop function USER_ANNUAL_COMP;

#6.	Create a procedure called USER_QUERY_EMP that accepts three parameters. Parameter p_myeno is of IN parameter mode which provides the empno value. The other two parameters p_myjob and p_mysal are of OUT mode. The procedure retrieves the salary and job of an employee with the provided employee number and assigns those to the two OUT parameters respectively. The procedure should raise the error if the empno does not exist in the EMP table by displaying an appropriate message
delimiter $$
create procedure USER_QUERY_emp1(in p_myeno int, out p_myjob varchar (20), out p_mysal int)
begin
set p_myjob= (select epm_name from emp1 where dept_no=p_myeno);
set p_mysal= (select salary from emp1 where dept_no=p_myeno);
end$$
drop procedure USER_QUERY_emp1;
call USER_QUERY_emp1(2,@job,@salary);
drop procedure USER_QUERY_emp1;
select @job,@salary;
select* from emp1;

#7.	Create a procedure to print the inputted string in reverse order. If  inputted string is null display an appropriate message
/========================
delimiter $$
create procedure pr (inout str varchar(30))
begin
set str=reverse(str);
end $$
set @str="shailesh";
call pr(@str);
select @str;

#8.	Create a procedure named ‘tabledetails’ which gives all the details of a particular table stored in database.
delimiter $$
create procedure tabledetails()
begin
show tables;
select * from emp;
end$$
call tabledetails();

