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
    cliente_id	SERIAL 		PRIMARY KEY,
    email		VARCHAR(50)   UNIQUE,
	telefono   	VARCHAR(50)   UNIQUE
);

DROP TABLE IF EXISTS productos;
CREATE TABLE productos (
    producto_id	SERIAL PRIMARY KEY,
	nombre		VARCHAR(50) NOT NULL,
	marca		VARCHAR(50) ,
    precio		DECIMAL(8,2) CHECK  (precio>0)
);

DROP TABLE IF EXISTS ventas;
CREATE TABLE ventas (
    venta_id		SERIAL PRIMARY KEY,
    fecha_venta 	DATE NOT NULL,
    cliente_id		INT NOT NULL,
	producto_id		INT NOT NULL,
	CONSTRAINT fk_venta_cliente
        FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
	CONSTRAINT fk_venta_producto
        FOREIGN KEY (producto_id) REFERENCES productos(producto_id)
);

--DML – Datos y mantenimiento

-- Carga de registros:

BEGIN;

-- Clientes

INSERT INTO clientes (email, telefono) VALUES
('ana.gomez@mail.com', '11-4567-1001'),
('bruno.diaz@mail.com', '11-4567-1002'),
('carla.perez@mail.com', '11-4567-1003'),
('diego.torres@mail.com', '11-4567-1004'),
('elena.ruiz@mail.com', '11-4567-1005'),
('fabian.lopez@mail.com', '11-4567-1006'),
('gabriela.sosa@mail.com', '11-4567-1007'),
('hernan.molina@mail.com', '11-4567-1008'),
('ines.vega@mail.com', '11-4567-1009'),
('javier.castro@mail.com', '11-4567-1010'),
('jose.crevy@mail.com', '11-4359-0941');

-- Productos

INSERT INTO productos (nombre, marca, precio) VALUES
('Notebook 14"', 'Lenovo', 450000.00),
('Mouse inalámbrico', 'Logitech', 8500.00),
('Teclado mecánico', 'Redragon', 25000.00),
('Monitor 24"', 'Samsung', 180000.00),
('Auriculares bluetooth', 'JBL', 35000.00),
('Impresora multifunción', 'HP', 95000.00),
('Disco SSD 1TB', 'Kingston', 55000.00),
('Memoria RAM 16GB', 'Corsair', 32000.00),
('Webcam HD', 'Logitech', 18000.00),
('Router WiFi 6', 'TP-Link', 42000.00);

-- Ventas

INSERT INTO ventas (fecha_venta, cliente_id, producto_id) VALUES
('2026-07-01', 1, 3),
('2026-07-03', 2, 1),
('2026-07-05', 3, 5),
('2026-07-08', 4, 2),
('2026-07-10', 5, 7),
('2026-07-12', 6, 4),
('2026-07-15', 7, 9),
('2026-07-18', 8, 6),
('2026-07-22', 9, 10),
('2026-07-28', 10, 8);

COMMIT;

--update de precios:

BEGIN;

UPDATE productos
SET precio=precio+500;

COMMIT;

BEGIN;

UPDATE productos
SET precio = precio + 1000
WHERE marca = 'Logitech';

COMMIT;

BEGIN;

DELETE FROM clientes
WHERE cliente_id = 11;

COMMIT;
