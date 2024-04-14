CREATE PROCEDURE SP_Report_NEW_Budget AS
 BEGIN
  CREATE TABLE NEW_Dept_Budget(Dept_No INT, Dept_Name char(30),
  COUNT_Emp INT, New_SUM_Salary INT,New_AVE_Salary INT,
  PRIMARY KEY(Dept_No));
  Declare @B_dept_no int;
  Declare @B_dept_name char(30);
  Declare @B_dept_count_emp int;
  Declare @B_dept_new_sum int;
  Declare @B_dept_new_ave int;
  Declare @B_rows int;
  SET @B_rows = (SELECT COUNT(*) FROM VDept_Budget );
  if (@B_rows != 0)
    BEGIN
        DECLARE B_cursor CURSOR FOR
          SELECT Dept_Number, Dept_name, No_Emp, Sum_Salary, Ave_Salary   
          FROM VDept_Budget;
        OPEN  B_cursor;
        FETCH NEXT FROM B_cursor 
		    INTO @B_dept_no, @B_dept_name, @B_dept_count_emp,  @B_dept_new_sum, @B_dept_new_ave;
		    WHILE @@FETCH_STATUS = 0
		      BEGIN
            if @B_dept_no = 1
              BEGIN
                SET @B_dept_new_sum = @B_dept_new_sum* 1.1;
                SET @B_dept_new_ave = @B_dept_new_ave* 1.1;
              END;
            if @B_dept_no = 4
              BEGIN
                SET @B_dept_new_sum = @B_dept_new_sum* 1.2;
                SET @B_dept_new_ave = @B_dept_new_ave* 1.2;
              END;
            if @B_dept_no = 5
              BEGIN
                SET @B_dept_new_sum = @B_dept_new_sum* 1.3;
                SET @B_dept_new_ave = @B_dept_new_ave* 1.3;
              END;
            if @B_dept_no = 7
              BEGIN
                SET @B_dept_new_sum = @B_dept_new_sum* 1.4;
                SET @B_dept_new_ave = @B_dept_new_ave* 1.4;
              END;
            INSERT INTO NEW_Dept_Budget( Dept_No , Dept_Name, COUNT_Emp, New_SUM_Salary ,New_AVE_Salary )
                   VALUES( @B_dept_no, @B_dept_name, @B_dept_count_emp,  @B_dept_new_sum, @B_dept_new_ave);
            FETCH NEXT FROM B_cursor 
		        INTO @B_dept_no, @B_dept_name, @B_dept_count_emp,  @B_dept_new_sum, @B_dept_new_ave;
          END;
          CLOSE B_cursor;
          DEALLOCATE B_cursor;
    END;

  END;
