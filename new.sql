-- Create Student Table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100) ,
    Email VARCHAR(150) UNIQUE 
);

-- Create Club Table
CREATE TABLE Club (
    ClubID INT PRIMARY KEY,
    ClubName VARCHAR(100) ,
    ClubRoom VARCHAR(50),
    ClubMentor VARCHAR(100)
);

-- Create Membership Table
CREATE TABLE Membership (
    MembershipID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT ,
    ClubID INT ,
    JoinDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (ClubID) REFERENCES Club(ClubID)
);

INSERT INTO Student (StudentID, StudentName, Email)VALUES(8, ‘Samba’, ‘samba@email.com’);


INSERT INTO Club (ClubID, ClubName, ClubRoom, ClubMentor) VALUES (5, ‘Photography Club’, ‘R404’, ‘Ms. Priya’);


SELECT * FROM Student;
SELECT * FROM Club;

SELECT 
    s.StudentName,
    c.ClubName,
    m.JoinDate
FROM Membership m
INNER JOIN Student s 
    ON m.StudentID = s.StudentID
INNER JOIN Club c 
    ON m.ClubID = c.ClubID
ORDER BY m.JoinDate;