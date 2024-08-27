-- Paso 1 Creacion de la base de datos

--CREA UNA CARPETA EN C

CREATE DATABASE FastFoodDB  -- C:\Program Files\Microsoft SQL Server\MSSQL20.SQLEXPRESS\MSSQL\DATA
ON
( NAME = 'FastFoodDB_Data',
  FILENAME = 'C:\SQL_DB\FastFoodDB_Data.mdf', --Creamos la carpeta de forma manual antes de correr
  SIZE = 50MB,
  MAXSIZE = 1GB,
  FILEGROWTH = 5MB )
LOG ON
( NAME= 'Carrera_DB_Log',
  FILENAME = 'C:\SQL_DB\FastFoodDB_Log.ldf',
  SIZE = 25MB,
  MAXSIZE = 256MB,
  FILEGROWTH = 5MB);

  --Paso 2 Usar la base de datos
 USE FastFoodDB;

 SELECT name, database_id, create_date    --Verificar la base de datos, trae nombre, id y fecha y hora en la que se creo.
 FROM sys.databases
 WHERE name = 'FastFoodDB';

 --Paso 3 Creamos el diagrama antes crear las tablas (codear) en SQL. Se debe tener claro que tablas se van a crear y en que orden.

 --Paso 4 Creamos las tablas

 -- Tabla de categorias
 CREATE TABLE Categorias (
   CategoriaID INT PRIMARY KEY IDENTITY,
   Nombre VARCHAR (100) NOT NULL
 );

 -- Tabla de productos
 CREATE TABLE Productos (
	ProductoID INT PRIMARY KEY IDENTITY,
	Nombre VARCHAR(100) NOT NULL,
	CategoriaID INT,
	Precio DECIMAL (10,2) NOT NULL,
	FOREIGN KEY (CategoriaID) REFERENCES Categorias(CategoriaID) 
 );

 -- Tabla sucursales
 CREATE TABLE Sucursales (
	SucursalID INT PRIMARY KEY IDENTITY,
	Nombre VARCHAR(100) NOT NULL,
	Direccion VARCHAR(100)
 );

 --Tabla empleados
 CREATE TABLE Empleados (
	EmpleadoID INT PRIMARY KEY IDENTITY,
	Nombre VARCHAR(100) NOT NULL,
	Posicion VARCHAR(100) NOT NULL,
	Departamento VARCHAR(100) NOT NULL,
	SucursalID INT,
	Rol VARCHAR(50) NOT NULL,  --Vendedor, mensajero, etc.
	FOREIGN KEY(SucursalID) REFERENCES Sucursales(SucursalID)
 );

 --Tabla clientes
 CREATE TABLE Clientes (
	ClienteID INT PRIMARY KEY IDENTITY,
	Nombre VARCHAR(100) NOT NULL,
	Direccion VARCHAR(100) NOT NULL
 );

 --Tabla origenes orden
 CREATE TABLE OrigenesOrden (
	OrigenID INT PRIMARY KEY IDENTITY,
	Descripcion VARCHAR(100) NOT NULL  --En linea, presencial, telefono, Drive Thru
 );

 --Tabla tipos pago
 CREATE TABLE TiposPago (
	TipoPagoID INT PRIMARY KEY IDENTITY,
	Descripcion VARCHAR(100) NOT NULL
 );

 --Tabla mensajeros
 CREATE TABLE Mensajeros (
	MensajeroID INT PRIMARY KEY IDENTITY,
	Nombre VARCHAR(100) NOT NULL,
	EsExterno BIT NOT NULL
 );

 --Tabla ordenes
 CREATE TABLE Ordenes (
	OrdenID INT PRIMARY KEY IDENTITY,
	ClienteID INT,
	EmpleadoID INT,  --Empleado que toma la orden
	SucursalID INT,
	MensajeroID INT, --Puede ser externo o un empleado
	TipoPagoID INT,
	OrigenID INT,
	HorarioVenta VARCHAR(50) NOT NULL, --Mañana, Tarde, Noche
	TotalCompra DECIMAL(10,2) NOT NULL,
	KilometrosRecorrer DECIMAL(10,2),  --En caso de que sea domicilio
	FechaDespacho DATETIME, -- En caso de que sea domicilio, fecha y hora de entrega al mensajero (repartidor)
	FechaEntrega DATETIME,  -- En caso de que sea domicilio, fecha y hora de entrega al cliente
	FechaOrdenTomada DATETIME NOT NULL, --Fecha y hora en que se toma la orden
	FechaOrdenLista DATETIME NOT NULL,  --Fecha y hora en que la orden sale de la cocina
	FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),
	FOREIGN KEY (EmpleadoID) REFERENCES Empleados(EmpleadoID),
	FOREIGN KEY (SucursalID) REFERENCES Sucursales(SucursalID),
	FOREIGN KEY (MensajeroID) REFERENCES Mensajeros(MensajeroID),
	FOREIGN KEY (TipoPagoID) REFERENCES TiposPago(TipoPagoID),
	FOREIGN KEY (OrigenID) REFERENCES OrigenesOrden(OrigenID)
 );

 --Tabla detalles ordenes
 CREATE TABLE DetalleOrdenes (
	OrdenID INT,
	ProductoID INT,
	Cantidad INT NOT NULL,
	Precio DECIMAL(10,2) NOT NULL,
	PRIMARY KEY (OrdenID,ProductoID),
	FOREIGN KEY (OrdenID) REFERENCES Ordenes(OrdenID),
	FOREIGN KEY (ProductoID) REFERENCES PRoductos(ProductoID)
 );

 --Paso 5 Confecciona el esquema relacional en SQL Server y lo guardamos. Diagram_DA_dussan_carlos_avance1PI
 --Paso 6 Guarda las queries creadas en un archivo con extensión .sql.
 --Paso 7 Renombramos el archivo del punto anterior de acuerdo a las especificaciones establecidas. DA_dussan_carlos_avance1PI.sql