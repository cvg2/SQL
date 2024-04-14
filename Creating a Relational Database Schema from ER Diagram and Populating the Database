Use Company_CarVil2;
CREATE TABLE EMPLOYEE (
Fname varchar(30) NOT NULL,
Minit char,
Lname varchar(30) NOT NULL,
Ssn char(9) NOT NULL,
Bdate date,
Address varchar(50) NOT NULL,
Sex char NOT NULL,
Salary  decimal(9,2),
Super_ssn char(9),
Dno int NOT NULL,
PRIMARY KEY(Ssn));


Use Company_CarVil2;
CREATE TABLE DEPARTMENT (
Dname varchar(30) NOT NULL,
Dnumber int NOT NULL,
Mgr_ssn char(9) NOT NULL,
Mgr_start_date date NOT NULL,
PRIMARY KEY(Dnumber));





Use Company_CarVil2;
CREATE TABLE DEPT_LOCATIONS (
Dnumber int NOT NULL,
Dlocations char(9) NOT NULL,
PRIMARY KEY(Dnumber, Dlocations));




Use Company_CarVil2;
CREATE TABLE PROYECT (
Pname varchar(30) NOT NULL,
Pnumber int NOT NULL,
Plocations char(9) NOT NULL,
Dnum int NOT NULL,
PRIMARY KEY(Pnumber));




Use Company_CarVil2;
CREATE TABLE WORKS_ON(
Essn char(9) NOT NULL,
Pno int NOT NULL,
Hours float,
PRIMARY KEY(Essn, Pno));

 
Use Company_CarVil2;
CREATE TABLE DEPENDENT (
Essn char(9) NOT NULL,
Dependent_name varchar(20) NOT NULL,
Sex char NOT NULL,
Bdate date NOT NULL,
Relationship varchar(20) NOT NULL,
PRIMARY KEY(Essn, Dependent_name));



Use Company_CarVil2;
INSERT INTO EMPLOYEE VALUES('John', 'B', 'Smith', '123456789', '9-Jan-1955', '731 Fondren, Houston, TX', 'M', 30000, '987654321', 5);
INSERT INTO EMPLOYEE VALUES('Franklin', 'T', 'Wong', '333445555', '08-Dec-1945', '638 Voss, Houston, TX', 'M', 40000, '888665555', 5);
INSERT INTO EMPLOYEE VALUES('Joyce', 'A', 'English', '453453453', '21-Jul-1962', '5631 Rice, Houston, TX', 'M', 30000, '333445555', 5);
INSERT INTO EMPLOYEE VALUES('Ramash', 'K', 'Narayan', '666884444', '15-Sep-1952', '975 Fire Oak, Humble, TX', 'M', 38000, '333445555', 5);
INSERT INTO EMPLOYEE VALUES('James', 'E', 'Borg', '888665555', '10-Nov-1927', '975 Fire Oak, Humble, TX', 'M', 55000, NULL, 1);
INSERT INTO EMPLOYEE VALUES('Jennifer', 'S', 'Wallace', '987654321', '20-Jun-1931', '291 Berry, Bellaire, TX', 'F', 43000, '888665555', 4);
INSERT INTO EMPLOYEE VALUES('Ahmad', 'V', 'Jabbar', '987987987', '29-Mar-1959', '980 Dallas, Houston, TX', 'M', 25000, '987654321', 4);
INSERT INTO EMPLOYEE VALUES('Alicia', 'J', 'Zelaya', '999887777', '19-Jul-1958', '3321 Castle, SPrig, TX', 'F', 25000, '987654321', 4);
GO


Use Company_CarVil2;
INSERT INTO DEPARTMENT VALUES('Headquarters', 1, '888665555', '19-Jun-1971');
INSERT INTO DEPARTMENT VALUES('Administration', 4, '987654321', '1-Jan-1985' );
INSERT INTO DEPARTMENT VALUES('Research', 5, '333445555', '22-May-1978');
INSERT INTO DEPARTMENT VALUES('Automotation', 7, '123456789',  '6-Oct-2005');
GO


Use Company_CarVil2;
INSERT INTO DEPENDENT VALUES('123456789', 'Alice', 'F' ,'31-Dec-78', 'Daughter');
INSERT INTO DEPENDENT VALUES('123456789', 'Elizabeth', 'F' ,'05-May-57', 'Spouse');
INSERT INTO DEPENDENT VALUES('123456789', 'Michael', 'M' ,'01-Jan-78', 'Son');
INSERT INTO DEPENDENT VALUES('333445555', 'Alice', 'F' ,'05-Apr-76', 'Daughter');
INSERT INTO DEPENDENT VALUES('333445555', 'Joy', 'F' ,'03-May-48', 'Spouse');
INSERT INTO DEPENDENT VALUES('333445555', 'Theodore', 'M' ,'25-Oct-73', 'Son');
INSERT INTO DEPENDENT VALUES('987654321', 'Abner', 'M' ,'29-Feb-32', 'Spouse');
GO


Use Company_CarVil2;
INSERT INTO DEPT_LOCATIONS VALUES('1', 'Houston');
INSERT INTO DEPT_LOCATIONS VALUES('4', 'Stafford');
INSERT INTO DEPT_LOCATIONS VALUES('5', 'Bellaire');
INSERT INTO DEPT_LOCATIONS VALUES('5', 'Sugarland');
INSERT INTO DEPT_LOCATIONS VALUES('5', 'Houston');
GO



Use Company_CarVil2;
INSERT INTO PROYECT VALUES('ProductX', '1', 'Bellaire', '5' );
INSERT INTO PROYECT VALUES('ProductY', '2', 'Sugarland', '5' );
INSERT INTO PROYECT VALUES('ProductZ', '3', 'Houston', '5' );
INSERT INTO PROYECT VALUES('Computerization', '10', 'Stafford', '4' );
INSERT INTO PROYECT VALUES('Reorganization', '20', 'Houston', '1' );
INSERT INTO PROYECT VALUES('Newbenefits', '30', 'Stafford', '4' );
GO





 
Use Company_CarVil2;
INSERT INTO WORKS_ON VALUES('123456789', '1', '32.5');
INSERT INTO WORKS_ON VALUES('123456789', '2', '7.5');
INSERT INTO WORKS_ON VALUES('333445555', '2', '10');
INSERT INTO WORKS_ON VALUES('333445555', '3', '10');
INSERT INTO WORKS_ON VALUES('333445555', '10', '10');
INSERT INTO WORKS_ON VALUES('333445555', '20', '10');
INSERT INTO WORKS_ON VALUES('453453453', '1', '20');
INSERT INTO WORKS_ON VALUES('453453453', '2', '20');
INSERT INTO WORKS_ON VALUES('666884444', '3', '40');
INSERT INTO WORKS_ON VALUES('888665555', '20', NULL);
INSERT INTO WORKS_ON VALUES('9876	54321', '20', '15');
INSERT INTO WORKS_ON VALUES('987654321', '30', '20');
INSERT INTO WORKS_ON VALUES('987987987', '10', '35');
INSERT INTO WORKS_ON VALUES('987987987', '30', '5');
INSERT INTO WORKS_ON VALUES('999887777', '10', '10');
INSERT INTO WORKS_ON VALUES('999887777', '30', '30');
GO
