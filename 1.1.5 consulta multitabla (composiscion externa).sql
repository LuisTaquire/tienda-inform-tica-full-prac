-- 1.1.5 Consultas multitabla (Composición externa)
-- 1 Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. 
-- El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.
SELECT 
FABRICANTE.NOMBRE AS FABRICANTE, 
PRODUCTO.NOMBRE AS PRODUCTO 
FROM FABRICANTE 
LEFT JOIN 
PRODUCTO ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE;


-- 2 Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
SELECT 
FABRICANTE.NOMBRE AS FABRICANTE, 
PRODUCTO.NOMBRE AS PRODUCTO 
FROM FABRICANTE 
LEFT JOIN 
PRODUCTO ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE
WHERE PRODUCTO.NOMBRE IS NULL;

-- 3 ¿Pueden existir productos que no estén relacionados con un fabricante? Justifique su respuesta.
-- No, porque para poder agregar un producto se necesita un fabricante de por medio debido a las relaciones, ya que Producto obtiende datos de Fabricante
-- para que este pueda tener registros. Ademas el campo donde se relacionan las dos tablas no puede quedar en NULL, que seria en este caso el Codigo_Fabricante
-- de Producto.

