-- Database: retail_project

-- DROP DATABASE IF EXISTS retail_project;

CREATE DATABASE retail_project
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Spanish_Argentina.1252'
    LC_CTYPE = 'Spanish_Argentina.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;


	
-- DDL: Creacion de tablas

DROP TABLE IF EXISTS clientes;
CREATE TABLE clientes (
    cliente_id     SERIAL PRIMARY KEY,
    nombre         VARCHAR(50) NOT NULL,
    apellido       VARCHAR(50) NOT NULL,
    email          VARCHAR(50) NOT NULL UNIQUE,
    telefono       VARCHAR(50) UNIQUE,
    edad           INT NOT NULL CHECK (edad >= 18)
     	
);

DROP TABLE IF EXISTS productos;
CREATE TABLE productos (
    producto_id		SERIAL PRIMARY KEY,
	nombre		VARCHAR(50) NOT NULL,
	marca		VARCHAR(50) ,
    	precio         DECIMAL(10,2) NOT NULL CHECK (precio > 0),
    	stock          INT NOT NULL DEFAULT 0 CHECK (stock >= 0)
);

DROP TABLE IF EXISTS ventas;
CREATE TABLE ventas (
   	 venta_id		SERIAL PRIMARY KEY,
    fecha_venta 		DATE NOT NULL,
    cliente_id		INT NOT NULL,
	producto_id		INT NOT NULL,
	cantidad       INT NOT NULL CHECK (cantidad > 0),
	CONSTRAINT fk_venta_cliente
        	FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
	CONSTRAINT fk_venta_producto
        	FOREIGN KEY (producto_id) REFERENCES productos(producto_id)
);

--DML – Datos y mantenimiento

-- Carga de registros:

BEGIN;

-- Clientes

INSERT INTO clientes (nombre, apellido, email, telefono, edad) VALUES
('Ana',     'Gomez',   'ana.gomez@mail.com',     '11-4567-1001', 28),
('Bruno',   'Diaz',    'bruno.diaz@mail.com',    '11-4567-1002', 34),
('Carla',   'Perez',   'carla.perez@mail.com',   '11-4567-1003', 22),
('Diego',   'Torres',  'diego.torres@mail.com',  '11-4567-1004', 45),
('Elena',   'Ruiz',    'elena.ruiz@mail.com',    '11-4567-1005', 31),
('Fabian',  'Lopez',   'fabian.lopez@mail.com',  '11-4567-1006', 27),
('Gabriela','Sosa',    'gabriela.sosa@mail.com', '11-4567-1007', 39),
('Hernan',  'Molina',  'hernan.molina@mail.com', '11-4567-1008', 24),
('Ines',    'Vega',    'ines.vega@mail.com',     '11-4567-1009', 52),
('Javier',  'Castro',  'javier.castro@mail.com', '11-4567-1010', 29);

-- Productos

INSERT INTO productos (nombre, marca, precio, stock) VALUES
('Notebook 14"',            'Lenovo',   450000.00, 15),
('Mouse inalámbrico',       'Logitech', 8500.00,   80),
('Teclado mecánico',        'Redragon', 25000.00,  40),
('Monitor 24"',             'Samsung',  180000.00, 20),
('Auriculares bluetooth',   'JBL',      35000.00,  25),
('Impresora multifunción',  'HP',       95000.00,  10),
('Disco SSD 1TB',           'Kingston', 55000.00,  30),
('Memoria RAM 16GB',        'Corsair',  32000.00,  50),
('Webcam HD',                'Logitech', 18000.00,  35),
('Router WiFi 6',           'TP-Link',  42000.00,  22);

-- Ventas

INSERT INTO ventas (fecha_venta, cliente_id, producto_id, cantidad) VALUES
('2026-07-01', 1, 3, 1),
('2026-07-03', 2, 1, 1),
('2026-07-05', 3, 5, 2),
('2026-07-08', 4, 2, 3),
('2026-07-10', 5, 7, 1),
('2026-07-12', 6, 4, 1),
('2026-07-15', 7, 9, 2),
('2026-07-18', 8, 6, 1),
('2026-07-22', 9, 10, 1),
('2026-07-28', 10, 8, 4);


COMMIT;



--update de precios:


UPDATE productos
SET precio = precio + 1000
WHERE marca = 'Logitech';

UPDATE productos
SET stock = stock + 10
WHERE nombre = 'Monitor 24"';


DELETE FROM ventas
WHERE venta_id = 8;

