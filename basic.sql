-- Create Student Table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    Email VARCHAR(150)
);

-- Create Club Table
CREATE TABLE Club (
    ClubID INT PRIMARY KEY,
    ClubName VARCHAR(100),
    ClubRoom VARCHAR(50),
    ClubMentor VARCHAR(100)
);

-- Create Membership Table with foreign keys
CREATE TABLE Membership (
    MembershipID INT PRIMARY KEY,
    StudentID INT,
    ClubID INT,
    JoinDate DATEL,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (ClubID) REFERENCES Club(ClubID)
);


INSERT INTO Student (StudentID, StudentName, Email)VALUES(8, ‘Samba’, ‘samba@email.com’);

INSERT INTO Club (ClubID, ClubName, ClubRoom, ClubMentor) VALUES (5, ‘Photography Club’, ‘R404’, ‘Ms. Priya’);

SELECT * FROM Student;

SELECT * FROM Club;

