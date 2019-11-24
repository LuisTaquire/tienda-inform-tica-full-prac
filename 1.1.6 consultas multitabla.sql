-- 1.1.6 Consultas resumen
-- 1 Calcula el número total de productos que hay en la tabla productos.
SELECT COUNT(NOMBRE) FROM PRODUCTO;

-- 2 Calcula el número total de fabricantes que hay en la tabla fabricante.
SELECT COUNT(NOMBRE) FROM FABRICANTE;

-- 3 Calcula el número de valores distintos de código de fabricante aparecen en la tabla productos
SELECT COUNT(DISTINCT(CODIGO_FABRICANTE)) AS TOTAL FROM PRODUCTO;

-- 4 Calcula la media del precio de todos los productos.
SELECT PRECIO,ROUND(PRECIO /2,2) AS PROMEDIO FROM PRODUCTO;

-- 5 Calcula el precio más barato de todos los productos.
SELECT PRECIO FROM PRODUCTO  ORDER BY PRECIO ASC LIMIT 1;

-- 6 Calcula el precio más caro de todos los productos.
SELECT PRECIO FROM PRODUCTO  ORDER BY PRECIO DESC LIMIT 1;

-- 7 Lista el nombre y el precio del producto más barato.
SELECT NOMBRE,PRECIO FROM PRODUCTO  ORDER BY PRECIO ASC LIMIT 1;

-- 8 Lista el nombre y el precio del producto más caro.
SELECT NOMBRE,PRECIO FROM PRODUCTO  ORDER BY PRECIO DESC LIMIT 1;

-- 9 Calcula la suma de los precios de todos los productos.
SELECT SUM(PRECIO) AS SUMA FROM PRODUCTO;

-- 10 Calcula el número de productos que tiene el fabricante Asus.
SELECT 
COUNT(PRODUCTO.PRECIO) AS SUMA
FROM PRODUCTO
INNER JOIN FABRICANTE
ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE FABRICANTE.NOMBRE = "Asus";

-- 11 Calcula la media del precio de todos los productos del fabricante Asus.
SELECT 
PRODUCTO.PRECIO,
(PRODUCTO.PRECIO / 2) AS MEDIA
FROM PRODUCTO
INNER JOIN FABRICANTE
ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE FABRICANTE.NOMBRE = "Asus";

-- 12 Calcula el precio más barato de todos los productos del fabricante Asus.
SELECT 
PRODUCTO.PRECIO
FROM PRODUCTO
INNER JOIN FABRICANTE
ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE FABRICANTE.NOMBRE = "Asus" ORDER BY PRODUCTO.PRECIO ASC LIMIT 1;

-- 13 Calcula el precio más caro de todos los productos del fabricante Asus.
SELECT 
PRODUCTO.PRECIO
FROM PRODUCTO
INNER JOIN FABRICANTE
ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE FABRICANTE.NOMBRE = "Asus" ORDER BY PRODUCTO.PRECIO DESC LIMIT 1;

-- 14 Calcula la suma de todos los productos del fabricante Asus.
SELECT 
SUM(PRODUCTO.PRECIO) AS SUMA
FROM PRODUCTO
INNER JOIN FABRICANTE
ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE FABRICANTE.NOMBRE = "Asus" ;

-- 15 Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante Crucial.
SELECT 
MAX(PRODUCTO.PRECIO) AS MAXIMO,
MIN(PRODUCTO.PRECIO) AS MINIMO ,
SUM(PRODUCTO.PRECIO /2) AS MEDIO,
COUNT(PRODUCTO.NOMBRE) AS TOTAL
FROM PRODUCTO
INNER JOIN FABRICANTE
ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE FABRICANTE.NOMBRE = "Crucial";

-- 16 Muestra el número total de productos que tiene cada uno de los fabricantes. El listado también debe incluir los fabricantes que no tienen ningún producto. 
-- El resultado mostrará dos columnas, una con el nombre del fabricante y otra con el número de productos que tiene. Ordene el resultado descendentemente por el número de productos.
SELECT 
FABRICANTE.NOMBRE,
COUNT(PRODUCTO.NOMBRE) AS TOTAL
FROM FABRICANTE
LEFT JOIN PRODUCTO
ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE
GROUP BY FABRICANTE.CODIGO DESC;

