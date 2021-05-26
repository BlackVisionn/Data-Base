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

#Скопировать в новую таблицу сотрудников, которые являются мужчинами
INSERT employees_muj (idemployees_muj, full_name, gender, experience, address, phone_num, personnel_num)
SELECT *
FROM employees
WHERE gender = 'Муж.';

#Скопировать в новую таблицу профессии ЗП которых больше 45000
INSERT big_salary (idbig_salary, position, big_salary)
SELECT position_to_organization.idposition_to_organization, position_to_organization.idposition, position_to_organization.salary
FROM position_to_organization
WHERE salary > 45000;

#Скопировать в новую таблицу серии и номер паспорта сотрудников которые получали паспорт от УФМС
INSERT ufms_pass (idufms_pass, series_and_number)
SELECT personal_data.idpersonal_data, personal_data.series_and_number_of_passport
FROM personal_data
WHERE passport_issued_by LIKE 'УФМС%';

#Вывести колличество мужчин и женщин
SELECT gender, COUNT(gender) AS count_gender
FROM employees
GROUP BY gender HAVING gender = 'Муж.' OR gender = 'Жен.';

#Вывести сред зп всех сотрудников из определенной организации
SELECT idorganization, AVG(salary) AS avg_salary
FROM position_to_organization
GROUP BY idorganization;

#Вывести самую большуб ЗП из определенной организации
SELECT idorganization, MAX(salary) AS max_salary
FROM position_to_organization
GROUP BY idorganization;

#Вывести самую маленькую ЗП из определенной организации
SELECT idorganization, MIN(salary) AS min_salary
FROM position_to_organization
GROUP BY idorganization;

#Вывести кол-во сотрудников которые повышали квалификацию в 2021 году
SELECT idemployees, date_of_increase
FROM informatio_about_professional_development
GROUP BY date_of_increase HAVING YEAR(date_of_increase) = '2021'
ORDER BY idemployees ASC;

#Вывести колличество сотрудников с определенным образование
SELECT education, COUNT(education) AS count_education
FROM diploma_of_education
GROUP BY education;

#Вывести кол-во сотрудников у которых ставка 1
SELECT rate, COUNT(employment_contract_number) AS count_rate
FROM contract
GROUP BY rate HAVING rate = '1';

#Вывести колличество сотрудников с определенной специальностью
SELECT speciality, COUNT(speciality) AS count_speciality
FROM diploma_of_education
GROUP BY speciality;

#Вывести колличество сотрудников которые повышали квалификацию в опеределенном ВУЗе
SELECT institution_name, COUNT(institution_name) AS count_institution
FROM informatio_about_professional_development
GROUP BY institution_name;

#Вывести ФИО сотрудников которые живут в Волгограде
SELECT full_name, home_address
FROM employees
GROUP BY home_address HAVING home_address LIKE 'Волгоград%';

#Вывести ФИО сотрудников у которых стаж работы несколько лет
SELECT full_name, work_experience
FROM employees
GROUP BY work_experience HAVING work_experience LIKE '%лет';

#Вывести табельные номера сотрудников у которых стаж работы несколько месяцев
SELECT personnel_number, work_experience
FROM employees
GROUP BY work_experience HAVING work_experience LIKE '%месяц%';

#Вывести ФИО мужчин
SELECT full_name, gender
FROM employees
GROUP BY full_name HAVING gender = 'Муж.';

#Вывести по убыванию индекс сотрудника и вид повышения квалификации
SELECT idemployees, type_of_increase
FROM informatio_about_professional_development
GROUP BY idemployees
ORDER BY idemployees DESC;

#Вывести серию и номера паспорта сотрудников которые получили паспорт от УФМС
SELECT series_and_number_of_passport, passport_issued_by
FROM personal_data
GROUP BY series_and_number_of_passport HAVING passport_issued_by LIKE 'УФМС%'
ORDER BY series_and_number_of_passport ASC;

#Вывести колличество сотрудников с определенными социальными льготами
SELECT name_of_benefits, COUNT(name_of_benefits) AS count_benefits
FROM social_benefits
GROUP BY name_of_benefits;

#Вывести индекс сотрудника и льготы которые он имеет
SELECT idemployees, name_of_benefits
FROM social_benefits
GROUP BY idemployees;

#Вывести кол-во сотрудников которые имеют отпуск определенного вида
SELECT type_of_vacation, COUNT(type_of_vacation) AS count_vacation_type
FROM vacation
GROUP BY type_of_vacation;

#Вывести приказы и соответсвующие им виды отпуска
SELECT basis_of_vacation, type_of_vacation
FROM vacation
GROUP BY basis_of_vacation;

#Вывести среднее кол-во дней отпуска определенного вида
SELECT type_of_vacation, AVG(number_of_vacation_days) AS avg_vacation_days
FROM vacation
GROUP BY type_of_vacation;

