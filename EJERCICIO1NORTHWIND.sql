--Seleccionar el COMPANYNAME y CONTACTNAME de aquellos CUSTOMERS que hayan hecho pedidos (ORDERS) en un martes de febrero o un mi�rcoles de marzo (ORDERDATE).
SELECT DISTINCT COMPANYNAME,CONTACTNAME
FROM CUSTOMERS JOIN ORDERS USING(CUSTOMERID)
WHERE TO_CHAR(ORDERDATE, 'DY/MON') IN ('MAR/FEB','MI�/MAR');

-- Seleccionar el numero de pedidos que hemos enviado en los a�os pares de la d�cada de los 90 con las empresas Federal Shipping o United Package.
SELECT *
FROM ORDERS JOIN SHIPPERS ON (SHIPVIA = SHIPPERID)
WHERE EXTRACT(YEAR FROM SHIPPEDATE) IN (1990,1992,1994,1996,1998)
AND UPPER(SHIPPERS.COMPANYNAME) IN ('FEDERAL SHIPPING','UNITED PACKAGE');

--Seleccionar el nombre de aquellos productos que han sido solicitados en alg�n pedido.
SELECT DISTINCT PRODUCTNAME
FROM PRODUCTS JOIN ORDERDETAILS USING(PRODUCTID);

--Seleccionar la suma de los importes "cobrados" en todos los pedidos realizados en el segundo semestre del a�o 96.
SELECT SUM (UNITPRICE*QUANTITY*(1-DISCOUNT))
FROM ORDERS JOIN ORDERDETAILS USING(ORDERID)
WHERE TO_CHAR(ORDERDATE,'Q') IN ('3','4')
    AND TO_CHAR(ORDERDATE,'YYYY') = '1996';
    
--5
SELECT *
FROM CUSTOMERS JOIN ORDERS USING(CUSTOMERID) JOIN EMPLOYEES USING (EMPLOYEEID)
WHERE ORDERDATE + 20> REQUIREDDATE;

--Seleccionar los nombres de los productos que hayan sido solicitados en pedidos que hayan sido enviados por la empresa United Package.
SELECT DISTINCT PRODUCTNAME
FROM SHIPPERS S JOIN ORDERS O ON (S.SHIPPERID=O.SHIPVIA) JOIN ORDERDETAILS USING(ORDERID) JOIN PRODUCTS USING(PRODUCTID)
WHERE UPPER(COMPANYNAME) = 'UNITED PACKAGE';

--Seleccionar el nombre del producto y el de su categoria que se hayan incluido en algún pedido, para todos aquellos pedidos solicitados en un jueves.

SELECT DISTINCT PRODUCTNAME,CATEGORYNAME
FROM CATEGORIES JOIN PRODUCTS USING(CATEGORYID) JOIN ORDERDETAILS USING(PRODUCTID) JOIN ORDERS USING(ORDERID)
WHERE TO_CHAR(ORDERDATE, 'D')='4';

--Seleccionar el nombre de todas las empresas que sean clientes, hayan realizado pedidos o no.

SELECT COMPANYNAME
FROM CUSTOMERS;

--Seleccionar el nombre de los empleados que han atendido pedidos realizados por clientes de Brasil.

SELECT DISTINCT FIRSTNAME, LASTNAME
FROM EMPLOYEES JOIN ORDERS USING(EMPLOYEEID) JOIN CUSTOMERS USING(CUSTOMERID)
WHERE UPPER(CUSTOMERS.COUNTRY) = 'BRAZIL';
