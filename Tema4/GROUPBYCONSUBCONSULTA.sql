--1.Seleccionar el numero de empleados de la empresa agrupados por region, si y solo si el numero de empleados está entre 10 y 15.

SELECT REGION, COUNT(*)
FROM EMPLOYEES
GROUP BY REGION
HAVING COUNT(*) BETWEEN 10 AND 15;

--2.Seleccionar el nombre de las empresas que no han realizado ningun pedido.

SELECT COMPANYNAME 
FROM CUSTOMERS
WHERE COMPANYNAME NOT IN (SELECT COMPANYNAME
FROM CUSTOMERS JOIN ORDERS USING(CUSTOMERID));

--3.Sea el numero diferente de productos que se han pedido, agrupados por categoría. Mostrar el mayor (solo el número)

SELECT MAX(COUNT(*))
FROM ORDERDETAILS JOIN PRODUCTS USING(PRODUCTID) JOIN CATEGORIES USING(CATEGORYID)
GROUP BY CATEGORYNAME;

--4.Modificar la consulta anterior para que solo haga referencia a los pedidos realizados por clientes de Estados Unidos y atendidos por empleados de Oeste (Western).

SELECT MAX(COUNT(*))
FROM ORDERDETAILS JOIN PRODUCTS USING(PRODUCTID) JOIN CATEGORIES USING(CATEGORYID) JOIN ORDERS USING (ORDERID) JOIN CUSTOMERS USING(CUSTOMERID) JOIN EMPLOYEES USING(EMPLOYEEID)
WHERE CUSTOMERS.COUNTRY = 'USA' AND EMPLOYEES.REGION = 'WA'
GROUP BY CATEGORYNAME;

--5.Si suponemos que nuestro margen de beneficio con los productos es de un 25% (es decir, el 25% de su precio, son beneficios, y el 75% son costes),
--calcular la cantidad de beneficio que hemos obtenido, agrupado por categoria y producto. Las cantidades deben redondearse a dos decimales.

SELECT CATEGORYNAME,PRODUCTNAME,(SUM(ORDERDETAILS.UNITPRICE)*SUM(ORDERDETAILS.QUANTITY))*0.25 AS GANANCIAS
FROM ORDERDETAILS JOIN PRODUCTS USING(PRODUCTID) JOIN CATEGORIES USING(CATEGORYID)
GROUP BY CATEGORYNAME, PRODUCTNAME
ORDER BY CATEGORYNAME;

