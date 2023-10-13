
--Add a new student
CREATE PROCEDURE AddStudents
   @FirstName VarChar(50),
   @LastName VarChar(50),
   @Age INT,
   @CourseID INT
AS
BEGIN
    INSERT INTO Students (FirstName, LastName, Age, CourseID)
    VALUES (@FirstName, @LastName, @Age, @CourseID);
END;
GO


--Update age of a student
CREATE PROCEDURE UpdateStudents
    @ID INT,
    @NewAge INT
AS
BEGIN
    UPDATE Students
    SET Age = @NewAge
    WHERE ID = @ID;
END;
GO


--Delete a student
CREATE PROCEDURE DeleteStudent
    @ID INT
AS
BEGIN
    DELETE FROM Students
    WHERE ID = @ID;
END;
GO

--List of all Students
CREATE PROCEDURE GetAllStudents
AS
BEGIN
    SELECT * FROM Students;
END;

--List the names of students who are not enrolled in any course
CREATE PROCEDURE StudentsNotEnrolled
AS
BEGIN
SELECT FirstName,LastName FROM Students
WHERE CourseID IS NULL
END;

--most popular course 
CREATE PROCEDURE PopularCase
AS
BEGIN
SELECT TOP 1 count(Students.CourseID) AS NoOfCourse, CourseName from Students
JOIN Courses ON Students.CourseID=Courses.CourseID GROUP BY CourseName 
END;

--students who are older than the average age 
CREATE PROCEDURE GreaterThanAvgAge
AS
BEGIN
SELECT FirstName, LastName, Age FROM Students
WHERE Age > (SELECT avg(Age) FROM Students);
END;


--List the courses that have no students enrolled in them
CREATE PROCEDURE CourseNotEnrolled
AS
BEGIN
Select CourseName from Courses LEFT JOIN Students ON Courses.CourseID=Students.CourseID 
WHERE Students.CourseID IS NULL
END;

--For each course, list the youngest and oldest student
CREATE PROCEDURE YongAndOld
AS
BEGIN
SELECT Min(Students.Age) As youngest, Max(Students.Age) as oldest,CourseName from Students
JOIN Courses ON Students.CourseID=Courses.CourseID GROUP BY CourseName 
End;