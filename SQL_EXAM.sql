#Q1. Database & Table Creation (5 marks) 

create database CollegeDB;

USE CollegeDB;

create table Students(
	student_id int not null auto_increment primary key,
    name VARCHAR(50) NOT NULL,
    age INT check(age>16),
    district VARCHAR(30),
    gender varchar(1) check(gender in('M','F','O')),
    marks DECIMAL(5,2)
)auto_increment=1;


#Q2. Data Insertion (3 marks)

INSERT INTO Students(name, age, district, gender,marks)
VALUES('Sita',18,'Kathmandu','F',88.50),
('Ram',20,'Lalitput','M',75.00),
('Asha',19,'Bhaktapur','F',92.00),
('Bikash',21,'Pokhara','M',81.25),
('Prakash',22,'Chitwan','M',67.50);

Select * from students;

#Q3. Debugging – Table Creation Error (3 marks) 

CREATE TABLE Teachers ( 
teacher_id INT PRIMARY KEY AUTO_INCREMENT, 
tname VARCHAR(30) NOT NULL, 
salary FLOAT, 
department VARCHAR(20) 
);


#Q4. Show all students who scored more than 80, sorted by marks (descending). (3 marks)

SELECT * FROM Students WHERE marks>80 ORDER BY marks DESC;

#Q5. Find the average marks grouped by gender. (5 marks)

SELECT gender, AVG(marks) as avg_marks FROM Students GROUP BY gender;

#Q6. Show only the genders with average marks greater than 80. (4 marks) 

SELECT gender from Students group by gender having AVG(marks)>80;

#Q7. a) Display the top 2 students with highest marks. (2 marks) 

SELECT name, marks from Students order by marks desc limit 2;

#Q7. b) Display students whose marks are greater than the average marks of all students. (5 marks) 
SELECT name,marks from Students where marks>( select avg(marks) from Students) order by marks desc;

#Q8.  (8 marks) Display student name with course enrolled.
CREATE TABLE Courses ( 
course_id INT auto_increment PRIMARY KEY, 
course_name VARCHAR(50), 
student_id INT, 
FOREIGN KEY (student_id) REFERENCES Students(student_id) 
)auto_increment=101; 


select * from Courses;

INSERT INTO Courses(course_name, student_id)
VALUES('BSc CSIT',1),
('BBA',2),
('BSc CSIT',3),
('BHM',4);

SELECT Students.name, Courses.course_name from Students 
JOIN Courses ON
Students.student_id = Courses.student_id;


#Q9. Debugging – Wrong Query (2 marks) 
SELECT name, SUM(marks)  
FROM Students 
WHERE marks > 50 
GROUP BY name
ORDER BY name ;

#Q10.  (10 marks) 
#Display name and marks of students: 
#● Who are enrolled in at least one course, 
#● Have marks greater than the average marks of their gender.


SELECT Students.name, Students.gender, Students.marks from Students
RIGHT JOIN Courses ON Students.student_id = Courses.student_id 
where  ((Students.gender='F' and  Students.marks>( select avg(Students.marks) from Students)) or 
(Students.gender='M' and  Students.marks>( select avg(Students.marks) from Students)) or 
(Students.gender='O' and  Students.marks>( select avg(Students.marks) from Students)))
group by Students.name, Students.student_id order by students.name asc;

