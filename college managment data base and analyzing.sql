--PROBLEM STATEMENT
--
--Create a College Management Database and analyze student performance, course enrollment, and faculty workload
--
select * from DEPARTMENTS D;
select * from COURSES c;
select * from FACULTY f; 
select * from STUDENTS s;
select * from ENROLLMENTS e;
--
--PHASE 1: BASIC QUERIES 
--Exercise 1.1: List all Computer Science students
 select * from students s where department_id = 'CS';


--Exercise 1.2: Find courses with capacity > 50
select * from courses where max_capacity > 50;

--Exercise 1.3:Show faculty with Professor designation
select * from faculty where designation like  'professor';
--
-----------------------PHASE 2: JOIN OPERATIONS ----------------------------------------------------------

--Exercise 2.1: Student enrollments with course names and grades

select s.name,
c.course_name,
e.grade 
from enrollments e 
join students s on e.student_id = s.student_id
join COURSES c on e.course_id = c.course_id;

--Exercise 2.2: Courses with faculty names and departments

select 
c.course_name,
f.name, 
department 
from courses c
join  faculty f on f.faculty_id = c.faculty_id
join departments d on  c.department_id = d.department_id;

--Exercise 2.3: All students with their enrollment count

select  
s.student_id,
s.name,
count(enrollment_id) as enrollment_count 
from students s
left join enrollments e
on  s.student_id = e.student_id
group by s.student_id, s.name 
order by enrollment_count desc;
;


--
-----------------------PHASE 3: AGGREGATE QUERIES ----------------------------------

--Exercise 3.1: Count students by department and gender
select s.student_id,
s.name,
s.department_id as departments,
gender,
count(student_id) as student_count 
from students s 
left join departments d 
on s.department_id = d.department_id 
group by student_id , s.gender
order by student_count desc;

--Exercise 3.2: Average credits by department

select   
	d.department_name,
	d.department_id as department , 
	avg(credits) as avg_credits from departments d
join courses c 
on  c.department_id = d.department_id
group by 
	d.department_name, d.department_id
order by 
	avg_credits desc;


--Exercise 3.3: Courses with high enrollment (> 80% capacity)
select  
	c.course_id,
	c.course_name, 
	c.max_capacity,
	count(e.student_id) as enrolled_students,
	round ((count(e.student_id)*100.0 / c.max_capacity),2) as enrollment_percentage 
FROM  courses c 
left join enrollments e
on c.course_id = e.course_id 
group by
	c.course_id, c.course_name,c.max_capacity
having 
	(COUNT(e.student_id) * 100.0 / c.max_capacity) < 80
order by 
	enrollment_percentage desc;


----------PHASE 4: ANALYSIS & INSIGHTS ------------------------------------------

--Exercise 4.1: Grade distribution by department

select 
	d.department_id,
	d.department_name,
	e.grade,
	count(e.student_id) as students_count
from departments d
join 
	courses c on d.department_id = c.department_id
join 
	enrollments e on e.course_id = c.course_id
GROUP BY 
    d.department_id, d.department_name, e.grade
ORDER BY 
    d.department_name, e.grade;


--Exercise 4.2: Faculty workload analysis

SELECT 
    f.faculty_id,
    f.name,
    d.department_name,
    COUNT(DISTINCT c.course_id) AS total_courses,
    COUNT(e.student_id) AS total_students
FROM 
    faculty f
JOIN 
    courses c ON f.faculty_id = c.faculty_id
LEFT JOIN 
    enrollments e ON c.course_id = e.course_id
JOIN 
    departments d ON f.department = d.department_id
GROUP BY 
    f.faculty_id, f.name, d.department_name
ORDER BY 
    total_students DESC;




--Exercise 4.3: Department performance summary

SELECT 
    d.department_id,
    d.department_name,
    COUNT(DISTINCT s.student_id) AS total_students,
    COUNT(DISTINCT c.course_id) AS total_courses,
    COUNT(e.enrollment_id) AS total_enrollments,
    ROUND(AVG(e.grade),2) AS avg_grade
FROM 
    departments d
LEFT JOIN 
    courses c ON d.department_id = c.department_id
LEFT JOIN 
    enrollments e ON c.course_id = e.course_id
LEFT JOIN 
    students s ON e.student_id = s.student_id
GROUP BY 
    d.department_id, d.department_name
ORDER BY 
    avg_grade DESC;




