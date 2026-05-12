USE Nueva;
IF OBJECT_ID('sp_ActualizarNombreProducto', 'P') IS NOT NULL
    DROP PROCEDURE sp_ActualizarNombreProducto;
GO
IF OBJECT_ID('Productos', 'U') IS NOT NULL
    DROP TABLE Productos;
GO
GO 

CREATE TABLE Productos (
    Id INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Precio DECIMAL(10,2)
);
GO 

INSERT INTO Productos VALUES
(1, 'Monitor', 500.00),
(2, 'Teclado', 100.00),
(3,'Raton',172.00),
(4, 'Auriculares',179.00);
GO

-- El Procedimiento Almacenado
-- Creamos un procedimiento que solo busca un producto
CREATE PROCEDURE sp_BuscarProducto
    @IdBuscado INT
AS
BEGIN
    
    SELECT Id, Nombre, Precio
    FROM Productos
    WHERE Id = @IdBuscado;
END;
GO
--Procemiento que actuliza datos
CREATE PROCEDURE sp_ActualizarPrecioSimple
    @Id INT,
    @NuevoPrecio DECIMAL(10,2)
AS
BEGIN
    UPDATE Productos
    SET Precio = @NuevoPrecio
    WHERE Id = @Id;
    
    PRINT 'Precio actualizado correctamente';
END;
GO

EXEC sp_ActualizarPrecioSimple 2, 120.00;
EXEC sp_BuscarProducto 3;
SELECT*FROM Productos;