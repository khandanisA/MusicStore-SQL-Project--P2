--Create Databse
create database musicstoredb;

--Create Tables

drop table if exists employees;
create table employees(employee_id serial primary key,
                       last_name varchar(50) not null,
					   first_name varchar(50) not null,
					   title varchar(100),
					   reports_to int,
					   levels varchar(50),
					   birthdate date not null,
					   hire_date date not null,
					   address varchar(50) not null,
					   city varchar(50) not null,
					   state varchar(50) not null,
					   country varchar(50) not null,
					   postal_code varchar(50) not null,
					   phone varchar(50) not null,
					   fax varchar(50) not null,
					   email varchar(150) not null
                       );
					   
					   
drop table if exists customers;
create table customers(customer_id serial primary key,
                      first_name varchar(50) not null,
					  last_name varchar(50) not null,
					  company varchar(150),
					  address varchar(100) not null,
					  city varchar(50) not null,
					  state varchar(50),
					  country varchar(50) not null,
					  postal_code varchar(50),
					  phone varchar(100),
					  fax varchar(100),
					  email varchar(200) not null,
					  support_rep_id int,
					  foreign key( support_rep_id) references employees(employee_id)
                      );
					  
drop table if exists invoice;
create table invoice(invoice_id serial primary key,
                     customer_id int not null,
					 invoice_date date not null,
					 billing_address varchar(150) not null,
					 billing_city varchar(50) not null,
					 billing_state varchar(50) not null,
					 billing_country varchar(50) not null,
					 billing_postal_code varchar(50) not null,
					 total numeric(6,2),
					 foreign key(customer_id) references customers(customer_id) 
                     );



					 
--Import data into employees table

copy employees(employee_id,last_name,first_name,title,reports_to,levels,birthdate,hire_date,address,city,state,country,postal_code,phone,fax,email)
from '‪C:\Users\MD DANISH KHAN\OneDrive\Desktop\employee.csv'
delimiter ','
csv header;

--Import data into customers table
copy customers(customer_id,first_name,last_name,company,address,city,state,country,postal_code,phone,fax,email,support_rep_id)
from '‪C:\Users\MD DANISH KHAN\OneDrive\Desktop\customer.csv'
delimiter ','
csv header;

--Import data into invoice table
copy invoice(invoice_id,customer_id,invoice_date,billing_address,billing_city,billing_state,billing_country,billing_postal_code,total)
from '‪C:\Users\MD DANISH KHAN\OneDrive\Desktop\invoice.csv'
delimiter ','
csv header;
-----------------------------------------------------------------------------------------------------------
--Import data into invoice_line table
copy invoice_line(invoice_line_id,invoice_id,track_id,unit_price,quantity)
from '‪C:\Users\MD DANISH KHAN\OneDrive\Desktop\music store data\invoice_line.csv'
delimiter ','
csv header;

--Import data into track table
copy track(track_id,name,album_id,media_type_id,genre_id,composer,milliseconds,bytes,unit_price)
from '‪C:\Users\MD DANISH KHAN\OneDrive\Desktop\track.csv'
delimiter ','
csv header;
