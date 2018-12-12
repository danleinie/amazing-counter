/*Seleccionar las ciudades, fechas Y temperaturas cuya temperatura maxima estuviera entre 35 y 40 grados y fuera martes o jueves.*/
SELECT *
FROM TEMPERATURAS
WHERE MAXIMA BETWEEN 35 AND 40
    AND TO_CHAR(FECHA,'D') IN(2,4);
    
/*Seleccionar el número de horas de sol en Jaen y Almeria para los meses pares.*/
SELECT *
FROM HORAS_SOL
WHERE CIUDAD IN ('JAEN','ALMERIA')
    AND MOD(TO_CHAR(FECHA,'MM'),2)=0;

/*Seleccionar las precipitaciones de los sábados de Febrero, de los martes de Marzo y de los jueves de Abril de las ciudades de Sevilla y Jaen.*/
SELECT *
FROM PRECIPITACIONES
WHERE TO_CHAR(FECHA,'D/MM') IN('6/02','2/03','4/04')
    AND CIUDAD IN ('SEVILLA','JAEN');

/*Seleccionar las temperaturas de aquellas ciudades con contengan una E de aquellos martes que fueran final de mes.*/
SELECT TEMPERATURAS.*
FROM TEMPERATURAS
WHERE CIUDAD LIKE '%E%' 
    AND TO_CHAR(LAST_DAY(FECHA),'D')=2
    AND FECHA = LAST_DAY(FECHA);
    
/*Seleccionar las precipitaciones de los dias de mitad de mes*/
SELECT *
FROM PRECIPITACIONES
WHERE TO_CHAR(FECHA,'DD') = TRUNC(TO_CHAR(LAST_DAY(FECHA),'DD')/2);

/*Seleccionar las horas de sol de las fechas que estén en las semanas impares del año.*/
SELECT *
FROM HORAS_SOL
WHERE MOD(TO_CHAR(FECHA,'IW'),2)=1;

/*Seleccionar las ciudades y temperaturas m�ximas para aquellas ciudades que acaban en A, para aquellos meses que contengan una B, y aquellos d�as que fuesen mi�rcoles y d�a par.*/
SELECT *
FROM TEMPERATURAS
WHERE CIUDAD LIKE '%A' 
    AND TO_CHAR(FECHA,'MONTH') LIKE '%B%'
    AND TO_CHAR(FECHA,'D')=3
    AND MOD(TO_CHAR(FECHA,'DD'),2)=0;
/*Seleccionar las ciudades y sus correspondientes horas de sol para aquellos d�as con menos de 3 horas de sol para aquellas fechas cuyo siguiente martes sea un d�a impar.*/
SELECT HORAS_SOL.*, TO_CHAR(NEXT_DAY(FECHA,'MARTES'),'DD')
FROM HORAS_SOL
WHERE HORAS < 3
    AND MOD(TO_CHAR(NEXT_DAY(FECHA,'MARTES'),'DD'),2)=1;
/*Seleccionar la ciudad y sus temperaturas mínimas para aquellas fechas de primavera o de otoño que sean Lunes.
20 mar. 2019 – 21 jun.
21 sept. 2018 – 21 dic. 2018*/
SELECT *
FROM TEMPERATURAS
WHERE (FECHA BETWEEN '20/03/54' AND '21/06/54'
    OR FECHA BETWEEN '21/09/54' AND '21/12/54')
    AND TO_CHAR(FECHA,'D')=1;

/*Seleccionar las precipitaciones de los primeros días de la segunda semana de cada mes.*/    
SELECT PRECIPITACIONES.*, TO_CHAR(FECHA,'IW')
FROM PRECIPITACIONES
WHERE TO_CHAR(FECHA,'DD')=1 + 7;

SELECT PRECIPITACIONES.*, TO_CHAR(LAST_DAY(FECHA),'D')
FROM PRECIPITACIONES
WHERE (FECHA = LAST_DAY(FECHA))+ INTERVAL '8' DAY;

/*SELECT PRECIPITACIONES.*, TO_CHAR(FECHA,'IW')
FROM PRECIPITACIONES
WHERE MOD(TO_CHAR(FECHA,'IW'),4)=2
    AND TO_CHAR(FECHA,'D')=1;*/
/*Seleccionar las horas de sol de los antepenúltimos días de cada mes, si y solo si son superiores a 0,5.*/
SELECT *
FROM HORAS_SOL
WHERE FECHA = LAST_DAY(FECHA) - INTERVAL '2' DAY
    AND HORAS > 0.5;