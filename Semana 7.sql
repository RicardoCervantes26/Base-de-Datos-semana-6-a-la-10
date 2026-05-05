-- ==========================================================
-- 1. CREACIÓN Y CARGA (INSERT INTO)
-- ==========================================================
CREATE TABLE dbo.Inventario (
    Producto VARCHAR(20),
    Categoria VARCHAR(20),
    Cantidad INT
);
GO

-- Insertamos múltiples filas en una sola instrucción
INSERT INTO dbo.Inventario (Producto, Categoria, Cantidad) 
VALUES 
('Manzana', 'Fruta', 10),
('Pera', 'Fruta', 5),
('Lechuga', 'Verdura', 8),
('Tomate', 'Verdura', 12);
GO

-- ==========================================================
-- 2. VERIFICACIÓN Y ELIMINACIÓN (DELETE)
-- ==========================================================
-- Primero seleccionamos para no borrar por error
SELECT * FROM dbo.Inventario WHERE Producto = 'Lechuga';
GO

-- Eliminamos solo la verdura específica usando WHERE
DELETE FROM dbo.Inventario 
WHERE Producto = 'Lechuga';
GO

-- ==========================================================
-- 3. REPORTE TABULAR (PIVOT)
-- ==========================================================
SELECT 'Stock Actual' AS Reporte, [Fruta], [Verdura]
FROM (
    SELECT Categoria, Cantidad 
    FROM dbo.Inventario
) AS Fuente
PIVOT (
    SUM(Cantidad)
    FOR Categoria IN ([Fruta], [Verdura])
) AS PivotFrutas;
GO