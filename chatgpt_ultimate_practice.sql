CREATE TABLE engineers(
id SERIAL PRIMARY KEY,
name VARCHAR(50) NOT NULL,
salary INTEGER CONSTRAINT salary_check CHECK(salary > 10000)
)

INSERT INTO engineers(name,salary)
VALUES 
('CHATGPT',200)

ALTER TABLE engineers 
ADD CONSTRAINT unique_name UNIQUE (name) ;


CREATE TABLE projects(
id SERIAL PRIMARY KEY ,
project_name VARCHAR(50) ,
engineer_id INT, 
FOREIGN KEY (engineer_id) REFERENCES engineers(id)
)

SELECT conname FROM pg_constraint 
WHERE conrelid = 'projects'::regclass;

ALTER TABLE projects 
DROP CONSTRAINT projects_engineer_id_fkey ;

ALTER TABLE projects 
ADD CONSTRAINT fk_engineer 
FOREIGN KEY (engineer_id) REFERENCES engineers(id) ;


INSERT INTO projects(project_name,engineer_id)
VALUES 
('HIGHWAY',10)

ALTER TABLE PROJECTS 
ADD COLUMN status VARCHAR(20) DEFAULT 'ongoing';

UPDATE PROJECTS 
SET STATUS = 'completed' 
WHERE PROJECT_NAME = 'ROAD';

DELETE FROM PROJECTS 
WHERE status = 'ongoing' ;

ALTER TABLE PROJECTS 
ALTER COLUMN STATUS TYPE VARCHAR(50) ;



