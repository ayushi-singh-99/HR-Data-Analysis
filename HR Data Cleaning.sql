create database project;
use project;
select * from hr;
ALTER TABLE hr
CHANGE COLUMN ï»¿id emp_id VARCHAR(20) NULL;
DESCRIBE hr;
SET sql_safe_updates = 0;
UPDATE hr
SET birthdate = CASE
	WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END;
ALTER TABLE hr
MODIFY COLUMN birthdate DATE;
UPDATE hr
SET hire_date = CASE
	WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END;
ALTER TABLE hr
MODIFY COLUMN hire_date DATE;
UPDATE hr
SET termdate = date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate IS NOT NULL AND termdate != '' ;
select termdate from hr;
UPDATE hr
SET termdate = '0000-00-00'
WHERE termdate IS NULL OR termdate = '';
describe hr;
ALTER TABLE hr ADD COLUMN age INT;
UPDATE hr
SET age = timestampdiff(YEAR, birthdate, CURDATE());
SELECT 
	min(age) AS youngest,
    max(age) AS oldest
FROM hr;
SELECT count(*) FROM hr WHERE age < 18;
SELECT COUNT(*) FROM hr WHERE termdate > CURDATE();
SELECT COUNT(*)
FROM hr
WHERE termdate = '0000-00-00';








