JOIN:

1 -- Salario total de los empleados que trabajan en el departamento de TI:

SELECT SUM(e.salary) AS total_salary
FROM HR.employees e
JOIN HR.departments d ON e.department_id = d.department_id
WHERE d.department_name = 'IT';

2 -- Salario promedio de los empleados que trabajan en el departamento de Ventas y tienen un porcentaje de comisión mayor al 10%:

SELECT AVG(e.salary) AS avg_salary
FROM HR.employees e
JOIN HR.departments d ON e.department_id = d.department_id
WHERE d.department_name = 'Sales' AND e.commission_pct > 0.10;

3 -- Salario mínimo de los empleados que trabajan en el departamento de Marketing y tienen el cargo de Representante de Ventas:

SELECT MIN(e.salary) AS min_salary
FROM HR.employees e
JOIN HR.departments d ON e.department_id = d.department_id
JOIN HR.jobs j ON e.job_id = j.job_id
WHERE d.department_name = 'Marketing' AND j.job_title = 'Sales Representative';

4 -- Salario máximo de los empleados que trabajan en el departamento de Administración y tienen el cargo de presidente:

SELECT MAX(e.salary) AS max_salary
FROM HR.employees e
JOIN HR.departments d ON e.department_id = d.department_id
JOIN HR.jobs j ON e.job_id = j.job_id
WHERE d.department_name = 'Administration' AND j.job_title = 'President';

5 -- Salario promedio de los empleados que trabajan en el departamento de TI y tienen un puesto de trabajo de Programador o Analista, y tienen un salario superior a 5000:

SELECT AVG(e.salary) AS avg_salary
FROM HR.employees e
JOIN HR.departments d ON e.department_id = d.department_id
JOIN HR.jobs j ON e.job_id = j.job_id
WHERE d.department_name = 'IT' AND (j.job_title = 'Programmer' OR j.job_title = 'Analyst') AND e.salary > 5000;

6 -- Salario total de los empleados que trabajan en el departamento de Ventas y tienen un porcentaje de comisión superior al 10%, y tienen un cargo de Representante de Ventas o Gerente de Ventas:

SELECT SUM(e.salary) AS total_salary
FROM HR.employees e
JOIN HR.departments d ON e.department_id = d.department_id
JOIN HR.jobs j ON e.job_id = j.job_id
WHERE d.department_name = 'Sales' AND e.commission_pct > 0.10 AND (j.job_title = 'Sales Representative' OR j.job_title = 'Sales Manager');

LEFT JOIN:

1 -- Departamentos que no tienen empleados:

SELECT d.department_name
FROM HR.departments d
LEFT JOIN HR.employees e ON d.department_id = e.department_id
WHERE e.employee_id IS NULL;

2 -- Empleados que no han sido asignados a ningún departamento:

SELECT e.first_name, e.last_name
FROM HR.employees e
LEFT JOIN HR.departments d ON e.department_id = d.department_id
WHERE d.department_id IS NULL;

3 -- Salario promedio de los empleados que no han sido asignados a ningún departamento y tienen un porcentaje de comisión superior al 10%:

SELECT AVG(e.salary) AS avg_salary
FROM HR.employees e
LEFT JOIN HR.departments d ON e.department_id = d.department_id
WHERE d.department_id IS NULL AND e.commission_pct > 0.10;

4 -- Salario máximo de los empleados que no han sido asignados a ningún departamento y tienen el cargo de Gerente:

SELECT MAX(e.salary) AS max_salary
FROM HR.employees e
LEFT JOIN HR.departments d ON e.department_id = d.department_id
JOIN HR.jobs j ON e.job_id = j.job_id

5 -- Salario total de los empleados que no han sido asignados a ningún departamento y tienen un puesto de trabajo de Empleado de Inventario o Empleado de Envíos:

SELECT SUM(e.salary) AS total_salary
FROM HR.employees e
LEFT JOIN HR.departments d ON e.department_id = d.department_id
JOIN HR.jobs j ON e.job_id = j.job_id
WHERE d.department_id IS NULL AND (j.job_title = 'Stock Clerk' OR j.job_title = 'Shipping Clerk');

6 -- Salario promedio de los empleados que no han sido asignados a ningún departamento y tienen un puesto de trabajo de Programador o Representante de Relaciones Públicas:

