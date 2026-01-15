
SELECT * FROM materials_stock


ALTER TABLE materials_stock
ADD COLUMN date DATE NOT NULL DEFAULT CURRENT_DATE;
SELECT * FROM materials_stock;


ALTER TABLE materials_stock
DROP COLUMN date;

ALTER TABLE materials_stock 
RENAME COLUMN name TO materials_name;



ALTER TABLE materials_stock 
RENAME  TO materials;

SELECT * FROM materials;

ALTER TABLE materials 
RENAME TO materials_stock ;


ALTER TABLE materials_stock 
ALTER COLUMN quantity
SET DATA TYPE NUMERIC(50,4) ;

ALTER TABLE materials_stock 
ALTER COLUMN unit 
DROP NOT NULL;


ALTER TABLE materials_stock 
ALTER COLUMN unit 
SET DEFAULT 'UNKNOWN';

ALTER TABLE materials_stock 
ALTER COLUMN unit 
DROP DEFAULT ;
