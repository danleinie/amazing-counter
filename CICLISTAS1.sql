--1.Usando la función AVG, obtener la edad media de los ciclistas para todos aquellos que pertenezcan a un equipo donde el nombre del director del mismo contega una p o una n (mayúscula o minúscula).
SELECT AVG(EDAD)
FROM CICLISTA JOIN EQUIPO USING (NOMEQ)
WHERE UPPER(DIRECTOR) LIKE '%N%'
    OR UPPER(DIRECTOR) LIKE '%Z%';
    
--2.Obtener el nombre, el dorsal, el nombre del puerto y la altura, para todos aquellos ciclistas que han ganado en algún puerto de montaña.
SELECT DISTINCT NOMBRE, DORSAL, NOMPUERTO, ALTURA
FROM CICLISTA JOIN PUERTO USING (DORSAL);

--3.Seleccionar el nombre de aquellos equipos y sus directores, para aquellos equipos cuyos ciclistas hayan ganado alguna etapa.
SELECT DISTINCT NOMEQ, DIRECTOR
FROM EQUIPO JOIN CICLISTA USING (NOMEQ) JOIN ETAPA USING (DORSAL);

--4.Selecciona el nombre del ciclista que ganó la etapa en la que se encuentra el puerto de montaña Sierra Nevada.
SELECT *
FROM CICLISTA JOIN ETAPA USING (DORSAL) JOIN PUERTO USING (NETAPA)
WHERE UPPER(NOMPUERTO) = 'SIERRA NEVADA';

--5.Selecciona la suma total de premios para aquellos ciclistas que hayan llevado el maillot de tipo Montaña (por cada etapa que lleven el maillot, se les premia con la cuantía (en pesetas) que aparece en la tabla maillot).
SELECT COUNT(*)*2000000
FROM MAILLOT JOIN LLEVAR USING(CODIGO)
WHERE UPPER(TIPO) = 'MONTAÑA';