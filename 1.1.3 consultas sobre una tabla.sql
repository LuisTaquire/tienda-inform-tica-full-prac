-- 1.1.3 Consultas sobre una tabla
-- 1 Lista el nombre de todos los productos que hay en la tabla producto}
SELECT NOMBRE FROM PRODUCTO;

-- 2 Lista los nombres y los precios de todos los productos de la tabla producto
SELECT NOMBRE,PRECIO FROM PRODUCTO;

-- 3 Lista todas las columnas de la tabla producto
SELECT * FROM PRODUCTO;

-- 4 Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
SELECT NOMBRE, PRECIO, ROUND(PRECIO * 1.11,2) FROM PRODUCTO;

-- 5 Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.
SELECT NOMBRE, PRECIO AS EUROS, ROUND(PRECIO * 1.11,2) AS DÓLARES FROM PRODUCTO;

-- 6 Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
SELECT UPPER(NOMBRE), PRECIO FROM PRODUCTO;

-- 7 Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.
SELECT LOWER(NOMBRE), PRECIO FROM PRODUCTO;

-- 8 Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
SELECT NOMBRE, UPPER(LEFT(NOMBRE,2)) FROM FABRICANTE;

-- 9 Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
SELECT NOMBRE, ROUND(PRECIO, 0) FROM PRODUCTO;

-- 10 Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
SELECT NOMBRE, ROUND(PRECIO) FROM PRODUCTO;

-- 11 Lista el código de los fabricantes que tienen productos en la tabla producto.
SELECT CODIGO_FABRICANTE FROM PRODUCTO;

-- 12 Lista el código de los fabricantes que tienen productos en la tabla producto, eliminando los códigos que aparecen repetidos.
SELECT DISTINCT(CODIGO_FABRICANTE) FROM PRODUCTO;

-- 13 Lista los nombres de los fabricantes ordenados de forma ascendente.
SELECT * FROM FABRICANTE ORDER BY NOMBRE ASC;

-- 14 Lista los nombres de los fabricantes ordenados de forma descendente.
SELECT * FROM FABRICANTE ORDER BY NOMBRE DESC;

-- 15 Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente
SELECT NOMBRE, PRECIO FROM PRODUCTO ORDER BY NOMBRE ASC, PRECIO DESC;

-- 16 Devuelve una lista con las 5 primeras filas de la tabla fabricante.
SELECT * FROM FABRICANTE limit 5;

-- 17 Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta.
SELECT * FROM FABRICANTE where codigo >= 4 LIMIT 2;

-- 18 Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT NOMBRE, PRECIO FROM PRODUCTO ORDER BY PRECIO ASC  LIMIT 1;

-- 19 Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT NOMBRE, PRECIO FROM PRODUCTO ORDER BY PRECIO DESC  LIMIT 1;

-- 20 Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.
SELECT NOMBRE FROM PRODUCTO WHERE  CODIGO_FABRICANTE = 2;

-- 21 Lista el nombre de los productos que tienen un precio menor o igual a 120€.
SELECT NOMBRE FROM PRODUCTO WHERE PRECIO <= 120;

-- 22 Lista el nombre de los productos que tienen un precio mayor o igual a 400€.
SELECT NOMBRE FROM PRODUCTO WHERE PRECIO >= 400;

-- 23 Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.
SELECT NOMBRE FROM PRODUCTO WHERE PRECIO <= 400;

-- 24 Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN
SELECT NOMBRE FROM PRODUCTO WHERE PRECIO >=80 AND PRECIO <=300;

-- 25 Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN
SELECT NOMBRE FROM PRODUCTO WHERE PRECIO BETWEEN 60 AND 200;

-- 26 Lista todos los productos que tengan un precio mayor que 200€ y que el código de fabricante sea igual a 6.
SELECT NOMBRE FROM PRODUCTO WHERE PRECIO > 200 AND CODIGO_FABRICANTE = 6;

-- 27 Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Sin utilizar el operador IN
SELECT NOMBRE FROM PRODUCTO WHERE CODIGO_FABRICANTE LIKE '1' OR CODIGO_FABRICANTE LIKE '3' OR CODIGO_FABRICANTE LIKE '5';

-- 28 Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Utilizando el operador IN.
SELECT NOMBRE FROM PRODUCTO WHERE CODIGO_FABRICANTE IN (1,3,5);

-- 29 Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). Cree un alias para la columna que contiene el precio que se llame céntimos.
SELECT NOMBRE, (PRECIO * 100) AS PRECIO, ROUND(PRECIO * 3.74,2) AS CÉNTIMOS FROM PRODUCTO;

-- 30 Lista los nombres de los fabricantes cuyo nombre empiece por la letra S
SELECT NOMBRE FROM FABRICANTE WHERE NOMBRE LIKE 'S%';

-- 31 Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.
SELECT NOMBRE FROM FABRICANTE WHERE NOMBRE LIKE '%e';

-- 32 Lista los nombres de los fabricantes cuyo nombre contenga el carácter w
SELECT NOMBRE FROM FABRICANTE WHERE NOMBRE LIKE '%w%';

-- 33 Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
SELECT NOMBRE FROM FABRICANTE WHERE NOMBRE LIKE '____';

-- 34 Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.
SELECT NOMBRE FROM PRODUCTO WHERE NOMBRE LIKE '%Portátil%';

-- 35 Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.
SELECT NOMBRE FROM PRODUCTO WHERE NOMBRE LIKE '%Monitor%' AND PRECIO < 215;

-- 36 Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).
SELECT NOMBRE, PRECIO FROM PRODUCTO WHERE PRECIO >=180 ORDER BY PRECIO DESC, NOMBRE ASC;