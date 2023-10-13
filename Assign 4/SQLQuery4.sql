CREATE PROCEDURE GetAllStudents
AS
BEGIN
    SELECT * FROM Students;
END;

--Add a new student
CREATE PROCEDURE AddStudents
   @ID INT ,
   @FirstName VarChar(50),
   @LastName VarChar(50),
   @Age INT,
   @CourseID INT
AS
BEGIN
    INSERT INTO Students (FirstName, LastName, Age, CourseID)
    VALUES (Rimsha, Tanveer, 22, 12);
END;
GO

CREATE PROCEDURE UpdateStudents
    @ID INT,
    @NewAge INT
AS
BEGIN
    UPDATE Students
    SET Age = 23
    WHERE ID = 6;
END;
GO

CREATE PROCEDURE DeleteStudent
    @ID INT
AS
BEGIN
    DELETE FROM Students
    WHERE ID = 5;
END;
GO

