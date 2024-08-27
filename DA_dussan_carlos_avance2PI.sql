/*
CONSIGNAS
		
1. Emplea la sentencia INSERT										
2.Utiliza sentencias UPDATE y DELETE
   UPDATE															
   DELETE															
3.Ejecuta consultas b�sicas que respondan a las 
   preguntas espec�ficas que se detallan							
4. Guarda las queries creadas en un archivo con extensi�n .sql.	
5. Renombra el archivo del punto 4 de la siguiente manera:			
   DA_apellido_nombre_avance2PI.
*/

--DESARROLLO

-- Usamos la base de datos
USE FastFoodDB

--1. Empleamos la sentencia INSERT. Agregamos datos de en las tablas previamente creadas
	/*Verificamos el orden logico para no tener inconveniente con las diferentes KEY (PRIMARY and FOREIGN)
		Lo logico es seguir el mismo orden en que se crearon las tablas*/	

--Agregamos (insertamos) datos en Categorias
INSERT INTO Categorias (Nombre) VALUES
('Comida R�pida'), ('Postres'), ('Bebidas'), ('Ensaladas'), ('Desayunos'),
('Cafeter�a'), ('Helados'), ('Comida Vegana'), ('Carnes'), ('Pizzas');

--Insertamos (agragamos) datos en Productos
INSERT INTO Productos (Nombre, CategoriaID, Precio) VALUES
('Hamburguesa Deluxe', 1, 9.99), ('Cheeseburger', 1, 7.99), ('Pizza Margarita', 10, 11.99), ('Pizza Pepperoni', 10, 12.99), ('Helado de Chocolate', 7, 2.99),
('Helado de Vainilla', 7, 2.99), ('Ensalada C�sar', 4, 5.99), ('Ensalada Griega', 4, 6.99), ('Pastel de Zanahoria', 2, 3.99), ('Brownie', 2, 2.99);

--Insertamos datos en Sucursales
INSERT INTO Sucursales (Nombre, Direccion) VALUES
('Sucursal Central', '1234 Main St'), ('Sucursal Norte', '5678 North St'), ('Sucursal Este', '9101 East St'), ('Sucursal Oeste', '1121 West St'), ('Sucursal Sur', '3141 South St'),
('Sucursal Playa', '1516 Beach St'), ('Sucursal Monta�a', '1718 Mountain St'), ('Sucursal Valle', '1920 Valley St'), ('Sucursal Lago', '2122 Lake St'), ('Sucursal Bosque', '2324 Forest St');

--Verificamos datos inserdatos en las tablas (hasta el momento)
SELECT * FROM Categorias
SELECT * FROM Productos
SELECT * FROM Sucursales

--Insertamos datos en Empleados
INSERT INTO Empleados (Nombre, Posicion, Departamento, SucursalID, Rol) VALUES
('John Doe', 'Gerente', 'Administraci�n', 1, 'Vendedor'), ('Jane Smith', 'Subgerente', 'Ventas', 1, 'Vendedor'), ('Bill Jones', 'Cajero', 'Ventas', 1, 'Vendedor'), ('Alice Johnson', 'Cocinero', 'Cocina', 1, 'Vendedor'), ('Tom Brown', 'Barista', 'Cafeter�a', 1, 'Vendedor'),
('Emma Davis', 'Repartidor', 'Log�stica', 1, 'Mensajero'), ('Lucas Miller', 'Atenci�n al Cliente', 'Servicio', 1, 'Vendedor'), ('Olivia Garc�a', 'Encargado de Turno', 'Administraci�n', 1, 'Vendedor'), ('Ethan Martinez', 'Mesero', 'Restaurante', 1, 'Vendedor'), ('Sophia Rodriguez', 'Auxiliar de Limpieza', 'Mantenimiento', 1, 'Vendedor');

SELECT * FROM Empleados --Veridicamos informacion, concidiendo con el reporte de datos insertados

