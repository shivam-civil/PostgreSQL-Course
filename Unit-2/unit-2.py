
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

