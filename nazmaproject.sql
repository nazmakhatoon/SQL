
Use Nazma;
CREATE TABLE Employee
(EmpID int NOT NULL,EmpName varchar(20),Gender varchar(50),Salary int,City varchar(50))

INSERT INTO Employee
VALUES(1,'JOHN DOE','Male',50000,'New York'),
      (2,'Jane Smith','Female',55000,'Los Anglis'),
	  (3,'Michael Johnson','Male',60000,'Chicago'),
	  (4,'Emily Willams','Female',48000,'Houston'),
	  (5,'Robert Brown','Male',52000,'Miami')


CREATE TABLE EmployeeDetail 
(EmpID int NOT NULL,Project Varchar(20),Emp_Position Varchar(20),DOJ Date)

INSERT INTO EmployeeDetail
VALUES(1,'P1','Manager','2022-01-15'),
      (2,'P2','Analyst','2022-03-10'),
	  (3,'p1','Developer','2022-02-22'),
	  (4,'p4','Designer','2022-04-05'),
	  (5,'p2','Engineer','2022-01-30')
SELECT * FROM EmployeeDetail

SELECT * FROM Employee
1.(a)
SELECT * FROM Employee
  WHERE Salary Between 200000 AND 300000;

1.(b)
SELECT Empname,CITY FROM Employee GROUP BY CITY ,Empname HAVING COUNT(*)>1;

1.(c)
SELECT * FROM Employee WHERE EmpID IS NULL; 

2(a)
SELECT Empname, Salary, SUM(Salary) OVER(ORDER BY EmpID) as cumulative_Salary FROM Employee;

2(b)
SELECT gender ,COUNT(*) FROM Employee GROUP BY gender;

2(c)
SELECT * FROM Employee
WHERE EmpID <=(SELECT  COUNT(*)/2 FROM Employee );
3.
SELECT * FROM Employee

 SELECT Salary,CONCAT(SUBSTRING(STR( Salary), 1, LEN(STR (Salary))-2),'xx') as masked_number FROM Employee; 
4.
--even rows--
SELECT * FROM(SELECT*,ROW_Number()OVER(ORDER BY EmpID) AS ROWNumber FROM Employee) AS Emp
WHERE EMP.ROWnumber % 2=0

--odd rows--
SELECT * FROM(SELECT*,ROW_Number()OVER(ORDER BY EmpID) AS ROWNumber FROM Employee) AS Emp
WHERE EMP.ROWnumber % 2=1
5.
SELECT EmpID,EmpName,Salary FROM
(SELECT EmpID,EmpName,Salary,ROW_NUMBER() OVER(ORDER BY Salary) as rownumber FROM Employee) as temp WHERE rownumber=3;

6(a)
SELECT * FROM Employee
SELECT EmpID, EmpName, gender,Salary,City,COUNT(*) as duplicate_count
FROM Employee
GROUP BY EmpID,EmpName,gender,Salary,City
HAVING COUNT(*)>1;

6(b)
SELECT * FROM Employee
SELECT * FROM EmployeeDetail

SELECT Project,STRING_AGG(EmpName,',') as Employee FROM EmployeeDetail ed inner join Employee on Employee.EmpID=ed.EmpID GROUP BY ed.Project;

7.
SELECT Project,MAX(Salary) as Projectsale FROM Employee
inner join  EmployeeDetail
on Employee. EmpID= EmployeeDetail.EmpID
GROUP BY Project
ORDER BY Project desc;
8.
WITH CC AS(
SELECT datepart(year,DOJ) as joinyear
FROM Employee
inner join EmployeeDetail
ON Employee.EmpID=EmployeeDetail.EmpID)
SELECT joinyear,COUNT(*) as TOTALEmp FROM CC GROUP BY joinyear;
9.
SELECT * FROM Employee
SELECT  EmpName, Salary,
CASE
    WHEN Salary> 60000 Then 'high'
    WHEN Salary>=55000 AND Salary<=60000 Then 'medium'  
	else 'low'
END AS Salarystatus
FROM Employee;

