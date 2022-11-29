create table Bookstore(
Book_ID int not null,
Book_Name varchar(20),
Author varchar(20),
Price int,
Sales int,
City varchar(20)
primary key(Book_ID)
)
select * from Bookstore
insert into Bookstore values
(1,'Oliver Twist','Charles Darwin',350,25000,'Hyderabad'),
(2,'Pinjar','Amrita Pritam',150,10000,'Kolkata'),
(3,'A Suitable Boy','Vikram Seth',200,14500,'Mumbai'),
(4,'War and Peace','Leo Tolstoy',500,35000,'New York'),
(5,'Apple Cart','George Bernard Shaw',400,28000,'Perth');

select * from Bookstore

insert into Bookstore values
(6,'Benhur','Lewis Wallace',450,25500,'Los Angeles'),
(7,'Das Captial','Karl Marx',850,40000,'Rome'),
(8,'Coolie','Mulk Raj Anand',300,12500,'Pune'),
(9,'Gullivers Travels','Jonathan Swift',500,50000,'London'),
(10,'Jungle Book','Ruskin Bond',470,45000,'Cairo');

select * from Bookstore

insert into Bookstore values
(11,'Childhood','Leo Tolstoy',350,25000,'Moscow'),
(12,'Untouchable','Mulk Raj Anand',300,23000,'Delhi'),
(13,'Dollar Bahu','Sudha Murthy',250,25000,'Pune'),
(14,'Resurrection','Leo Tolstoy',400,32000,'Zurich'),
(15,'On Religion','Karl Marx',500,35000,'London');

select * from Bookstore

--most expensive book
select Book_Name,Price from Bookstore where price = (select max(Price) from Bookstore)


--nth expensive book
select Book_Name,Price from(
	select ROW_NUMBER() over(order by Price desc) as row_num,Bookstore.Price,Bookstore.Book_Name
		from(select  Price,Book_Name from Bookstore)bookstore) result
			where row_num=@N




--Highest Sales
Select Book_Name,Author from Bookstore where Sales=(select max(Sales) from Bookstore)


--Price range btw 250 and 500
select Book_Name,Author from Bookstore where price between 250 and 500


--List of Books 1.Sales more than 30000 2.Price greater than 500

select * from Bookstore where Sales>40000 or Price>500;-->excludes the null values


select *,
	case when Price>500 then Sales
	else(case when Sales>40000 then Sales else 0 end) end as Book_List
	from Bookstore;--->includes the null values

select * from Bookstore where Sales>30000

---Query to find all the books sold in London and sales more than 40000
select Book_Name from Bookstore where city='London' and sales>40000


--Query to find the books that contains letter 'U' and price btw 200 and 500 arrange the result set in descending order of the price if price is same arrange alphabetical order
select Book_Name,Author,Price from Bookstore 
where Book_Name like '%a%' and Price between 200 and 500 
order by price desc,Book_Name asc


--Query to find the max_length book name and min_length book name
declare @small int
declare @large int
select @small=min(len(Book_Name)) from Bookstore
select @large=max(len(Book_Name)) from Bookstore
select top 1 Book_Name from Bookstore where len(Book_Name)=@small order by Book_Name asc
select top 1 Book_Name from Bookstore where len(Book_Name)=@large order by Book_Name desc








