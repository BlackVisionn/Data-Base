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

#Вывод всех мужчин
SELECT *
FROM employees
WHERE gender = "Муж.";

#Вывод ФИО сотрудников у которых отсутсвуют номера телефонов
SELECT employees.full_name
FROM employees
WHERE phone_number IS NULL;

#Вывод ФИО и номера телефонов сотрудников которые имеют опыт работы 3 года или 7 лет
SELECT employees.full_name, employees.phone_number
FROM employees
WHERE work_experience = "3 года" OR work_experience = "7 лет";

#Вывести номер приказа принятого в заданный год
SELECT contract.grounds_for_admission
FROM contract
WHERE year(date_of_receipt) = '2010';

#Вывод табельных номеров сотрудников которые работают в отделах с индексами от 1 до 3
SELECT contract.employment_contract_number
FROM contract
WHERE iddepartment BETWEEN 1 AND 3;

#Вывод специальности с высшем образованием
SELECT diploma_of_education.speciality
FROM diploma_of_education
WHERE education = 'высшее';

#Вывод типа повышения квалификации в выбранном ВУЗ'е
SELECT informatio_about_professional_development.type_of_increase
FROM informatio_about_professional_development
WHERE institution_name = 'ВОЛГУ';

#Вывод ИНН и СНИЛС сотрудников которые родились между 1969 и 1990
SELECT personal_data.INN, personal_data.SNILS
FROM personal_data
WHERE year(birthday) BETWEEN 1969 AND 1990;

#Вывод серии и номера паспорта сотрудников которые получили паспорт в УФМС России по городу Москве
SELECT DISTINCT series_and_number_of_passport
FROM personal_data
WHERE passport_issued_by = 'УФМС России по городу Москве';

#Вывод названий профессий в опеределенном интервале
SELECT DISTINCT job_title
FROM position
WHERE idposition BETWEEN 1 AND 3;

#Вывод индекса сотрудников у которых отпуск меньше 9 дней
SELECT DISTINCT idemployees
FROM vacation
WHERE number_of_vacation_days < 9;

#Вывод номер документа сотрудника который имеет льготу многодетного родителя
SELECT DISTINCT document_number
FROM social_benefits
WHERE name_of_benefits = 'Многодетные матери или отцы';

#Вывод серии и номера диплома сотрудников которые выпустились в 2005 году и имеют квалификацию Менеджер
SELECT diploma_of_education.series_and_number
FROM diploma_of_education
WHERE year(date_of_issue) = 2005 AND qualification = 'Менеджер';

#Вывод даты увольнения сотрудника по статье 77 ТК РФ
SELECT dismissal.date_of_dismissal
FROM dismissal
WHERE article = '77 ТК РФ';

#Вывод ФИО сотрудников у которых табельный номер больше 21
SELECT employees.full_name
FROM employees
WHERE personnel_number > 21;

#Вывод зарплаты сотрудников работающих в организации с индексом 2
SELECT position_to_organization.salary
FROM position_to_organization
WHERE idorganization = 2;

#Вывод индекса профессии сотрудника работающего в организации с индексом 1
SELECT position_to_organization.idposition
FROM position_to_organization
WHERE idorganization = 1;

#Вывод названия отдела и номер его телефона для выбраноой организации
SELECT department.department_name, department.department_phone_number
FROM department
WHERE idorganization = 1;

#Вывод ФИО сотрудников которые являюст женщинами и имеют стаж работы 17 лет
SELECT employees.full_name
FROM employees
WHERE gender = 'Жен.' AND work_experience = '17 лет';

#Вывод приказа о приеме на работу сотрудников работающих в отделе с индексом 3
SELECT contract.grounds_for_admission
FROM contract
WHERE iddepartment = 3;

#Вывод организаций в названии которых содержится Эспада
SELECT *
FROM organization
WHERE name_of_organization LIKE 'Эспада%';

#Вывод сотрудников с фамилией Кирилюк
SELECT *
FROM employees
WHERE full_name LIKE 'Кирилюк%';

#Вывод номера телефонов сотрудников которые работают пару месяцев
SELECT employees.phone_number
FROM employees
WHERE work_experience LIKE '%месяц%';

#Вывод табельных номеров и адреса сотрудников которые живут по адресу Волгоград г, Полухина ул
SELECT employees.personnel_number, employees.home_address
FROM employees
WHERE home_address LIKE 'Волгоград г, Полухина ул%';

#Вывод даты выдачи паспорта сотрудников с серией паспорта 18 15
SELECT personal_data.when_the_passport_was_issued
FROM personal_data
WHERE series_and_number_of_passport LIKE '18 15%';
