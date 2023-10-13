--Create Table
CREATE TABLE Students(
ID INT PRIMARY KEY IDENTITY,
FirstName VarChar(50),
LastName VarChar(50),
Age INT,
CourseID INT
);

--Create Table
CREATE TABLE Courses(
CourseID INT PRIMARY KEY,
CourseName VarChar(50)
);

--Foreign Key
ALTER TABLE Students
Add Constraint FK_Courses
FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) 

--Insert Data In Courses
INSERT INTO Courses (CourseName,CourseID)
VALUES ('English',11),('Urdu',12),('Physics',13),('Maths',14),('Chemistry',15)

--Insert Data In Students
INSERT INTO Students (FirstName,LastName,CourseID,Age)
VALUES ('Syeda','Kainat',12,19),
('Laiba','Liaqat',15,18),
('Asma','Ali',12,21),
('Mahoor','Adnan',15,21),
('Ayesha','Falak',13,21),
('Neha','Ateeb',14,20),
('Adeel','Raheel',15,19),
('Syed','Danish',15,19),
('Kinza','Tayyab',null,19),
('Muhammad','Umair',null,22)

--Update Student Age
Update Students
set Age=20 where ID=2

--Delete a Record
delete from Students where ID=8

--list all students older than 20
SELECT * FROM Students
WHERE Age > 20;

--all students enrolled in a specific course, along with the course name

SELECT ID,FirstName,LastName,Age,Students.CourseID,CourseName FROM Students
JOIN Courses ON Students.CourseID=Courses.CourseID

--Count Total Number of Students
select count(ID) AS NoOfStudents from Students

--average age of students
SELECT avg(Age) As AvgAge FROM Students

--names of students who are not enrolled in any course.
SELECT FirstName,LastName FROM Students
WHERE CourseID IS NULL

--the most popular course 
SELECT TOP 1 count(Students.CourseID) AS NoOfCourse, CourseName from Students
JOIN Courses ON Students.CourseID=Courses.CourseID GROUP BY CourseName 

--students who are older than the average age 
SELECT * FROM Students
WHERE Age > (SELECT avg(Age) FROM Students);

--List the courses that have no students enrolled in them
Select CourseName from Courses LEFT JOIN Students ON Courses.CourseID=Students.CourseID 
WHERE Students.CourseID IS NULL

--students who share courses with a specific student (choose one from your records)
Select * FROM Students 
Where CourseID 

--For each course, list the youngest and oldest student
SELECT Min(Students.Age) As youngest, Max(Students.Age) as oldest,CourseName from Students
JOIN Courses ON Students.CourseID=Courses.CourseID GROUP BY CourseName