--Insertamos datos en Clientes
INSERT INTO Clientes (Nombre, Direccion) VALUES
('Cliente Uno', '1000 A Street'), ('Cliente Dos', '1001 B Street'), ('Cliente Tres', '1002 C Street'), ('Cliente Cuatro', '1003 D Street'), ('Cliente Cinco', '1004 E Street'),
('Cliente Seis', '1005 F Street'), ('Cliente Siete', '1006 G Street'), ('Cliente Ocho', '1007 H Street'), ('Cliente Nueve', '1008 I Street'), ('Cliente Diez', '1009 J Street');

SELECT * FROM Clientes

--Insertar datos en Origenes de Orden (OrigenesOrden)
INSERT INTO OrigenesOrden (Descripcion) VALUES   --Utilizan tildes en unos datos, espero no tener inconvenientes en el futuro
('En l�nea'), ('Presencial'), ('Tel�fono'), ('Drive Thru'), ('App M�vil'),
('Redes Sociales'), ('Correo Electr�nico'), ('Publicidad'), ('Recomendaci�n'), ('Evento');

SELECT * FROM OrigenesOrden

--Insertar datos en Tipos de Pago (TiposPago)
INSERT INTO TiposPago (Descripcion) VALUES
('Efectivo'), ('Tarjeta de Cr�dito'), ('Tarjeta de D�bito'), ('PayPal'), ('Transferencia Bancaria'),
('Criptomonedas'), ('Cheque'), ('Vale de Comida'), ('Cup�n de Descuento'), ('Pago M�vil');

SELECT * FROM TiposPago

-- Insertar datos en Mensajeros
INSERT INTO Mensajeros (Nombre, EsExterno) VALUES
('Mensajero Uno', 0), ('Mensajero Dos', 1), ('Mensajero Tres', 0), ('Mensajero Cuatro', 1), ('Mensajero Cinco', 0),
('Mensajero Seis', 1), ('Mensajero Siete', 0), ('Mensajero Ocho', 1), ('Mensajero Nueve', 0), ('Mensajero Diez', 1);

SELECT * FROM Mensajeros

-- Insertar datos en Ordenes
INSERT INTO Ordenes (ClienteID, EmpleadoID, SucursalID, MensajeroID, TipoPagoID, OrigenID, HorarioVenta, TotalCompra, KilometrosRecorrer, FechaDespacho, FechaEntrega, FechaOrdenTomada, FechaOrdenLista) VALUES
(1, 1, 1, 1, 1, 1, 'Ma�ana', 50.00, 5.5, '2023-01-10 08:30:00', '2023-01-10 09:00:00', '2023-01-10 08:00:00', '2023-01-10 08:15:00'),
(2, 2, 2, 2, 2, 2, 'Tarde', 75.00, 10.0, '2023-02-15 14:30:00', '2023-02-15 15:00:00', '2023-02-15 13:30:00', '2023-02-15 14:00:00'),
(3, 3, 3, 3, 3, 3, 'Noche', 20.00, 2.0, '2023-03-20 19:30:00', '2023-03-20 20:00:00', '2023-03-20 19:00:00', '2023-03-20 19:15:00'),
(4, 4, 4, 4, 4, 4, 'Ma�ana', 30.00, 0.5, '2023-04-25 09:30:00', '2023-04-25 10:00:00', '2023-04-25 09:00:00', '2023-04-25 09:15:00'),
(5, 5, 5, 5, 5, 5, 'Tarde', 55.00, 8.0, '2023-05-30 15:30:00', '2023-05-30 16:00:00', '2023-05-30 15:00:00', '2023-05-30 15:15:00'),
(6, 6, 6, 6, 6, 1, 'Noche', 45.00, 12.5, '2023-06-05 20:30:00', '2023-06-05 21:00:00', '2023-06-05 20:00:00', '2023-06-05 20:15:00'),
(7, 7, 7, 7, 7, 2, 'Ma�ana', 65.00, 7.5, '2023-07-10 08:30:00', '2023-07-10 09:00:00', '2023-07-10 08:00:00', '2023-07-10 08:15:00'),
(8, 8, 8, 8, 8, 3, 'Tarde', 85.00, 9.5, '2023-08-15 14:30:00', '2023-08-15 15:00:00', '2023-08-15 14:00:00', '2023-08-15 14:15:00'),
(9, 9, 9, 9, 9, 4, 'Noche', 95.00, 3.0, '2023-09-20 19:30:00', '2023-09-20 20:00:00', '2023-09-20 19:00:00', '2023-09-20 19:15:00'),
(10, 10, 10, 10, 10, 5, 'Ma�ana', 100.00, 15.0, '2023-10-25 09:30:00', '2023-10-25 10:00:00', '2023-10-25 09:00:00', '2023-10-25 09:15:00');

