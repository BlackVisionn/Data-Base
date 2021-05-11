use human_resources_department;

SET SQL_SAFE_UPDATES = 0;
SET foreign_key_checks = 0;

#Изменить ФИО с индексом 1
UPDATE employees
SET full_name = "Седых Иван Александрович"
WHERE idemployees = 1;

#Изменить ставку работником профессии с индексом 1
UPDATE position_to_organization
SET salary = 25000
WHERE idposition = 1;

#Изменить кем был выдан паспорт работникам которым паспорт выдал УФМС России по городу Волгограду
UPDATE personal_data
SET passport_issued_by = "УФМС России по городу Москве"
WHERE passport_issued_by = "УФМС России по городу Волгограду";

#Изменить номер телефона отдела Бухгалтерии
UPDATE department
SET department_phone_number = "54-55-17"
WHERE department_name = "Бухгалтерия";

#Добавить к текущей ставке 2000 сотрудникам у которых ставка больше 45000
UPDATE position_to_organization
SET salary = salary + 2000
WHERE salary > 45000;

#Удалить сотрудников у которых опыт работы 1 месяц
DELETE FROM employees WHERE work_experience = "1 месяц";

#Удалить сотрудников у которых среднее образование
DELETE FROM diploma_of_education WHERE education = "среднее";

#Удалить сотрудников у которых Учебный отпуск
DELETE FROM vacation WHERE type_of_vacation = "Учебный";

#Удалить сотрудника у которого табельный номер 85
DELETE FROM employees WHERE personnel_number = "85";

#Удалить сотрудников которые родились 12.05.1998
DELETE FROM personal_data WHERE birthday = "1998-05-12";

