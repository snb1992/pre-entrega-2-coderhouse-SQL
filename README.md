# Pre-entrega 2 — Proyecto Retail (PostgreSQL)

Script SQL que crea la base `retail_project` con las tablas `clientes`,
`productos` y `ventas`, con restricciones de integridad y carga inicial
de datos.

## Requisitos

- PostgreSQL instalado (probado con PostgreSQL 14+) y pgAdmin.

## Cómo ejecutar el script usando pgAdmin



1. Creá la base `retail_project` desde la interfaz (o ejecutá el
   `CREATE DATABASE` en el Query Tool de otra base).
2. Abrí una nueva conexión/Query Tool ya apuntando a `retail_project`.
3. Pegá y ejecutá el resto del script (DDL + DML).

## Contenido del script

- **DDL**: `clientes`, `productos`, `ventas` (en ese orden, porque
  `ventas` depende de las otras dos vía `FOREIGN KEY`).
- **Restricciones**: `PRIMARY KEY` en las tres tablas, `FOREIGN KEY`
  en `ventas`, y 4 `CHECK`: `precio > 0`, `stock >= 0`, `edad >= 18`,
  `cantidad > 0`. `email` es `UNIQUE NOT NULL`.
- **DML**: carga de 10 registros por tabla dentro de `BEGIN...COMMIT`,
  un `UPDATE` de precios por marca (`WHERE marca = 'Logitech'`), 
  un `UPDATE` de stock por nombre (`WHERE nombre = 'Monitor 24"'`) 
  y un `DELETE` de una venta puntual (`WHERE venta_id = 10`).
