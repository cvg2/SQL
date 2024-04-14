USE Company_CarVil2
ALTER TABLE DEPENDENT DROP CONSTRAINT [FK__DEPENDENT__Essn__3D5E1FD2]
ALTER TABLE DEPENDENT DROP CONSTRAINT [PK__DEPENDEN__23D9CF4BC26581A0]

ALTER TABLE DEPT_LOCATIONS DROP CONSTRAINT [FK__DEPT_LOCA__Dnumb__3E52440B]
ALTER TABLE DEPT_LOCATIONS DROP CONSTRAINT PK__DEPT_LOC__195559608E226E7E

ALTER TABLE WORKS_ON DROP CONSTRAINT [FK__WORKS_ON__Essn__3C69FB99]
ALTER TABLE WORKS_ON DROP CONSTRAINT PK__WORKS_ON__B65F9BE82AEF3416

ALTER TABLE EMPLOYEE DROP CONSTRAINT [PK__EMPLOYEE__CA33E0E588ABFF34]
ALTER TABLE EMPLOYEE DROP CONSTRAINT [FK__EMPLOYEE__Dno__3A81B327]
ALTER TABLE EMPLOYEE DROP CONSTRAINT [FK__EMPLOYEE__Super___36B12243]


ALTER TABLE DEPARTMENT DROP CONSTRAINT [FK__DEPARTMEN__Mgr_s__3B75D760]
ALTER TABLE DEPARTMENT DROP CONSTRAINT [PK__DEPARTME__40A4CC7A00663B71]

2)
CREATE TABLE Audit_EmpSalary(date_of_change DATE, DML_Type varchar(10), old_SSN char(9), new_SSN char(9), old_Salary int, new_Salary int, old_Dno int, new_Dno int);


CREATE PROCEDURE SP_Audit_EmpSalary
 @DML_Type varchar(10), @old_SSN char(9), @new_SSN char(9), @old_Salary int,
 @new_Salary int, @old_Dno int, @new_Dno int
 AS
 BEGIN
 DECLARE @date_of_change DATE
 SET @date_of_change = GETDATE()
 INSERT INTO Audit_EmpSalary
 (date_of_change, DML_Type, old_SSN, new_SSN, old_Salary,new_Salary, old_Dno, new_Dno)
 VALUES
 (@date_of_change, @DML_Type, @old_SSN , @new_SSN, @old_Salary, @new_Salary, @old_Dno, @new_Dno)
 END


3)
CREATE TRIGGER Trig_Insert_Audit_EmpSalary ON EMPLOYEE FOR INSERT 
 AS
 BEGIN
 SET NOCOUNT ON
     DECLARE @new_SSN char(9), @new_Salary int, @new_Dno int
    
      DECLARE Rows_Inserted CURSOR FOR
          SELECT Ssn, Salary, Dno   
          FROM inserted;
      OPEN  Rows_Inserted;
      FETCH NEXT FROM Rows_Inserted 
		  INTO @new_SSN, @new_Salary, @new_Dno;
		  WHILE @@FETCH_STATUS = 0
		      BEGIN
            EXECUTE SP_Audit_EmpSalary "INSERT", NULL, @new_SSN, NULL, @new_Salary, NULL, @new_Dno
            FETCH NEXT FROM Rows_Inserted
            INTO @new_SSN, @new_Salary, @new_Dno;
          END
      CLOSE Rows_Inserted;
      DEALLOCATE Rows_Inserted;
 END




CREATE TRIGGER Trig_Delete_Audit_EmpSalary ON EMPLOYEE FOR DELETE 
 AS
 BEGIN
 SET NOCOUNT ON
     DECLARE @old_SSN char(9), @old_Salary int, @old_Dno int
    
      DECLARE Rows_Deleted CURSOR FOR
          SELECT Ssn, Salary, Dno   
          FROM deleted;
      OPEN  Rows_Deleted;
      FETCH NEXT FROM Rows_Deleted 
		  INTO @old_SSN, @old_Salary, @old_Dno;
		  WHILE @@FETCH_STATUS = 0
		      BEGIN
            EXECUTE SP_Audit_EmpSalary "DELETE", @old_SSN, NULL, @old_Salary, NULL, @old_Dno, NULL
            FETCH NEXT FROM Rows_Deleted
            INTO @old_SSN, @old_Salary, @old_Dno;
          END
      CLOSE Rows_Deleted;
      DEALLOCATE Rows_Deleted;
 END




CREATE TRIGGER Trig_Update_Audit_EmpSalary  ON EMPLOYEE FOR UPDATE 
 AS
 BEGIN
      SET NOCOUNT ON
      DECLARE @old_SSN char(9), @new_SSN char(9), @old_Salary int,
      @new_Salary int, @old_Dno int, @new_Dno int
      DECLARE Rows_Updated CURSOR FOR
          SELECT D.Ssn, I.Ssn, D.Salary,I.Salary, D.Dno, I.Dno   
          FROM deleted D INNER JOIN inserted I on D.Ssn = I.Ssn;
      OPEN  Rows_Updated;
      FETCH NEXT FROM Rows_Updated 
		  INTO @old_SSN,@new_SSN, @old_Salary,@new_Salary, @old_Dno, @new_Dno;
		  WHILE @@FETCH_STATUS = 0
		      BEGIN
            IF @old_Salary != @new_Salary
               EXECUTE SP_Audit_EmpSalary "UPDATE", @old_SSN, @new_SSN, @old_Salary, @new_Salary, @old_Dno, @new_Dno
            FETCH NEXT FROM Rows_Updated
            INTO @old_SSN,@new_SSN, @old_Salary,@new_Salary, @old_Dno, @new_Dno;
          END
      CLOSE Rows_Updated;
      DEALLOCATE Rows_Updated;
 END 
SELECT * FROM EMPLOYEE
SELECT * FROM Audit_EmpSalary
UPDATE Employee SET Salary = 99000 WHERE Dno = 5;
SELECT * FROM EMPLOYEE
SELECT * FROM Audit_EmpSalary













SELECT * FROM EMPLOYEE
SELECT * FROM Audit_EmpSalary
DELETE FROM Employee WHERE Fname = 'John' AND Lname = 'Smith';
SELECT * FROM EMPLOYEE
SELECT * FROM Audit_EmpSalary
