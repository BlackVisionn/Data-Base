use human_resources_department;

#Вывод ФИО сотрудников которые являюст женщинами
SELECT employees.full_name
FROM employees
WHERE gender = 'Female';

CREATE INDEX idx_employees_gender ON employees(gender);

#Вывод ФИО сотрудников у которых табельный номер меньше 100
EXPLAIN SELECT employees.full_name
FROM employees
WHERE personnel_number < 100;

CREATE INDEX idx_employees_personnel_number ON employees(personnel_number);

#Вывести тип отпуска сотрудников у которых дней отпуска меньше 5
EXPLAIN SELECT vacation.type_of_vacation
FROM vacation
WHERE number_of_vacation_days < 5;

CREATE INDEX idx_vacation_number_of_vacation_days ON vacation(number_of_vacation_days);

#Вывести имена сотрудников которые живут по определенному адресу
EXPLAIN SELECT employees.full_name
FROM employees
WHERE home_address LIKE '%Street%';

CREATE INDEX idx_employees_home_address ON employees(home_address);

#Вывести название льгот сотрудника номер документа которых равен 709 или меньше 50
EXPLAIN SELECT social_benefits.name_of_benefits
FROM social_benefits
WHERE document_number = 709 OR document_number < 50;

CREATE INDEX idx_social_benefits_document_number ON social_benefits(document_number);

DROP INDEX idx_social_benefits_document_number ON social_benefits;

# Показать типы отпусков определенного типа и посчитать их
DELIMITER $$
CREATE PROCEDURE Show_types_of_vacation (IN vacation_type VARCHAR (45), OUT count_types INT)
BEGIN
	SELECT vacation.type_of_vacation, vacation_start_date, number_of_vacation_days
    FROM vacation
    WHERE type_of_vacation = vacation_type;
    
    SELECT COUNT(type_of_vacation) INTO count_types
    FROM vacation
    WHERE type_of_vacation = vacation_type;
END $$
DELIMITER ;

CALL Show_types_of_vacation('tristique', @count_types);
SELECT @count_types;

# Показать сотрудников мужчин и посчитать их кол-во
DELIMITER $$
CREATE PROCEDURE Show_men (IN gender_male VARCHAR (45), OUT count_employees INT)
BEGIN
	SELECT employees.full_name, gender, phone_number
    FROM employees
    WHERE gender = gender_male;
    
    SELECT COUNT(gender) INTO count_employees
    FROM employees
    WHERE gender = gender_male;
END $$
DELIMITER ;

CALL Show_men('Male', @count_employees);
SELECT @count_employees;

# Показать сотрудников у которых двойная ставка и были приняты по определенным основаниям и посчитать их кол-во
DELIMITER $$
CREATE PROCEDURE Show_double_rate (IN double_rate INT, IN grounds VARCHAR(45), OUT count_employees INT)
BEGIN
	SELECT full_name, rate, grounds_for_admission
    FROM contract
    JOIN employees ON contract.idemployee = employees.idemployees
    WHERE rate = double_rate AND grounds_for_admission = grounds;
    
    SELECT COUNT(rate) INTO count_employees
    FROM contract
    WHERE rate = double_rate AND grounds_for_admission = grounds;
END $$
DELIMITER ;

CALL Show_double_rate(2,'ac leo', @count_employees);
SELECT @count_employees;

# Рассчитать кол-во сотрудников в каждой организации
DELIMITER $$
CREATE FUNCTION organization_employees_count(
	organization_name VARCHAR(45)
)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE count INT;
    SELECT COUNT(idemployee)
    INTO count
    FROM employees
	JOIN contract ON employees.idemployees = contract.idemployee	
	JOIN position_to_organization ON contract.idposition_to_organization = position_to_organization.idposition_to_organization	
	JOIN organizationn ON position_to_organization.idorganization = organizationn.idorganization
    WHERE name_of_organization = organization_name;
RETURN count;
END $$
DELIMITER ;

SELECT name_of_organization AS organization_name, organization_employees_count(name_of_organization) AS count_employee
FROM organizationn;

# Рассчитать кол-во сотрудников с определенным образованием
DELIMITER $$
CREATE FUNCTION count_employee_education(
	employee_education VARCHAR(45)
)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE count INT;
    SELECT COUNT(idemployees)
    INTO count
    FROM diploma_of_education	
    WHERE education = employee_education;
RETURN count;
END $$
DELIMITER ;

SELECT count_employee_education('morbi') AS count_employee
FROM diploma_of_education
GROUP BY count_employee;

# Рассчитать кол-во сотрудников уволенных по определенной статье
DELIMITER $$
CREATE FUNCTION count_employee_dismissal(
	employee_article VARCHAR(45)
)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE count INT;
    SELECT COUNT(idemployees)
    INTO count
    FROM employees
    JOIN contract ON employees.idemployees = contract.idemployee
	JOIN dismissal ON contract.idcontract = dismissal.iddismissal	
    WHERE article = employee_article;
RETURN count;
END $$
DELIMITER ;

SELECT count_employee_dismissal('penatibus') AS count_employee_article
FROM employees
GROUP BY count_employee_article;  
