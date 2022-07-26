show databases;
create database car_sales;
use car_sales;
create table sales_team
(Emp_number int, Car_Dealer_First_Name varchar(50),Car_Dealer_Last_Name varchar(50), Monthly_Target int);

select 1 from dual;

create table Sales_Data
(Customer_manager_ID int(50),Customer_Name varchar(50),Customer_Car_Code int(50),Deposit_paid_for_booking int(50));

select '12134' as e, 'Ajay' as f, 'Alex' as l,  '100000' as t from dual union
select '18164', 'Mary', 'Jones',  '300000' from dual union
select '12110', 'Kiara', 'Shetty',  '200000' from dual;

insert into sales_team
select '12134' as e, 'Ajay' as f, 'Alex' as l,  '100000' as t from dual union
select '18164', 'Mary', 'Jones',  '300000' from dual union
select '12110', 'Kiara', 'Shetty',  '200000' from dual;

create table cars_data
(Car_Code int(50),Car_Name varchar(50),Car_Price int(50));

insert into sales_data
select '12134', 'Rodger', '18163', '10000' from dual union
select '12110', 'Amit', '16188', '12000' from dual union
select '12134', 'Ashish', '16188', '11980' from dual union
select '18164', 'Kale', '19182', '9400' from dual union
select '12110', 'Cagatay', '21199', '13430' from dual union
select '12110', 'Ryan', '21199', '15433' from dual union
select '18164', 'Akash', '16188', '17340' from dual;

insert into cars_data
select '18163', 'Series 1', '15000' from dual union
select '16188', 'Series 6', '30000' from dual union
select '19182', 'Series 5', '25000' from dual union
select '21199', 'Series 4', '20000' from dual;

select CONCAT(Car_Dealer_First_Name,' ',Car_Dealer_Last_Name),Sum(Deposit_paid_for_booking) 
from Sales_Team JOIN sales_data on (Emp_number = Customer_manager_ID ) group by Emp_number;

select CONCAT(Car_Dealer_First_Name,' ',Car_Dealer_Last_Name) as FULL_EMP_NAME, 
Sum(Deposit_paid_for_booking) as TOTAL_DEPOSITS from Sales_Team 
JOIN sales_data on (Emp_Number = Customer_manager_ID )
group by Emp_Number;


select 
CONCAT(Car_Dealer_First_Name,' ',Car_Dealer_Last_Name) as FULL_EMP_NAME, 
Sum(Car_Price) as TOTAL_SALES 
from Sales_Team JOIN sales_data on (Emp_Number = Customer_manager_ID )
JOIN Cars_Data on ( Customer_Car_Code = Car_Code )
group by Emp_Number;

select 
CONCAT(Car_Dealer_First_Name,' ',Car_Dealer_Last_Name) as FULL_EMP_NAME, 
Sum(Car_Price) as TOTAL_SALES,
((Monthly_target -  Sum(Car_Price))/Monthly_target)*100
from Sales_Team JOIN sales_data on (Emp_number = Customer_manager_ID ) 
JOIN Cars_Data on ( Customer_Car_Code = Car_Code );

select 
CONCAT(Car_Dealer_First_Name,' ',Car_Dealer_Last_Name) as FULL_EMP_NAME, 
Sum(Car_Price) as TOTAL_SALES,
CONCAT(((Monthly_target -  Sum(Car_Price))/Monthly_target)*100,'%') 
from Sales_Team JOIN sales_data on (Emp_number = Customer_manager_ID ) 
JOIN Cars_Data on ( Customer_Car_Code = Car_Code )
group by Emp_number,Monthly_target;

select 
Car_Name,Count(*) from sales_data JOIN Cars_Data on ( Customer_Car_Code = Car_Code )
group by Car_Code;

select 
Car_Name,Count(*) as frequency from sales_data JOIN Cars_Data on ( Customer_Car_Code = Car_Code )
group by Car_Code;


select 
CONCAT(Car_Dealer_First_Name,' ',Car_Dealer_Last_Name) as CAR_DEALER_FULL_NAME, 
CUSTOMER_NAME,
CAR_NAME,
CAR_PRICE,
Deposit_paid_for_booking as DEPOSIT_GIVEN,
(CAR_PRICE-Deposit_paid_for_booking) as AMOUNT_LEFT
from Sales_Team JOIN sales_data on (Emp_number = Customer_manager_ID ) 
JOIN Cars_Data on ( Customer_Car_Code = Car_Code );


select CONCAT(Car_Dealer_First_Name,' ',Car_Dealer_Last_Name) as FULL_EMP_NAME, 
MIN(Deposit_paid_for_booking) as MINIMUM_DEPOSITS 
from Sales_Team JOIN sales_data on (Emp_number = Customer_manager_ID ) 
group by Emp_number;



select 
Car_Code,
CONCAT((Sum(Car_Price)/Monthly_target)*100,'%') as percetage_each_car
from Sales_Team JOIN sales_data on (Emp_number = Customer_manager_ID ) 
JOIN Cars_Data on ( Customer_Car_Code = Car_Code )
where Emp_number = '12134'
group by Car_Code;