SELECT * FROM Ordenes

-- Insertar datos en Detalle de Ordenes (DetalleOrdenes)
INSERT INTO DetalleOrdenes (OrdenID, ProductoID, Cantidad, Precio) VALUES
(1, 1, 3, 23.44),
(1, 2, 5, 45.14),
(1, 3, 4, 46.37),
(1, 4, 4, 42.34),
(1, 5, 1, 18.25),
(1, 6, 4, 20.08),
(1, 7, 2, 13.31),
(1, 8, 2, 20.96),
(1, 9, 4, 30.13),
(1, 10, 3, 38.34);

SELECT * FROM DetalleOrdenes

--2. Utiliza sentencias UPDATE y DELETE

 --ACTUALIZACIONES DE EJEMPLO (UPDATE)

	--1. Aumentar el precio de todos los productos en la categor�a 1
	UPDATE Productos SET Precio = Precio + 1 
	WHERE CategoriaID = 1;
		

	--2. Cambiar la posici�n de todos los empleados del departamento 'Cocina' a 'Chef'
	UPDATE Empleados SET Posicion = 'Chef' 
	WHERE Departamento = 'Cocina';
	

	-- 3 Actualizar la direcci�n de una sucursal espec�fica
	UPDATE Sucursales SET Direccion = '1234 New Address St' 
	WHERE SucursalID = 1;

	--ELIMINACIONES DE EJEMPLO (DELETE)

		/*1. Eliminar una orden espec�fica
		Imaginemos que quieres eliminar una orden espec�fica, 
		por ejemplo, la orden con OrdenID = 10. 
		Esta operaci�n eliminar�a la orden junto con sus detalles asociados 
		(deber�as asegurarte de eliminar o actualizar cualquier dato relacionado 
		para mantener la integridad referencial).*/  
		--Analizamos
		SELECT * FROM DetalleOrdenes --No existe Detalles de la Orden con ID 10
		SELECT * FROM Ordenes        -- Pero si existe una OrdenID 10
		
		DELETE FROM DetalleOrdenes --Eliminamos primero el dato en DetelleOrdenes
		WHERE OrdenID = 10; 

		DELETE FROM Ordenes --Eliminamos la Orden con ID 10
		WHERE OrdenID = 10; 

		/*2. Eliminar todos los productos de una categor�a espec�fica
		Si decides dejar de ofrecer todos los "Postres" 
		(supongamos que Categorias.CategoriaID = 2 para "Postres"), 
		podr�as querer eliminar todos los productos asociados a esa categor�a.*/

		--Desactivar la restriccion de la clave externa
		ALTER TABLE DetalleOrdenes
		NOCHECK CONSTRAINT FK__DetalleOr__Produ__6FE99F9F;

		DELETE FROM Productos WHERE CategoriaID = 2; --se ejecuta 

		--Volver a activar la restriccion de la clave externa
		ALTER TABLE DetalleOrdenes
		CHECK CONSTRAINT FK__DetalleOr__Produ__6FE99F9F;

		/*Antes de ejecutar este comando, deber�as considerar 
		si hay �rdenes que incluyen estos productos y decidir c�mo manejar esas referencias.*/
		/*Rta: consider� la opci�n de mantener las �rdenes como est�n
		y eliminar solo los productos de la categor�a "Postres" de la tabla de productos. Para ello se realizo el proceso anteriormente descrito*/

		--3. Eliminar empleados de una sucursal que cerr�
		/*Si una sucursal cierra, por ejemplo, SucursalID = 10 (Sucursal Bosque), 
		podr�as necesitar eliminar a todos los empleados asociados con esa sucursal.*/

		DELETE FROM Empleados WHERE SucursalID = 10; 


 --3.Ejecutamos las consultas. Preguntas para consutas.

	--Cuantos productos diferentes hay en la orden 1
		SELECT 
			OrdenID, 
			COUNT(DISTINCT ProductoID) AS Conteo
		FROM 
			DetalleOrdenes
		WHERE 
			OrdenID = 1
		GROUP BY 
			OrdenID;

	--Rta: Hay 10 poductos diferentes en la orden 1.

	--1 Registros �nicos: Pregunta: �Cu�l es la cantidad total de registros �nicos en la tabla de �rdenes?
		SELECT 
			COUNT(OrdenID) AS CantidadRegistroUnicoOrdenes --No utilizamos el DISTINCT teniendo en cuenta que tomamos OrdenID para obtner el dato
		FROM Ordenes

	--Rta: 9 es la cantidad total de registros �nicos en la tabla de �rdenes.

	--2 Empleados por departamento: Pregunta: �Cu�ntos empleados existen en cada departamento?
		SELECT 
			Departamento, 
			COUNT(EmpleadoID) AS 'Numero de Empleados'
		FROM 
			Empleados
		GROUP BY 
			Departamento
		ORDER BY 
			Departamento ASC  -- Lo organizamos alfabeticamente por nombre del departamento

	--Rta: Administracion y Ventas tiene 2 cada uno, mientras que Cafeteria, Cocina, Logistica, Mantenimiento, Restaurante y Servicio, 1 cada departamento.

	--3 Productos por categor�a: Pregunta: �Cu�ntos productos hay por c�digo de categor�a?
		SELECT 
			CategoriaID, 
			COUNT(ProductoID) AS 'Cantidad de Productos' 
		FROM 
			Productos
		GROUP BY 
			CategoriaID
		ORDER BY 
			'Cantidad de Productos' ASC  
	
	--Rta: Tenemos 2 productos en cada una de las categorias 1, 4, 7 y 10.

	--4 Importaci�n de clientes: Pregunta: �Cu�ntos clientes se han importado a la tabla de clientes?
	SELECT 
		COUNT(ClienteID) AS 'Clientes Importados' --Como construimos la tabla sabemos que cada cliente es unico y por ese motivo no utilizamos DISTINCT
	FROM 
		Clientes

	--Rta: Se han importado 10 clientes a la tabla clientes.

	/*5 An�lisis de desempe�o de sucursales: Pregunta: �Cu�les son las sucursales con un promedio de ventas 
			por orden superior a un valor espec�fico (40), ordenadas por el promedio de kil�metros recorridos para las 
			entregas de mayor a menor?*/ 
		
		SELECT SucursalID, 
			CAST(AVG(TotalCompra)AS DECIMAL (10,2)) AS 'Promedio Venta',
			CAST(AVG(KilometrosRecorrer)AS DECIMAL (10,2)) AS 'Promedio Kilometros'
		FROM 
			Ordenes
		GROUP BY 
			SucursalID
		HAVING 
			AVG(TotalCompra) > 40
		ORDER BY 
			'Promedio Kilometros' DESC

	--Rta: Las sucursales con promedio de ventas por orden superior a 40 y ordenadas por kilometros recorridos de forma descendente son la 6, 2, 8, 5, 7, 1 y 9

	
	/* 
 Guardamos el archivo, renombrandolo de acuerdo a lo que establecen los puntos 4 y 5
	El archivo quedo como DA_dussan_carlos_avance2PI
*/