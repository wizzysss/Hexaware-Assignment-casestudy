										
											--Task 1. Database Design:


	/*1. Create the database named "SISDB"*/

	--Creating database on SIS

	CREATE DATABASE SISDB

	--Switching to the SISDB

	USE SISDB

	/*2. Define the schema for the Students, Courses, Enrollments, Teacher, and Payments tables based
	on the provided schema. Write SQL scripts to create the mentioned tables with appropriate data
	types, constraints, and relationships.
	a. Students
	b. Courses
	c. Enrollments
	d. Teacher
	e. Payments*/

	--Creating Students table from schema

	CREATE TABLE Students (
		student_id INT PRIMARY KEY,
		first_name VARCHAR(50),
		last_name VARCHAR(50),
		date_of_birth DATE,
		email VARCHAR(100),
		phone_number VARCHAR(20)
	)

	--Creating Teacher table from schema

	CREATE TABLE Teacher (
		teacher_id INT PRIMARY KEY,
		first_name VARCHAR(50),
		last_name VARCHAR(50),
		email VARCHAR(100)
	);

	--Creating Courses table from schema

	CREATE TABLE Courses (
		course_id INT PRIMARY KEY,
		course_name VARCHAR(100),
		credits INT,
		teacher_id INT,
		FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id)
	);

	--Creating Enrollments table from schema

	CREATE TABLE Enrollments (
		enrollment_id INT PRIMARY KEY,
		student_id INT,
		course_id INT,
		enrollment_date DATE,
		FOREIGN KEY (student_id) REFERENCES Students(student_id),
		FOREIGN KEY (course_id) REFERENCES Courses(course_id)
	);

	--Creating Payments table from schema

	CREATE TABLE Payments (
		payment_id INT PRIMARY KEY,
		student_id INT,
		amount DECIMAL(10, 2),
		payment_date DATE,
		FOREIGN KEY (student_id) REFERENCES Students(student_id)
	);

	select * from Payments

	/* 3. Create an ERD (Entity Relationship Diagram) for the database. */

	--it can be generated from MSSQL itself

	/* 4. Create appropriate Primary Key and Foreign Key constraints for referential integrity. */

	--its is done on creating the table itself
	--if you haven't done there you can use alter to alter the column as referential key

	--example below
	/*ALTER TABLE Payments
	ADD CONSTRAINT fk_student_id
	FOREIGN KEY (student_id) REFERENCES Students(student_id);*/

	/*5. Insert at least 10 sample records into each of the following tables.
	i. Students
	ii. Courses
	iii. Enrollments
	iv. Teacher
	v. Payments
	*/

	--inserting 10 records in student table

	INSERT INTO Students (student_id, first_name, last_name, date_of_birth, email, phone_number)
	VALUES
	(1, 'Aravindh', 'Loganathan', '2003-04-15', 'aravindh@gmail.com', '9087654321'),
	(2, 'Muthuvel', 'Pandiyan', '2002-08-22', 'Tigerkahukum@gmail.com', '9467234321'),
	(3, 'Joseph', 'Kuruvilla', '2002-12-03', 'joseph@gmail.com', '7448654321'),
	(4, 'Jeevanandham', 'Mersal', '2003-06-18', 'jeevanandham@gmail.com', '9011384321'),
	(5, 'Dhanush', 'R', '2002-09-28', 'dhanushr@gmail.com', '9582356321'),
	(6, 'Ragul', 'R', '2003-03-12', 'ragulbhai@gmail.com', '9087654321'),
	(7, 'Gayathri', 'M', '2002-11-25', 'gaythriMurugu@gmail.com', '8187654321'),
	(8, 'Manoj', 'Selvan', '2003-07-08', 'manjoyselvan009@gmail.com', '7087654321'),
	(9, 'karthik', 'Raj', '2002-02-20', 'karthikrajv@gmail.com', '8087654321'),
	(10, 'Santhosh', 'V', '2002-05-30', 'santhoshv@gmail.com', '7723654321');


	select * from Students

	--insert teacher record on teacher table

	INSERT INTO Teacher (teacher_id, first_name, last_name, email)
	VALUES
	(1, 'Arun', 'Kumar', 'arun.kumar92@gmail.com'),
	(2, 'Priya', 'Natarajan', 'priya.natarajan85@gmail.com'),
	(3, 'Karthik', 'Raju', 'karthik.raju79@gmail.com'),
	(4, 'Deepa', 'Menon', 'deepa.menon88@gmail.com'),
	(5, 'Rajesh', 'Iyer', 'rajesh.iyer76@gmail.com'),
	(6, 'Ananya', 'Desai', 'ananya.desai91@gmail.com');

	select * from Teacher

	-- inserting 4 more teacher 

	INSERT INTO Teacher (teacher_id, first_name, last_name, email)
	VALUES
	(7, 'Manikandan', 'Vel', 'mani.vel@gmail.com'),
	(8, 'Santhiya', 'Naresh', 'santhiya.naresh@gmail.com'),
	(9, 'buji', 'babu', 'bujikutty@gmail.com'),
	(10, 'sangeetha', 'manoj', 'sangeetha.manoj@gmail.com');


	--inserting records for course table

	INSERT INTO Courses (course_id, course_name, credits, teacher_id)
	VALUES
	(1, 'Information Technology', 3, 1),
	(2, 'Electronics and Communication Engineering', 4, 2),
	(3, 'Mechanical Engineering', 3, 3),
	(4, 'Civil Engineering', 3, 4),
	(5, 'Electrical and Electronics Engineering', 4, 5),
	(6, 'Artificial Intelligence', 3, 6);

	select * from Courses

	--inserting 4 more records on subject

	INSERT INTO Courses (course_id, course_name, credits, teacher_id)
	VALUES
	(7, 'Business Science', 3, 7),
	(8, 'Tamil Literature', 4, 8),
	(9, 'Architecture', 3, 9),
	(10, 'Mechatronics', 4, 10);

	--inserting records in enrollment table

	INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
	VALUES
	(1, 1, 1, '2023-09-15'),
	(2, 2, 2, '2023-10-20'),
	(3, 3, 2, '2023-11-25'),
	(4, 4, 4, '2024-01-05'),
	(5, 5, 3, '2024-02-10'),
	(6, 6, 6, '2023-09-30'),
	(7, 7, 1, '2023-10-15'),
	(8, 8, 5, '2024-01-20'),
	(9, 9, 3, '2024-02-25'),
	(10, 10, 4, '2023-11-10');

	select * from Enrollments

	--insrting payments records for payment table

	INSERT INTO Payments (payment_id, student_id, amount, payment_date)
	VALUES
	(1, 1, 10000, '2023-09-15'),
	(2, 2, 15000, '2023-10-20'),
	(3, 3, 15000, '2023-11-25'),
	(4, 4, 12000, '2024-01-05'),
	(5, 5, 18000, '2024-02-10'),
	(6, 6, 13000, '2023-09-30'),
	(7, 7, 10000, '2023-10-15'),
	(8, 8, 11000, '2024-01-20'),
	(9, 9, 18000, '2024-02-25'),
	(10, 10, 12000, '2023-11-10');

	select * from payments

	-- 10 sample records are inserted for every tables


								--Tasks 2: Select, Where, Between, AND, LIKE: 


	/*1. Write an SQL query to insert a new student into the "Students" table with the following details:
	a. First Name: John
	b. Last Name: Doe
	c. Date of Birth: 1995-08-15
	d. Email: john.doe@example.com
	e. Phone Number: 1234567890*/

	-- inserting the new student
	select * from Students

	INSERT INTO Students (student_id,first_name,last_name,date_of_birth,email,phone_number) 
	VALUES (11,'John','Doe','1995-08-15','john.doe@example.com', '1234567890');

	--student record inserted now

	/*2. Write an SQL query to enroll a student in a course. Choose an existing student and course and
	insert a record into the "Enrollments" table with the enrollment date.*/

	select * from Enrollments

	-- I select the 1st student Aravindh to enroll in Artificial Intelligence course

	INSERT INTO Enrollments (enrollment_id,student_id,course_id,enrollment_date)
	VALUES (11,1,6,'2024-02-28');

	--enrollment addded now

	/*3. Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and
	modify their email address.*/

	select * from Teacher

	-- I select Priya to update email from priya.natarajan85@gmail.com to priyan@gmail.com

	UPDATE Teacher set email = 'priyan@gmail.com' where teacher_id = 2;

	--email is updated now

	/*4. Write an SQL query to delete a specific enrollment record from the "Enrollments" table. Select
	an enrollment record based on the student and course*/

	select * from Enrollments

	--i deleted the enrollment record of Aravindh who is 1 in student id from AI course which is 6 in course id

	DELETE FROM Enrollments WHERE student_id = 1 AND course_id = 6

	--the record is deleted now

	/*5. Update the "Courses" table to assign a specific teacher to a course. Choose any course and
	teacher from the respective tables.*/

	select * from Courses

	select* from Teacher

	--updating tamil literature course to Deepa teacher who is civil course teacher(her teacher id is 4)

	UPDATE Courses SET teacher_id = 4 WHERE teacher_id =8;

	--now it tamil literature course is update to teacher_id 4 who is Deepa Menon

	/*6. Delete a specific student from the "Students" table and remove all their enrollment records
	from the "Enrollments" table. Be sure to maintain referential integrity.*/

	select * from Students;

	select * from Enrollments;
	-- Rightclick Table  >New Column > Right click Foreign Key column name > Relationship > 
	-- Right Down corner Insert and update specifications > Drop down > Cascade > close

	DELETE FROM Students WHERE student_id = 11;

	--by this i can ensure the referential integrity

	/*7. Update the payment amount for a specific payment record in the "Payments" table. Choose any
	payment record and modify the payment amount.*/

	select * from Payments

	-- i choose 6th payment_id record to change from 13000 to 20000

	UPDATE Payments SET amount = 20000 where payment_id = 6

	--now its updated from 13000 to 20000 in amount column


						--Task 3. Aggregate functions, Having, Order By, GroupBy and Joins:


	/*1. Write an SQL query to calculate the total payments made by a specific student. You will need to
	join the "Payments" table with the "Students" table based on the student's ID.*/

	select * from Payments

	select * from Students

	--lets take student id 10

	select sum(amount) from Payments as p join Students as s  on p.student_id =p.student_id where p.student_id =10 


	/*2. Write an SQL query to retrieve a list of courses along with the count of students enrolled in each
	course. Use a JOIN operation between the "Courses" table and the "Enrollments" table.*/

	select * from Courses

	select * from Enrollments

	select c.course_name , count (e.student_id) as student_count from Courses as c join Enrollments as e on c.course_id=e.course_id
	group by c.course_name order by student_count

	/*3. Write an SQL query to find the names of students who have not enrolled in any course. Use a
	LEFT JOIN between the "Students" table and the "Enrollments" table to identify students
	without enrollments.*/

	select * from Enrollments

	select * from Students

	select CONCAT_WS(' ',first_name,last_name) as studentName from Students as s left join Enrollments as e 
	on s.student_id = e.student_id where e.student_id is null


	/*4. Write an SQL query to retrieve the first name, last name of students, and the names of the
	courses they are enrolled in. Use JOIN operations between the "Students" table and the
	"Enrollments" and "Courses" tables.*/


	select s.first_name,s.last_name,c.course_name from Students as s join Enrollments as e on s.student_id=e.student_id 
	join Courses as c on e.course_id = c.course_id


	/*5. Create a query to list the names of teachers and the courses they are assigned to. Join the
	"Teacher" table with the "Courses" table.*/

	select CONCAT_WS(' ',first_name,last_name) as [name] , c.course_name from Teacher as t join Courses as c
	on t.teacher_id = c.teacher_id


	/*6. Retrieve a list of students and their enrollment dates for a specific course. You'll need to join the
	"Students" table with the "Enrollments" and "Courses" tables.*/

	select CONCAT_WS(' ',first_name,last_name),e.enrollment_date from Students as s join Enrollments as e
	on s.student_id = e.student_id join Courses as c on e.course_id = c.course_id order by e.enrollment_date

	-- for above query i also added orderby to make sure the order od the entrollment date as in order

	/*7. Find the names of students who have not made any payments. Use a LEFT JOIN between the
	"Students" table and the "Payments" table and filter for students with NULL payment records.*/

	select CONCAT_WS(' ',first_name,last_name) as [Name] from Students as s left join Payments as p on s.student_id=p.student_id
	where p.amount is null

	/*8. Write a query to identify courses that have no enrollments. You'll need to use a LEFT JOIN
	between the "Courses" table and the "Enrollments" table and filter for courses with NULL
	enrollment records.*/

	select c.course_name from Courses as c left join Enrollments as e on c.course_id = e.course_id 
	where e.course_id is null

	/*9. Identify students who are enrolled in more than one course. Use a self-join on the "Enrollments"
	table to find students with multiple enrollment records*/

	select s.student_id, count(e.enrollment_id) as Coursenumber from Enrollments s 
	join Enrollments e  on s.enrollment_id=e.enrollment_id group by s.student_id having count(e.enrollment_id)>1

	/*10. Find teachers who are not assigned to any courses. Use a LEFT JOIN between the "Teacher"
table and the "Courses" table and filter for teachers with NULL course assignments.*/


