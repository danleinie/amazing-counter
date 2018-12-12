/*EJERCICIO 1*/
SELECT *
FROM JOB_HISTORY
WHERE START_DATE + INTERVAL '3' YEAR >= END_DATE;

/*EJERCICIO 2*/
SELECT *
FROM JOB_HISTORY
WHERE EXTRACT(MONTH FROM END_DATE) IN (3,6,7);

/*EJERCICIO 3*/
SELECT FIRST_NAME, LAST_NAME, SALARY + (SALARY*NVL(COMMISSION_PCT,0)) AS "SALARIO TOTAL", HIRE_DATE
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE,'FMDAY')='LUNES'; 

/*EJERCICIO 4*/
SELECT UPPER(DEPARTMENT_NAME)
FROM DEPARTMENTS
WHERE MANAGER_ID IS NULL;

/*EJERCICIO 5*/
SELECT '<' || STREET_ADDRESS || '>,'
       || '<' || POSTAL_CODE || '>,'
       || '<' || CITY || '>,'
       || '(<' || STATE_PROVINCE || '>)' AS DIRECCION_COMPLETA
FROM LOCATIONS;

/*EJERCICIO 6*/

UPDATE EMPLOYEES
SET PHONE_NUMBER = REPLACE(PHONE_NUMBER,'.','-');
SELECT *
FROM EMPLOYEES; 
/*LA UNICA FORMA QUE CONSIGO SACAR LOS DATOS DE TELEFONO CON GUIONES ES MODIFICANDO LA COLUMNA*/
UPDATE EMPLOYEES
SET PHONE_NUMBER = REPLACE(PHONE_NUMBER,'-','.');
/*MODIFICA LA COLUMNA PHONE_NUMBER CON LOS PUNTOS OTRA VEZ*/

SELECT EMPLOYEES.*,REPLACE(PHONE_NUMBER,'.','-') AS TELEFONO
FROM EMPLOYEES;
/*DE ESTA FORMA APARECEN LOS DATOS TELEFONICOS 2 VECES UNA CON PUNTOS Y OTRA CON GUIONES PERO NO MODIFICO LA COLUMNA*/

/*EJERCICIO 7*/
SELECT FIRST_NAME, LOWER(EMAIL) AS EMAIL, SALARY
FROM EMPLOYEES
WHERE MOD(TRUNC(SALARY/1000),2)=1;