SELECT AVG(e.salary) AS avg_salary
FROM HR.employees e
LEFT JOIN HR.departments d ON e.department_id = d.department_id
JOIN HR.jobs j ON e.job_id = j.job_id
WHERE d.department_id IS NULL AND (j.job_title = 'Programmer' OR j.job_title = 'Public Relations Representative');

RIGHT JOIN:

1 -- Departamentos que no tienen gerentes:

SELECT d.department_name
FROM HR.departments d
RIGHT JOIN HR.employees e ON d.manager_id = e.employee_id
WHERE e.employee_id IS NULL;

2 -- Empleados que no son gerentes:

SELECT e.first_name, e.last_name
FROM HR.employees e
RIGHT JOIN HR.departments d ON e.employee_id = d.manager_id
WHERE d.manager_id IS NULL;

3 -- Salario promedio de los empleados que no son gerentes y tienen un porcentaje de comisión mayor al 10%:

SELECT AVG(e.salary) AS avg_salary
FROM HR.employees e
RIGHT JOIN HR.departments d ON e.employee_id = d.manager_id
WHERE d.manager_id IS NULL AND e.commission_pct > 0.10;

4 -- Salario máximo de los empleados que no son gerentes y tienen el cargo de Empleado de Envíos:

SELECT MAX(e.salary) AS max_salary
FROM HR.employees e
RIGHT JOIN HR.departments d ON e.employee_id = d.manager_id
JOIN HR.jobs j ON e.job_id = j.job_id
WHERE d.manager_id IS NULL AND j.job_title = 'Shipping Clerk';

5 -- Salario total de los empleados que no son gerentes y tienen un puesto de trabajo de Empleado de Inventario o Representante de Relaciones Públicas:

SELECT SUM(e.salary) AS total_salary
FROM HR.employees e
RIGHT JOIN HR.departments d ON e.employee_id = d.manager_id
JOIN HR.jobs j ON e.job_id = j.job_id
WHERE d.manager_id IS NULL AND (j.job_title = 'Stock Clerk' OR j.job_title = 'Public Relations Representative');

6 -- Salario promedio de los empleados que no son gerentes y tienen un cargo de Programador o Representante de Ventas:

SELECT AVG(e.salary) AS avg_salary
FROM HR.employees e
RIGHT JOIN HR.departments d ON e.employee_id = d.manager_id
JOIN HR.jobs j ON e.job_id = j.job_id
WHERE d.manager_id IS NULL AND (j.job_title = 'Programmer' OR j.job_title = 'Sales Representative');

--  CREACION DE TABLAS:

1.--  Crear la tabla employees_info:

CREATE TABLE HR.employees_info AS
SELECT e.employee_id, e.first_name, e.last_name, d.department_name, e.salary
FROM HR.employees e
JOIN HR.departments d ON e.department_id = d.department_id;

2.--  Crear la tabla departments_info:

CREATE TABLE HR.departments_info AS
SELECT d.department_id, d.department_name, SUM(e.salary) AS total_salary
FROM HR.departments d
JOIN HR.employees e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;

3.--  Crear la tabla empleados_copia:

CREATE TABLE HR.empleados_copia AS
SELECT * FROM HR.employees;

4.--  Crear la tabla departamentos_copia:

CREATE TABLE HR.departamentos_copia AS
SELECT * FROM HR.departments;

// INSERT INTO:

1.--  Insertar un nuevo empleado:

INSERT INTO HR.employees (employee_id, first_name, last_name, job_id, salary, commission_pct, manager_id, department_id)
VALUES (1000, 'John', 'Doe', 'SA_REP', 5000, 0.10, 145, 80);

2.--  Insertar todos los empleados de la tabla empleados en la tabla employees_copy:

INSERT INTO HR.employees_copy
SELECT * FROM HR.employees;

3.--  Insertar todos los departamentos de la tabla departamentos en la tabla departamentos_copia:

INSERT INTO HR.departamentos_copia
SELECT * FROM HR.departments;

4.--  Insertar un nuevo departamento:

INSERT INTO HR.departments (department_id, department_name, location_id)
VALUES (300, 'Marketing', 1700);

5.--  Insertar todos los empleados de la tabla employees_bonus en la tabla empleados, cuando la comisión es mayor al 30%:

INSERT INTO HR.employees
SELECT * FROM HR.employees_bonus
WHERE commission_pct > 0.30;



