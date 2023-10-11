--Create Table
CREATE TABLE Students(
ID INT PRIMARY KEY,
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
INSERT INTO Students (ID,FirstName,LastName,CourseID,Age)
VALUES (1,'Syed','Kainat',12,19),
(2,'Laiba','Liaqat',15,18),
(3,'Asma','Ali',12,21),
(4,'Mahoor','Adnan',15,21),
(5,'Ayesha','Falak',13,21),
(6,'Neha','Ateeb',14,20),
(7,'Adeel','Raheel',15,19),
(8,'Syed','Danish',15,19),
(9,'Kinza','Tayyab',12,null),
(10,'Muhammad','Umair',11,null)

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
select count(ID) from Students
--average age of students
SELECT avg(Age) FROM Students
--names of students who are not enrolled in any course.
SELECT FirstName,LastName FROM Students
WHERE CourseID IS NULL
--the most popular course 
SELECT TOP 1 count(Students.CourseID) AS NoOfCourse, CourseName from Students
JOIN Courses ON Students.CourseID=Courses.CourseID GROUP BY CourseName ORDER BY NoOfCourse DESC
--students who are older than the average age 
SELECT * FROM Students
WHERE Age > (SELECT avg(Age) FROM Students);

SELECT CourseName, count(Students.CourseID) AS NoOfCourse, AVG(Age) AS AvgAge  from Students
JOIN Courses ON Students.CourseID=Courses.CourseID GROUP BY CourseName ORDER BY NoOfCourse