/*Q1*/
select e1.Fname,e1.Lname,e2.Fname,e2.Lname,d.Dnumber,d.Dname
from EMPLOYEE e1
right join DEPARTMENT d on e1.Dno = d.Dnumber
left join EMPLOYEE e2 on  e1.Super_ssn = e2.Ssn
order by d.Dnumber,e1.Fname

/*Q1_1*/
select e1.Fname,e1.Lname,e2.Fname,e2.Lname,d.Dnumber,d.Dname
from EMPLOYEE e1
inner join DEPARTMENT d on e1.Dno = d.Dnumber
left join EMPLOYEE e2 on  e1.Super_ssn = e2.Ssn
order by d.Dnumber,e1.Fname

/*Q2*/
select fname
from EMPLOYEE e
inner join DEPARTMENT d on e.ssn = d.Mgr_ssn
where
not exists
(select *
from DEPENDENT de
where e.Ssn = de.Essn)


/*Q2_1*/
select fname
from EMPLOYEE e
inner join DEPENDENT d on e.Ssn = d.Essn
where d.Relationship = 'Spouse' and
e.Sex = 'F' and e.Ssn
in
(select Essn from WORKS_ON
group by Essn
having count(*) >= 3)

/*Q3*/
select e.Fname 
from EMPLOYEE e
inner join DEPARTMENT d on e.Dno = d.Dnumber
inner join DEPENDENT de on e.Ssn = de.Essn
where d.Dname = 'Research' 
and de.Relationship = 'Spouse'
and not exists
(select * from DEPENDENT d1
where e.Ssn = d1.Essn and
(d1.Relationship = 'Daughter' or
d1.Relationship = 'Son'))

/*Q4*/
select e.Lname 
from EMPLOYEE e
inner join DEPENDENT de on e.Ssn = de.Essn
where de.Relationship = 'Spouse'
and exists
(select * from DEPENDENT d1
where e.Ssn = d1.Essn and
d1.Relationship = 'Daughter')
and not exists
(select * from DEPENDENT d1
where e.Ssn = d1.Essn and
d1.Relationship = 'Son')

/*Q5*/
select Lname,Ssn 
from EMPLOYEE e
inner join WORKS_ON w on e.Ssn = w.Essn
where w.Pno in
(select w1.Pno 
from WORKS_ON w1
inner join EMPLOYEE e1 on e1.Ssn = w1.Essn
group by w1.Pno
having
sum(CASE when e1.Sex = 'F' then 1 else 0 end) >
sum(CASE when e1.Sex = 'M' then 1 else 0 end))
