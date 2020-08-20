CREATE DATABASE P314

DROP DATABASE P314

use P314;

CREATE TABLE Students(
	Id int,
	Firstname nvarchar(100),
	Surname nvarchar(100)
)

DROP TABLE Students

ALTER TABLE Students 
ADD Age int,City nvarchar(100)

ALTER TABLE Students
DROP COLUMN Age,City

exec sp_rename "Students","Stu"

exec sp_rename "Stu","Students"

exec sp_rename "Students.Surname","Lastname"

INSERT INTO Students VALUES(1,'Seynur','Memmedov',18)

INSERT INTO Students VALUES(2,'Sunal','Jabili',20),
							(3,'Zahid','Qasimli',20)

INSERT INTO Students(Id,Firstname,Lastname) 
VALUES(4,'Kamil','Memmedov')

CREATE TABLE Students(
	Id int identity primary key,
	Firstname nvarchar(100) not null,
	Surname nvarchar(100),
	Email nvarchar(250) unique
)

INSERT INTO Students VALUES('Kamil','Memmedov','kamil@mail.ru')

INSERT INTO Students(Firstname,Email) VALUES('Jabili','sj@code.az')

UPDATE Students SET Surname='Qasimli' 
WHERE Id=2

UPDATE Students SET Firstname='Sunal',Surname='Jabili',Email='sunal@code.edu.az'
WHERE Id=5

DELETE FROM Students WHERE Id=2

SELECT * FROM Students

SELECT Firstname 'Name',Email FROM Students

SELECT * FROM Students
--WHERE Id=7
--WHERE NOT Id=7
--WHERE Id>1
--WHERE Id>6 AND Firstname='Zahid'
--WHERE Id>6 OR Firstname='Seynur'
--WHERE Id in(6,8)
--WHERE Id BETWEEN 6 AND 8
WHERE Id>=6 AND Id<=8

SELECT CHARINDEX('@',Email) 'iNDEX' FROM Students

SELECT SUBSTRING(Email,0,3) FROM Students

SELECT LEN(Email) FROM Students

SELECT SUBSTRING(Email,0,CHARINDEX('@',Email)) FROM Students

SELECT SUBSTRING(Email,(CHARINDEX('@',Email)+1),LEN(Email)) FROM Students

SELECT Email FROM Students
WHERE Email LIKE '%mail%'

ALTER TABLE Students
ADD Age int

SELECT MIN(Age) 'Min Age' FROM Students

SELECT MAX(Age) 'Max Age' FROM Students

SELECT AVG(Age) 'AVG Age' FROM Students

SELECT SUM(Age) 'Sum Of Age' FROM Students


Select Firstname,Surname from Students 
where Age=(SELECT MAX(Age) FROM Students)



Select TOP 1 Firstname,Surname from Students 
where Age=(SELECT MIN(Age) FROM Students) 
Order by Id desc