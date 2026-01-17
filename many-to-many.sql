--                              MANY TO MANY RELATIONSHIP 

-- TABLE FOR STUDENTS DETAILS 
CREATE TABLE students(
student_id BIGSERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL DEFAULT 'unknown',
address VARCHAR(200) NOT NULL DEFAULT 'unknown'
);

-- TABLE FOR COURSES DETAILS 
CREATE TABLE courses(
course_id BIGSERIAL PRIMARY KEY,
course_name VARCHAR(100) NOT NULL DEFAULT 'unknown' ,
actual_fee NUMERIC(20,3)
);

ALTER TABLE courses 
ALTER COLUMN actual_fee 
SET NOT NULL ; 

-- TABLE FOR ENROLLMENT DETAILS 
CREATE TABLE enrollment(
enroll_id BIGSERIAL PRIMARY KEY,
student_id INTEGER NOT NULL,
course_id INTEGER NOT NULL,
given_fee INTEGER NOT NULL,
enroll_date DATE NOT NULL DEFAULT CURRENT_DATE,
FOREIGN KEY (student_id) REFERENCES students(student_id),
FOREIGN KEY (course_id) REFERENCES courses(course_id)
);


-- INSERT DATAS TO students TABLE 

INSERT INTO students(name,address)
VALUES 
('shivam','rautahat'),
('anjali','himanchal pradesh'),
('pushpa','biratnagar')
;

-- INSERT DATAS TO courses TABLE 

INSERT INTO courses(course_name,actual_fee)
VALUES
('nursing',5000),     --  100 course id
('engineering',4000), --  101 course id
('loksewa',6000),     --  102 course id
('coding',5500)       --  103 course id
;

-- INSERT DATAS TO enrollment TABLE 

INSERT INTO enrollment(student_id,course_id,given_fee,enroll_date)
VALUES 
(1000,103,5500,'2024-12-12'),
(1001,100,4000,'2025-1-1'),
(1002,102,1000,'2027-5-4'),
(1000,102,4500,'2020-11-12'),
(1000,101,4500,'2020-11-12')
;

--  NORMAL USE CASE OF INNER JOIN OR JOIN OF MANY TO MANY RELATIONSHIP  
SELECT 
e.enroll_id AS ENROLL_ID,s.name STUDENT_NAME,
c.course_name AS COURSE_NAME,
ROUND(c.actual_fee) AS ACTUAL_FEE,e.given_fee AS GIVEN_FEE,
e.enroll_date AS ENROLL_DATE
FROM enrollment e
JOIN students s ON s.student_id=e.student_id 
JOIN courses c ON  c.course_id=e.course_id ;

--    USE CASE OF GROUP BY IN INNER JOIN OF MANY TO MANY RELATIONSHIP 
SELECT 
s.name AS STUDENTS,
COUNT(c.course_name) AS NO_OF_COURSES,
ROUND(SUM(e.given_fee)) AS TOTAL_FEE
FROM enrollment e
JOIN students s ON s.student_id=e.student_id 
JOIN courses c ON  c.course_id=e.course_id
GROUP BY s.name
;