#Вывести номер трудового договора и соотвествующие ему основания для приема
SELECT employment_contract_number, grounds_for_admission
FROM contract
GROUP BY employment_contract_number
ORDER BY employment_contract_number ASC;

#Вывести информацию о приёме сотрудника
SELECT full_name, employment_contract_number, date_of_receipt, grounds_for_admission
FROM contract
JOIN employees ON contract.idemployee = employees.idemployees;

#Вывести ФИО сотрудника, его пол и дату рождения сотрудников
SELECT full_name, gender, birthday
FROM personal_data
JOIN employees ON personal_data.idpersonal_data = employees.idemployees;

#Вывести ФИО сотрудника, его табельный номер и отдел в котором он работает
SELECT full_name, employment_contract_number, department_name
FROM contract
JOIN employees ON contract.idemployee = employees.idemployees
JOIN department ON contract.iddepartment = department.iddepartment;

#Вывести ФИО и дату начала отпуска (если есть)
SELECT full_name, vacation_start_date
FROM employees
LEFT JOIN vacation ON employees.idemployees = vacation.idvacation
ORDER BY vacation_start_date DESC;

#Вывести ФИО и льготы(если имеются)
SELECT full_name, name_of_benefits
FROM employees
LEFT JOIN social_benefits ON employees.idemployees = social_benefits.idsocial_benefits
ORDER BY name_of_benefits DESC;

#Вывести ФИО сотрудника, его табельный номер и отдел в котором он работает
SELECT full_name, employment_contract_number, department_name
FROM contract
JOIN employees ON contract.idemployee = employees.idemployees
JOIN department ON contract.iddepartment = department.iddepartment;

#Вывести название должности, организацию и соответсвующую зарплату 
SELECT job_title, name_of_organization, salary
FROM position_to_organization
LEFT JOIN positionn ON position_to_organization.idposition = positionn.idposition
LEFT JOIN organizationn ON position_to_organization.idorganization = organizationn.idorganization;

#ФИО и вид повышения квалификации (если имеется)
SELECT full_name, type_of_increase
FROM employees
LEFT JOIN informatio_about_professional_development ON employees.idemployees = informatio_about_professional_development.idinformatio_about_professional_development
ORDER BY type_of_increase DESC;

#Вывести приказы сотрудников принятых в соответсвующий отдел на определенную должность и в определенной организации
SELECT grounds_for_admission, department_name, job_title, name_of_organization
FROM contract
JOIN department ON contract.idcontract = department.iddepartment
JOIN position_to_organization ON contract.idposition_to_organization = position_to_organization.idposition_to_organization
JOIN positionn ON position_to_organization.idposition = positionn.idposition
JOIN organizationn ON position_to_organization.idorganization = organizationn.idorganization;

#Вывести ФИО, ставку и зп сотрудника
SELECT full_name, rate, salary
FROM contract
JOIN employees ON contract.idcontract = employees.idemployees
JOIN position_to_organization ON contract.idposition_to_organization = position_to_organization.idposition_to_organization
ORDER BY rate ASC;

#Вывести отдел, его телефон и название организации
SELECT department_name, department_phone_number, name_of_organization
FROM department
JOIN organizationn ON department.idorganization = organizationn.idorganization
ORDER BY name_of_organization DESC;

#Вывести всю информацию об образовании сотрудника
SELECT full_name, education, speciality, qualification, date_of_issue
FROM diploma_of_education
JOIN employees ON diploma_of_education.iddiploma_of_education = employees.idemployees;

#Вывести ФИО и причину увольнения (если имеется)
SELECT full_name, reason_for_dismissal
FROM employees
LEFT JOIN dismissal ON employees.idemployees = dismissal.iddismissal;

#Вывести паспортные данные сотрудника
SELECT full_name, series_and_number_of_passport, passport_issued_by, when_the_passport_was_issued
FROM employees
JOIN personal_data ON employees.idemployees = personal_data.idpersonal_data
ORDER BY full_name ASC;

#Вывести информацию о сотрудниках имеющие льготы
SELECT full_name, name_of_benefits, document_number, date_of_issue_of_the_document
FROM employees
JOIN social_benefits ON employees.idemployees = social_benefits.idsocial_benefits
ORDER BY full_name ASC;

#Вывести всю информацию о сотруднике который устроился на работу
SELECT full_name, employment_contract_number, date_of_receipt, grounds_for_admission
FROM contract
JOIN employees ON contract.idcontract = employees.idemployees
ORDER BY employment_contract_number ASC;

#Номер приказа и дата подписания договора
SELECT grounds_for_admission FROM contract
UNION
SELECT date_of_receipt FROM contract;

#Адрес проживания сотрудника и где был выдан паспорт
SELECT home_address FROM employees
UNION
SELECT passport_issued_by FROM personal_data;

#Название отдела и номера отделов
SELECT department_name FROM department
UNION
SELECT department_phone_number FROM department;
