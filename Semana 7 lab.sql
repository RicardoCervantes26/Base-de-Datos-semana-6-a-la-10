-- ==========================================================
-- 1. CREACIÓN Y CARGA (INSERT INTO)
-- ==========================================================
CREATE TABLE Inventario (
    Producto VARCHAR(20),
    Categoria VARCHAR(20),
    Cantidad INT
);
GO

-- Insertamos múltiples filas en una sola instrucción
INSERT INTO Inventario (Producto, Categoria, Cantidad) 
VALUES 
('Manzana', 'Fruta', 10),
('Pera', 'Fruta', 5),
('Lechuga', 'Verdura', 8),
('Tomate', 'Verdura', 12);
GO

-- ==========================================================
-- 2. DELETE
-- ==========================================================
-- Primero seleccionamos para no borrar por error
SELECT * FROM Inventario WHERE Producto = 'Lechuga';
GO

-- Eliminamos solo la verdura específica usando WHERE
DELETE FROM Inventario 
WHERE Producto = 'Lechuga';
GO

-- ==========================================================
-- 3. PIVOT
-- ==========================================================
SELECT 'Stock Actual' AS Reporte, [Fruta], [Verdura]
FROM (
    SELECT Categoria, Cantidad 
    FROM Inventario
) AS Fuente
PIVOT (
    SUM(Cantidad)
    FOR Categoria IN ([Fruta], [Verdura])
) AS PivotFrutas;
GO