select * from teacher
select * from Courses

select CONCAT_WS(' ',first_name,last_name) as [name] from Teacher as t left join Courses as c on t.teacher_id = c.teacher_id
where c.teacher_id is null



									--Task 4. Subquery and its type:
									

/*1. Write an SQL query to calculate the average number of students enrolled in each course. Use
aggregate functions and subqueries to achieve this.*/

select * from Courses

select avg(base.total) as [avg] FROM
(select count(student_id) as total,course_id from Enrollments group by course_id) as base


/*2. Identify the student(s) who made the highest payment. Use a subquery to find the maximum
payment amount and then retrieve the student(s) associated with that amount.*/

select * from Payments

select student_id,sum(amount) as totalAmount from PAYMENTS group by student_id having sum(amount)= 
(select MAX(payList.total) as [MaxAmount] From
(select sum(amount) as [total] from PAYMENTS group by student_id)as payList)


/*3. Retrieve a list of courses with the highest number of enrollments. Use subqueries to find the
course(s) with the maximum enrollment count.*/


select course_id,COUNT(enrollment_id) as Number from ENROLLMENTS group by course_id having count(enrollment_id) =
(select max(sub.total) from (select count(enrollment_id) as total from ENROLLMENTS group by course_id)sub)


/*4. Calculate the total payments made to courses taught by each teacher. Use subqueries to sum
payments for each teacher's courses.*/