-- 17 Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes. El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.
SELECT 
FABRICANTE.NOMBRE AS FABRICANTE,
MAX(PRODUCTO.PRECIO) AS MAXIMO,
MIN(PRODUCTO.PRECIO) AS MINIMO ,
SUM(PRODUCTO.PRECIO /2) AS MEDIO,
COUNT(PRODUCTO.NOMBRE) AS TOTAL
FROM PRODUCTO
INNER JOIN FABRICANTE
ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
GROUP BY FABRICANTE.CODIGO;

-- 18 Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. No es necesario mostrar el nombre del fabricante, con el código del fabricante es suficiente.
SELECT 
FABRICANTE.CODIGO AS FABRICANTE,
MAX(PRODUCTO.PRECIO) AS MAXIMO,
MIN(PRODUCTO.PRECIO) AS MINIMO ,
SUM(PRODUCTO.PRECIO /2) AS MEDIO,
COUNT(PRODUCTO.NOMBRE) AS TOTAL
FROM PRODUCTO
INNER JOIN FABRICANTE
ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE PRODUCTO.PRECIO >= 200
GROUP BY FABRICANTE.CODIGO;

-- 19 Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. Es necesario mostrar el nombre del fabricante.
SELECT 
FABRICANTE.NOMBRE AS FABRICANTE,
MAX(PRODUCTO.PRECIO) AS MAXIMO,
MIN(PRODUCTO.PRECIO) AS MINIMO ,
SUM(PRODUCTO.PRECIO /2) AS MEDIO,
COUNT(PRODUCTO.NOMBRE) AS TOTAL
FROM PRODUCTO
INNER JOIN FABRICANTE
ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE PRODUCTO.PRECIO >= 200
GROUP BY FABRICANTE.CODIGO;

-- 20 Calcula el número de productos que tienen un precio mayor o igual a 180€.
SELECT 
COUNT(PRODUCTO.NOMBRE)
FROM PRODUCTO
INNER JOIN FABRICANTE
ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE PRODUCTO.PRECIO >= 180;

-- 21 Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€.
SELECT 
FABRICANTE.NOMBRE,
COUNT(PRODUCTO.NOMBRE)
FROM PRODUCTO
INNER JOIN FABRICANTE
ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE PRODUCTO.PRECIO >= 180
GROUP BY FABRICANTE.CODIGO;

-- 22 Lista el precio medio los productos de cada fabricante, mostrando solamente el código del fabricante.
SELECT
FABRICANTE.CODIGO,
(PRODUCTO.PRECIO /2) AS MEDIA
FROM PRODUCTO
INNER JOIN FABRICANTE
ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO;

-- 23 Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del fabricante.
SELECT
FABRICANTE.NOMBRE,
(PRODUCTO.PRECIO /2) AS MEDIA
FROM PRODUCTO
INNER JOIN FABRICANTE
ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO;

-- 24 Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€.
SELECT
FABRICANTE.NOMBRE
FROM PRODUCTO
INNER JOIN FABRICANTE
ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE PRODUCTO.PRECIO >= 150;

-- 25 Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.
SELECT
FABRICANTE.NOMBRE,
COUNT(PRODUCTO.NOMBRE) AS TOTAL
FROM PRODUCTO
INNER JOIN FABRICANTE
ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE FABRICANTE.CODIGO IN (1,2,3,6)
GROUP BY FABRICANTE.CODIGO;

-- 26 Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. 
-- No es necesario mostrar el nombre de los fabricantes que no tienen productos que cumplan la condición.
SELECT 
FABRICANTE.NOMBRE AS FABRICANTE,
COUNT(PRODUCTO.NOMBRE) AS TOTAL
FROM PRODUCTO
INNER JOIN FABRICANTE
ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE PRODUCTO.PRECIO >= 220
GROUP BY FABRICANTE.CODIGO;

-- 27 Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. 
-- El listado debe mostrar el nombre de todos los fabricantes, es decir, si hay algún fabricante que no tiene productos con un precio superior o igual a 220€ deberá aparecer en el listado con un valor igual a 0 en el número de productos.

SELECT 
FABRICANTE.NOMBRE AS FABRICANTE,
(COUNT(PRODUCTO.NOMBRE)) AS TOTAL
FROM FABRICANTE
LEFT JOIN PRODUCTO
ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE
WHERE PRODUCTO.PRECIO >= 220 OR PRODUCTO.NOMBRE IS NULL
GROUP BY FABRICANTE.CODIGO;