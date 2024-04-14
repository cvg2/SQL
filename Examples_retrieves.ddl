Q1: Retrieve the name and address of all the female managers.

(SELECT e.Fname, e.Address
 FROM EMPLOYEE e, DEPARTMENT d
 WHERE e.Ssn = d.Mgr_ssn AND e.Sex = 'F');


Q2: Make a list of all project numbers for projects that involve an employee whose last name is ‘Smith’, either as a worker or as a manager of the department that controls the project.
(SELECT distinct Pnumber
FROM PROYECT p,DEPARTMENT d, EMPLOYEE e
WHERE e.Dno = d.Dnumber and d.Mgr_ssn = e.ssn and e.Lname = 'Smith')
UNION
(SELECT Pnumber
FROM PROYECT p, WORKS_ON w, EMPLOYEE e
WHERE p.Pnumber = w.Pno and w.Essn = e.Ssn and e.Lname = 'Smith')


Q3: Retrieve the name and address and his/her department name of the highest ranked employee who does not report to anybody in the company.
(SELECT e.Fname, e.Address, d.Dname
FROM EMPLOYEE e, DEPARTMENT d
WHERE e.Super_ssn IS NULL AND e.Dno = d.Dnumber)


Q4: For each department, list all the employees who are working in the department with the employee’s first and last name and first and last name of his or her immediate supervisor. List the result in the order of each department number and department name.

  SELECT d.Dname, e1.Fname as FNAMEEMPLOYEE, e1.Lname as LNAMEEMPLOYEE, e2.Fname as FNAMESUPER, e2.Lname as FNAMESUPER
  FROM EMPLOYEE e1, EMPLOYEE e2, DEPARTMENT d
  WHERE e1.Dno = d.Dnumber AND e1.Super_ssn = e2.Ssn
  Order BY d.Dnumber, d.Dname;