select t.teacher_id,(select sum(p.amount) from Payments p join Enrollments e on p.student_id=e.student_id
join COURSES c on e.course_id=c.course_id where t.teacher_id=c.teacher_id)as Total from Teacher t


/*5. Identify students who are enrolled in all available courses. Use subqueries to compare a
student's enrollments with the total number of courses.*/


select student_id from ENROLLMENTS group by student_id having count(enrollment_id)=
(select count(course_id) from COURSES)



/*6. Retrieve the names of teachers who have not been assigned to any courses. Use subqueries to
find teachers with no course assignments.*/


select CONCAT_WS(' ',first_name,last_name) as [name] from Teacher where teacher_id 
not in (select teacher_id from Courses where Courses.teacher_id=Teacher.teacher_id)

--sub query cant be executed induvidully as the sub query dependent on the outer query's table name


/*7. Calculate the average age of all students. Use subqueries to calculate the age of each student
based on their date of birth.*/

select avg(Allage.age) as [avg age] from (select DATEDIFF(year,date_of_birth,GETDATE()) -
case when DATEADD(year, DATEDIFF(year,date_of_birth,GETDATE()),date_of_birth) > GETDATE() then 1
else 0 end as age from STUDENTS)Allage

--inner sub query will give all ages 

/*8. Identify courses with no enrollments. Use subqueries to find courses without enrollment
records.*/
select * from Enrollments
select * from Courses

