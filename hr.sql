-- CRIANDO UMA VISÃO DE PAÍS 
CREATE VIEW PAISES_AMERICANOS AS 
SELECT COUNTRY_ID Sigla, COUNTRY_NAME Nome FROM COUNTRIES WHERE REGION_ID = 2; 
 
-- SELECT * FROM COUNTRIES WHERE REGION_ID = 2; 

-- SELECT COUNTRY_ID Sigla, COUNTRY_NAME Nome FROM COUNTRIES WHERE REGION_ID = 2; 

SELECT * FROM PAISES_AMERICANOS; 

--parto daquilo que eu preciso para posteriomente puxar minha visao 

-- criação de visao contendo nome dos empregados e nomes dos departamentos onde trabalham

CREATE VIEW EMPREGADOS_DEPARTAMENTOS AS 
SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME 
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID; 

create or replace view EMPREGADOS_DEPARTAMENTOS AS 
SELECT E.FIRST_NAME || ' ' || E.LAST_NAME as Nome,
    D.DEPARTMENT_NAME as Departamento 
FROM EMPLOYEES E
left outer join DEPARTMENTS D
on E.DEPARTMENT_ID = D.DEPARTMENT_ID; 

select * from empregados_departamentos; 

CREATE VIEW EMP80_VIEW
AS SELECT employee_id, last_name, salary
FROM Employees
WHERE department_id = 80;

select * from emp80_view;

CREATE VIEW EMP50_VIEW(Nome, Sal_anual)
AS SELECT first_name || ' ' || last_name,
salary*12
FROM Employees
WHERE department_id = 50;

select * from emp50_view; 

CREATE VIEW EMP_IT_VIEW
AS SELECT last_name, hire_date, salary
FROM Employees
WHERE job_id = 'IT_PROG'; 

select * from emp_it_view; 

CREATE OR REPLACE VIEW Emp_Dept_View(nome,qtd_emp,
min_sal, max_sal, avg_sal)
AS SELECT department_name, COUNT(*), MIN(salary),
MAX(salary), ROUND(AVG(salary),2)
FROM EMPLOYEES E JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY department_name;

select * from emp_dept_view; 

CREATE OR REPLACE VIEW DEPT_ADDRESS_VIEW (nome,
rua, cidade, cep, estado, pais)
AS SELECT department_name, street_address, city,
postal_code, state_province, country_name
FROM DEPARTMENTS D JOIN LOCATIONS L
ON D.LOCATION_ID = L.LOCATION_ID
JOIN COUNTRIES C
ON L.COUNTRY_ID = C.COUNTRY_ID;

select * from DEPT_ADDRESS_VIEW; 

------------- EXERCICIOS DE FIXAÇÃO 
--Criar uma view EMP_ST_CLERK que contenha dados dos empregados com função
--‘ST_CLERK’
-- Colunas: employee_id, last_name, email, hire_date, job_id

CREATE OR REPLACE VIEW EMP_ST_CLERK 
AS SELECT employee_id, last_name, email, hire_date, job_id 
FROM EMPLOYEES
WHERE JOB_ID = 'ST_CLERK'; 

SELECT * FROM EMP_ST_CLERK; 

-- Criar (ou alterar) a view de modo que não seja possível alterar seu conteúdo com funções de
-- empregado diferentes de ‘ST_CLERK’

CREATE OR REPLACE VIEW EMP_ST_CLERK 
AS SELECT employee_id, last_name, email, hire_date, job_id 
FROM EMPLOYEES
WHERE JOB_ID = 'ST_CLERK'
WITH CHECK OPTION; 

SELECT * FROM EMP_ST_CLERK; 

-- Adicione um novo empregado na view EMP_ST_CLERK, com a função ‘ST_CLERK’

INSERT INTO EMP_ST_CLERK(employee_id, last_name, email, hire_date, job_id) VALUES (10, 'Santana', 'lauane@ifsp.edu.br', '09/09/09', 'ST_CLERK');  

SELECT * FROM EMP_ST_CLERK; 

-- Explique o que aconteceu na tabela Employees? O registro foi inserido na tabela Employees e os campos que não estavam na view foram inseridos com valor null

SELECT * FROM EMPLOYEES; 

-- Atualize EMP_ST_CLERK de modo que o empregado adicionado tenha a função ‘IT_PROG’ 

UPDATE EMP_ST_CLERK 
    SET JOB_ID = 'IT_PROG' 
WHERE EMPLOYEE_ID = 10; 
Explique o que aconteceu
-- Explique o que aconteceu 
-- Não conseguimos atualizar pois criamos a View como ''with check option'. 