--   CREATE TABLE THAT HOLDS MATERIALS STOCK IMPORTED  DATAS 
CREATE TABLE IF NOT EXISTS materials(
mat_id SERIAL PRIMARY KEY ,
name TEXT NOT NULL DEFAULT 'unknown' ,
quantity NUMERIC(100,4) NOT NULL DEFAULT 0,
cost NUMERIC(100,4) NOT NULL DEFAULT 0
);

--  CREATE TABLE THAT HOLDS THE MATERIALS USAGE DATAS AS INPUT OF MATERIAL ID OF MATERIAL FROM MATERIALS STOCK TABLE 
CREATE TABLE IF NOT EXISTS usage(
usage_id BIGSERIAL PRIMARY KEY,
mat_id INTEGER NOT NULL DEFAULT 0 ,
date DATE NOT NULL DEFAULT CURRENT_DATE,
FOREIGN KEY (mat_id)
REFERENCES materials(mat_id)
);

-- ADD date_of_import Column in table materials
ALTER TABLE materials 
ADD COLUMN date_of_import DATE NOT NULL DEFAULT CURRENT_DATE 

-- REMOVE COLUMN date_of_import from materials table 
ALTER TABLE materials 
DROP COLUMN date_of_import 

-- RENAME COLUMN NAME 
ALTER TABLE materials  
RENAME date_of_import TO imported_date;

-- RENAME COLUMN NAME 
ALTER TABLE all_materials 
RENAME TO  materials; 

-- CREATE A TABLE users WITH CONSTRAINTS 
CREATE TABLE IF NOT EXISTS users(
user_id BIGSERIAL PRIMARY KEY,
fname TEXT NOT NULL DEFAULT 'unknown',
lname TEXT NOT NULL DEFAULT 'unknown',
email TEXT NOT NULL DEFAULT 'unknown' UNIQUE CONSTRAINT email_ends_with_com CHECK( LOWER(RIGHT(email,3))='com' ),
address TEXT NOT NULL DEFAULT 'unknown' CONSTRAINT address_greater_than_5_words CHECK( LENGTH(TRIM(address)) > 5 ) ,
CONSTRAINT fname_lname_greater_than_1 CHECK(  LENGTH(TRIM(fname)) > 1 AND LENGTH(TRIM(fname)) > 1   )
);


-- DROP CONSTRAINT 
ALTER TABLE users
DROP  CONSTRAINT email_ends_with_com  ; 

-- ADD CONSTRAINT TO EXISTING TABLE users
ALTER TABLE users
ADD CONSTRAINT email_ends_with_com CHECK( LOWER(TRIM(email))='com' ) ;

-- REMOVE NOT NULL FROM COLUMN (COLUMN MODIFY )
ALTER TABLE users
ALTER COLUMN email
DROP NOT NULL ;

-- SET NOT NULL IN COLUMN TO EXISTING TABLE 
ALTER TABLE users
ALTER COLUMN email
SET NOT NULL ;

-- CHANGE DATA TYPE TO COLUMN TO EXISTING TABLE 
ALTER TABLE users 
ALTER COLUMN emaIl 
SET DATA TYPE VARCHAR(100)
;

-- ADD DATAS TO materials TABLE 

INSERT INTO materials(name,quantity,cost) 
VALUES
('cement_opc_43',100.5555,7000.5432),
('cement_opc_53',95.2500,6680.1250),
('cement_ppc',110.7500,7750.3300),
('river_sand_fine',200.1250,3200.7500),
('river_sand_coarse',180.5000,2890.6000),
('manufactured_sand',250.0000,4100.0000),
('aggregate_10mm',300.7500,7800.4500),
('aggregate_20mm',275.4000,7150.3000),
('aggregate_40mm',320.0000,8400.0000),
('steel_fe500',1500.5000,165000.7500)
;


-- ADD DATAS TO usage TABLE  ( IGNORE THE QUANTITY FOR NOW )


INSERT INTO usage(mat_id)
VALUES 
(102),(104),(109),(107),(150)
;
INSERT INTO usage(mat_id) 
VALUES 
(102),(104),(107);

-- CASE IN POSTGRESQL (YOU CAN USE MULTIPLE WHEN BUT DONT SEPERATE IT WITH COMMAS JUST LIKE IN PYTHON )

SELECT *,
CASE 
WHEN cost>3200 THEN 'HIGH COST' ELSE 'LOW COST'
END AS cost_cat 
FROM materials 

--  LEFT JOIN (KEEP ALL DATAS OF LEFT TABLE)
SELECT usage.usage_id,usage.mat_id,materials.name
FROM usage LEFT JOIN materials  ON usage.mat_id=materials.mat_id ;


-- RIGHT JOIN (KEEP ALL DATAS OF RIGHT TABLE)
SELECT usage.usage_id,usage.mat_id,materials.name
FROM usage RIGHT JOIN materials  ON usage.mat_id=materials.mat_id ;

-- INNER JOIN (KEEP ONLY THE MATCHED CONDITION DATAS )
SELECT usage.usage_id,usage.mat_id,materials.name
FROM usage INNER JOIN materials  ON usage.mat_id=materials.mat_id ;









