/*
1 Aplica funciones de agregaci�n para resolver las preguntas que se plantean.

2 Utiliza GROUP BY y otras cl�usulas para estructurar adecuadamente tus consultas.

3 Guarda las queries creadas en un archivo con extensi�n .sql. 

4 Renombra el archivo del punto 3 de la siguiente manera: DA_apellido_nombre_avance3PI.
*/

--Preguntas para consultas
USE FastFoodDB

--1 Total de ventas globales
  -- Pregunta: �Cu�l es el total de ventas (TotalCompra) a nivel global?
  SELECT 
	SUM(TotalCompra) AS 'Ventas totales a nivel global'
  FROM 
	Ordenes

  --Rta: El total de Ventas a nivel global es de 520.

--2 Promedio de precios de productos por categor�a
  -- Pregunta: �Cu�l es el precio promedio de los productos dentro de cada categor�a?
  SELECT 
	CategoriaID, 
	CAST(AVG(Precio) AS DECIMAL(10,2)) AS 'Precio promedio'
  FROM 
	Productos
  GROUP BY 
	CategoriaID
  ORDER BY 
	'Precio promedio' DESC

--3 Orden m�nima y m�xima por sucursal
  -- Pregunta: �Cu�l es el valor de la orden m�nima y m�xima por cada sucursal?
  SELECT 
	SucursalID, 
	MIN(TotalCompra) AS 'Orden Minima', MAX(TotalCompra) AS 'Orden Maxima'
  FROM 
	Ordenes
  GROUP BY 
	SucursalID
     
--4 Mayor n�mero de kil�metros recorridos para entrega
  --Pregunta: �Cu�l es el mayor n�mero de kil�metros recorridos para una entrega?
  SELECT 
	MAX(KilometrosRecorrer) AS 'Mayor kilometros' 
  FROM 
	Ordenes

--5 Promedio de cantidad de productos por orden
  --Pregunta: �Cu�l es la cantidad promedio de productos por orden?
    
  SELECT 
	OrdenID, 
	AVG(Cantidad) AS 'Cantidad Promedio Productos'
  FROM 
	DetalleOrdenes
  GROUP BY 
	OrdenID
     
--6 Total de ventas por tipo de pago
  --Pregunta: �Cu�l es el total de ventas por cada tipo de pago?
  SELECT 
	TipoPagoID, 
		SUM(TotalCompra) 'Total Ventas'
  FROM 
	Ordenes
  GROUP BY 
	TipoPagoID
  ORDER BY 
	'Total Ventas' DESC;

--7 Sucursal con la venta promedio m�s alta
  --Pregunta: �Cu�l sucursal tiene la venta promedio m�s alta?
  SELECT 
	TOP 1 
	SucursalID, 
	CAST( AVG(TotalCompra) AS DECIMAL(10,2)) AS 'Promedio Ventas'
  FROM 
	Ordenes
  GROUP BY 
	SucursalID
  ORDER BY 
	'Promedio Ventas' DESC;

--8 Sucursal con la mayor cantidad de ventas por encima de un umbral
  --Pregunta: �Cu�les son las sucursales que han generado ventas por orden por encima de $50.
  SELECT 
	SucursalID, 
	SUM(TotalCompra) AS 'Total Ventas'	
  FROM 
	Ordenes
  GROUP BY 
	SucursalID
  HAVING 
	SUM(TotalCompra) > 50
  ORDER BY 
	'Total Ventas' DESC;

--9 Comparaci�n de ventas promedio antes y despu�s de una fecha espec�fica
  -- Pregunta: �C�mo se comparan las ventas promedio antes y despu�s del 1 de julio de 2023?
   
    SELECT 
		'Antes del 2023-07-01' AS Periodo, 
		CAST(AVG(TotalCompra)AS DECIMAL(10,2)) AS 'Promedio Ventas'
    FROM 
		Ordenes
    WHERE	
		FechaOrdenTomada < '2023-07-01'
 UNION 
    SELECT 
		'Despues del 2023-07-01' AS Periodo, 
		CAST(AVG(TotalCompra) AS DECIMAL(10,2)) AS 'Promedio Ventas'
    FROM 
		Ordenes
    WHERE 
		FechaOrdenTomada > '2023-07-01' 


--10 An�lisis de actividad de ventas por horario
  --Pregunta: �Durante qu� horario del d�a (ma�ana, tarde, noche) se registra la mayor cantidad de ventas, cu�l es el valor promedio de estas ventas, y cu�l ha sido la venta m�xima alcanzada?

  SELECT 
    HorarioVenta AS 'Horario Mayor Ventas',
	COUNT(*) AS 'Cantidad Ventas',
	CAST(AVG(TotalCompra) AS DECIMAL(10,2)) AS 'Promedio Ventas',
	MAX(TotalCompra) AS 'Venta Maxima'
  FROM 
	Ordenes
  GROUP BY 
	HorarioVenta
  ORDER BY 
	'Cantidad Ventas' DESC;


  