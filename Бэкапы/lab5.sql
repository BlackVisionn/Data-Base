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