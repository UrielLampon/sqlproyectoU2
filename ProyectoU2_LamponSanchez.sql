--Creacion de tablas

CREATE TABLE Remitentes (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(255),
    telefono VARCHAR(15)
);

CREATE TABLE Destinatarios (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(255),
    telefono VARCHAR(15)
);

CREATE TABLE Paquetes (
    id SERIAL PRIMARY KEY,
    remitente_id INTEGER REFERENCES Remitentes(id),
    destinatario_id INTEGER REFERENCES Destinatarios(id),
    descripcion TEXT,
    fecha_envio DATE,
    fecha_estimada_entrega DATE,
    estado VARCHAR(20)
);


--Introducir valores

INSERT INTO Remitentes (nombre, direccion, telefono) VALUES
('Juan Pérez', 'Calle 123', '123456789'),
('María Gómez', 'Avenida Central', '987654321'),
('Luis Martínez', 'Calle Principal', '111222333'),
('Ana Rodríguez', 'Calle de los Árboles', '444555666'),
('Pedro Sánchez', 'Avenida del Sol', '777888999'),
('Laura Fernández', 'Calle del Río', '222333444'),
('Carlos López', 'Avenida del Parque', '555666777'),
('Sofía Hernández', 'Calle de las Flores', '888999000'),
('Diego Ramírez', 'Avenida de la Montaña', '333444555'),
('Patricia Torres', 'Calle de la Luna', '666777888');

INSERT INTO Destinatarios (nombre, direccion, telefono) VALUES
('Ana González', 'Calle 456', '111111111'),
('Carlos Pérez', 'Avenida Norte', '222222222'),
('Sofía Martínez', 'Calle Sur', '333333333'),
('Juan Gómez', 'Avenida Oeste', '444444444'),
('María Rodríguez', 'Calle Este', '555555555'),
('Pedro Sánchez', 'Avenida Central', '666666666'),
('Laura López', 'Calle 789', '777777777'),
('Luis Hernández', 'Avenida Principal', '888888888'),
('Patricia Ramírez', 'Calle 234', '999999999'),
('Diego Torres', 'Avenida 678', '000000000');

INSERT INTO Paquetes (remitente_id, destinatario_id, descripcion, fecha_envio, fecha_estimada_entrega, estado) 
VALUES 
(1, 1, 'Paquete de libros', '2024-03-15', '2024-03-20', 'En tránsito'),
(2, 2, 'Ropa y accesorios', '2024-03-18', '2024-03-23', 'En tránsito'),
(3, 3, 'Electrodomésticos', '2024-03-20', '2024-03-25', 'En almacén'),
(4, 4, 'Artículos de oficina', '2024-03-22', '2024-03-27', 'En tránsito'),
(5, 5, 'Juguetes para niños', '2024-03-25', '2024-03-30', 'Entregado'),
(1, 2, 'Equipamiento deportivo', '2024-03-28', '2024-04-02', 'En tránsito'),
(2, 3, 'Electrónica', '2024-04-01', '2024-04-06', 'En almacén'),
(3, 4, 'Suministros médicos', '2024-04-05', '2024-04-10', 'En tránsito'),
(4, 5, 'Decoración para el hogar', '2024-04-08', '2024-04-13', 'En tránsito'),
(5, 1, 'Instrumentos musicales', '2024-04-10', '2024-04-15', 'En almacén');


--Select from

SELECT * FROM Remitentes;
SELECT * FROM Destinatarios;
SELECT * FROM Paquetes;

SELECT * FROM Paquetes ORDER BY fecha_envio;
SELECT * FROM Paquetes ORDER BY fecha_estimada_entrega DESC;
SELECT * FROM Paquetes WHERE estado='Entregado'
SELECT * FROM Paquetes WHERE estado='En almacén'
SELECT * FROM Paquetes WHERE estado='En tránsito'

SELECT * FROM Destinatarios ORDER BY telefono DESC;
SELECT * FROM Destinatarios WHERE nombre='María Rodríguez'


--ALTER Y UPDATES

ALTER TABLE Remitentes
ADD correo_electronico VARCHAR(100);

UPDATE Remitentes
SET telefono = '555-5555'
WHERE id = 1;

--Elimina la Columna--
ALTER TABLE Remitentes
DROP COLUMN direccion;

UPDATE Destinatarios
SET direccion = REPLACE(direccion, 'Calle', 'Avenida');

UPDATE Paquetes 
SET estado = 'entregado'
WHERE id = 1;
