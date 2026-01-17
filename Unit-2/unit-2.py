
# UNIT - 2 :   

####  1 CHECK CONSTRAINT 

# ADD CHECK CONSTRAINT WHILE CREATING TABLE 
"""
CREATE TABLE demo(
id SERIAL PRIMARY KEY,
fname TEXT NOT NULL DEFAULT 'unknown',
lname TEXT NOT NULL DEFAULT 'unknown',
CONSTRAINT fname_greater_than_1  CHECK (length(TRIM(fname))>1)
);
----------------------------------------------------------------------
INSERT INTO  demo(fname,lname)
VALUES 
('a','gyani');

"""

# REMOVE CONSTRAINT CHECK 
"""
ALTER TABLE demo 
DROP CONSTRAINT fname_greater_than_1;
"""

# ADD CONSTRAINT AFTER THE TABLE IS CREATED 
"""
ALTER TABLE demo 
ADD CONSTRAINT fname_greater_than_1 CHECK(LENGTH(TRIM(fname)) > 1);

ALTER TABLE demo 
ADD CONSTRAINT unique_data UNIQUE (lname) ;
"""

### 2 : CASE IN POSTGRESQL 

# SHOW THE CATEGORY OF RATE WHETHER IT IS HIGH OR LOW BASED ON 4000
"""
SELECT *,
CASE 
WHEN rate >= 5000 THEN 'high' ELSE 'low'
END AS rate_ctagory 
FROM
materials_stock ;
"""

# MULTIPLE WHEN CASE 
"""
SELECT *,
CASE 
WHEN rate >= 5000 THEN 'high'
WHEN rate BETWEEN 0 AND 1000 THEN 'low'
WHEN rate BETWEEN 1001 AND 5001 THEN 'MEDIUM'
END AS rate_ctagory 
FROM
materials_stock ;
"""

####     VIEWS IN POSTGRESQL 
'''
VIEWS HELP US RUN A LIST OF COMMANDS BY SINGLE COMMAND . WE 
CREATE A UNIUE TABLE WHICH IS CALLED AS VIEWS WHICH HOLDS THE SQL COMMANDS AND RUN AS PER THE USERS 
COMMANDS.
'''

# FIRSTLY THE SCRIPT YOU WANT TO EXECUTE , YOU HAVE TO ADD A CREATE VIEW AT FIRST LINE AND 
# AFTER THAT YOU CAN EXECUTE THAT BY SELECT * FROM VIEWS ;

# CODE EXAMPLE 
"""
CREATE VIEW summary AS             
SELECT 
s.name AS STUDENTS,
COUNT(c.course_name) AS NO_OF_COURSES,
ROUND(SUM(e.given_fee)) AS TOTAL_FEE
FROM enrollment e
JOIN students s ON s.student_id=e.student_id 
JOIN courses c ON  c.course_id=e.course_id
GROUP BY s.name
;
"""

# EXECUTION 
'''
SELECT * FROM summary;
'''

####          HAVING CLAUSE IN POSTGRESQL 
'''
USE AFTER GROUP BY STATEMENT WHEN YIU WANT A CONDITION AFTER GROUP BY 
'''

"""
SELECT 
s.name AS STUDENTS,
COUNT(c.course_name) AS NO_OF_COURSES,
ROUND(SUM(e.given_fee)) AS TOTAL_FEE
FROM enrollment e
JOIN students s ON s.student_id=e.student_id 
JOIN courses c ON  c.course_id=e.course_id
GROUP BY s.name
HAVING ROUND(SUM(e.given_fee)) >= 8000
;

"""


###   GROUP BY ROLLUP AND COALESCE
"""
SELECT  COALESCE(s.name,'TOTAL') AS STUDENTS,
COUNT(c.course_name) AS NO_OF_COURSES,
ROUND(SUM(e.given_fee)) AS TOTAL_FEE
FROM enrollment e
JOIN students s ON s.student_id=e.student_id 
JOIN courses c ON  c.course_id=e.course_id
GROUP BY ROLLUP(s.name)
ORDER BY ROUND(SUM(e.given_fee))
;
"""

###   STORED ROUTINE 

