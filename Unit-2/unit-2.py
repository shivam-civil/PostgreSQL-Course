
# UNIT - 2 :   

#  CHECK CONSTRAINT 

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

