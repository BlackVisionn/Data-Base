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

#Вывод ФИО сотрудников которые являюст женщинами
SELECT vacation.type_of_vacation
FROM vacation
WHERE number_of_vacation_days < 10;

CREATE INDEX idx_vacation_number_of_vacation_days ON vacation(number_of_vacation_days);

DROP INDEX idx_contract_date_of_receipt ON contract;