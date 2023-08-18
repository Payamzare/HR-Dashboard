
DESCRIBE `human resources`;


SET sql_safe_updates = 0;


UPDATE `human resources`
SET birthdate = CASE
	WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END;



select *
from `human resources`;



ALTER TABLE `human resources`
MODIFY COLUMN birthdate DATE;




UPDATE `human resources`
SET hire_date = CASE
	WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END;


ALTER TABLE `human resources`
MODIFY COLUMN hire_date DATE;






ALTER TABLE `human resources`
MODIFY COLUMN termdate DATE;





ALTER TABLE `human resources` ADD COLUMN age_emoliy INT;


select *
from `human resources`;



update `human resources`
set age_emoliy = timestampdiff(year ,birthdate,curdate())
where age_emoliy is null;



select birthdate,age_emoliy from `human resources`;

SELECT
	min(age_emoliy) AS youngest,
    max(age_emoliy) AS oldest
FROM `human resources`;


UPDATE `human resources`
SET  termdate= date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate IS  NULL and termdate!='';


UPDATE `human resources`
SET  termdate='00:00:00'
WHERE termdate is null;

ALTER TABLE `human resources`
MODIFY COLUMN termdate date;