select course_name from Courses where course_id not in (select distinct course_id from ENROLLMENTS)

--distinct course_id will give distinct course not duplicates


/*9. Calculate the total payments made by each student for each course they are enrolled in. Use
subqueries and aggregate functions to sum payments.*/

select * from Students

select s.student_id,c.course_id,sum(p.amount) as [Total payments] from students s join enrollments e 
on s.student_id = e.student_id JOIN courses c on e.course_id = c.course_id join payments p on e.student_id = p.student_id
group by s.student_id,c.course_id


/*10. Identify students who have made more than one payment. Use subqueries and aggregate
functions to count payments per student and filter for those with counts greater than one.*/


select * from Payments

select student_id from Payments group by student_id having count(*) > 1;  --without subquery

select student_id from (select student_id, count(*) AS payment_count from Payments group by student_id) as payment_counts 
where payment_count > 1;   --withsubquery


/*11. Write an SQL query to calculate the total payments made by each student. Join the "Students"
table with the "Payments" table and use GROUP BY to calculate the sum of payments for each
student.*/

select s.student_id,sum(p.amount) as totalamount from Students s join Payments p 
on s.student_id=p.student_id group by s.student_id


/*12. Retrieve a list of course names along with the count of students enrolled in each course. Use
JOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY to
count enrollments.*/

select c.course_name,count(e.student_id) as [no of students] from COURSES c join ENROLLMENTS e 
on c.course_id=e.course_id group by c.course_name

/*13. Calculate the average payment amount made by students. Use JOIN operations between the
"Students" table and the "Payments" table and GROUP BY to calculate the average.*/


select avg(p.amount) as avgerage from Students s join Payments p 
on s.student_id=p.student_id
