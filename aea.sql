use master;
GO

create database bd_ventas;
use bd_ventas;

drop table tb_personal;

create table tb_personal (
	dni VARCHAR(8) NOT NULL,
    ap_paterno VARCHAR(20) NOT NULL,
    ap_materno VARCHAR(20) NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    genero char(1) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    sueldo FLOAT NOT NULL
);

CREATE TABLE tb_empleado (
    DNI VARCHAR(8) NOT NULL ,
    Nombre VARCHAR(50) NOT NULL,
    Direccion VARCHAR(100) NOT NULL,
    Telefono VARCHAR(15) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Sueldo FLOAT NOT NULL,
    Estado_civil VARCHAR(100) NOT NULL
);
select * from tb_empleado;
drop table tb_empleado;
-- Johan
CREATE TABLE Especialidades (
    Id_especialidad INT NOT NULL PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Area VARCHAR(50) NOT NULL
);
-- Luis
CREATE TABLE IF NOT EXISTS tb_departamento (
    codigo_departamento CHAR(5) NOT NULL PRIMARY KEY,
    departamento VARCHAR(25) NOT NULL
);

CREATE TABLE IF NOT EXISTS tb_provincia (
    codigo_provincia CHAR(5) NOT NULL PRIMARY KEY,
    provincia VARCHAR(50) NOT NULL,
    provincia_codigo_departamento CHAR(5) NOT NULL,
    FOREIGN KEY (provincia_codigo_departamento) REFERENCES tb_departamento (codigo_departamento)
);

CREATE TABLE IF NOT EXISTS tb_distrito (
    codigo_distrito CHAR(5) NOT NULL PRIMARY KEY,
    distrito VARCHAR(50) NOT NULL,
    distrito_codigo_provincia CHAR(5) NOT NULL,
    FOREIGN KEY (distrito_codigo_provincia) REFERENCES tb_provincia (codigo_provincia)
);

CREATE TABLE IF NOT EXISTS tb_cliente (
    codigo_cliente CHAR(5) NOT NULL PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    ap_paterno VARCHAR(20) NOT NULL,
    ap_materno VARCHAR(20) NOT NULL,
    fecha_nacimiento DATE,
    direccion VARCHAR(50),
    correo_electronico VARCHAR(50),
    distrito_nombre VARCHAR(50) NOT NULL,
    FOREIGN KEY (distrito_nombre) REFERENCES tb_distrito (codigo_distrito)

);
-- Timoty
CREATE TABLE tb_recurso(
    Id_recursos INT PRIMARY KEY NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Categoria VARCHAR(50) NOT NULL,
    Estado VARCHAR(50) NOT NULL,
    Fecha_Adquisicion DATE NOT NULL,
    Costo DOUBLE NOT NULL
);
-- Marrufo
CREATE TABLE Servicios(
    Id_servicios INT PRIMARY KEY NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Precio DOUBLE NOT NULL,
    Duracion VARCHAR(50) NOT NULL,
    Categoria VARCHAR(50) NOT NULL,
    Estado VARCHAR(50) NOT NULL
);
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
INSERT INTO tb_personal (dni, ap_paterno, ap_materno, nombre, genero, fecha_nacimiento, sueldo)
VALUES 
('13579246', 'Vega', 'Diaz', 'Julia', 'F', '1991-01-11', 2900.00),
('24681357', 'Torres', 'Hernandez', 'Luis', 'M', '1982-04-15', 3100.00),
('35792468', 'Ruiz', 'Torres', 'Isabel', 'F', '1989-07-23', 2700.00),
('46813579', 'Ramirez', 'Cruz', 'David', 'M', '1984-11-30', 3400.00),
('57924680', 'Flores', 'Ramirez', 'Carmen', 'F', '1996-03-17', 2200.00),
('68035791', 'Rivera', 'Mora', 'Jose', 'M', '1987-10-04', 3000.00),
('79146802', 'Castro', 'Navarro', 'Lucia', 'F', '1994-06-21', 2400.00),
('80257913', 'Ortiz', 'Paredes', 'Fernando', 'M', '1981-05-08', 3300.00),
('91368024', 'Morales', 'Soto', 'Marta', 'F', '1992-09-19', 2500.00),
('02479135', 'Rojas', 'Ramirez', 'Jorge', 'M', '1986-12-12', 3600.00);

select * from tb_personal;

-- Inserts
-- Timoty
INSERT INTO tb_recurso VALUES 
(1, 'Computadora portátil', 'Tecnología', 'Disponible', '2024-04-15', 1200.00),
(2, 'Proyector', 'Tecnología', 'En reparación', '2023-11-20', 800.00),
(3, 'Silla de oficina', 'Mobiliario', 'Disponible', '2022-09-10', 150.00);
select * from tb_recurso;
-- Marrufo
INSERT INTO Servicios VALUES 
('1','Mantenimiento de computadoras', 80.00, '1 hora', 'Tecnología', 'Disponible'),
('2','Limpieza de oficinas', 50.00, '2 horas', 'Limpieza', 'Disponible'),
('3','Diseño gráfico', 100.00, 'Variable', 'Creatividad', 'En espera');
select * from Servicios;

-- Luis

INSERT INTO tb_departamento VALUES
('DP001','Lima'),
('DP002','Arequipa'),
('DP003','Ica'),
('DP004','Cajamarca'),
('DP005','Lambayeque');

INSERT INTO tb_provincia VALUES
('PR001','Lima', 'DP001'),
('PR002','Arequipa', 'DP002'),
('PR003','Ica', 'DP003'),
('PR004','Cajamarca', 'DP004'),
('PR005','Lambayeque', 'DP005');

INSERT INTO tb_distrito VALUES
('D0001','Lima', 'PR001'),
('D0002','Callao', 'PR002'),
('D0003','San Martín de Porres', 'PR001'),
('D0004','Los Olivos', 'PR001'),
('D0005','Arequipa', 'PR002');

INSERT INTO tb_cliente VALUES
('C0001', 'Carlos', 'Ramos', 'Vera', '1999-04-12', 'Av. Sauces 253', 'carlos.r@gmail.com', 'D0001'),
('C0002', 'Rosa', 'Collantes', 'Flores', '2000-05-31', 'Jr. Álamos 354', NULL, 'D0002'),
('C0003', 'Felipe', 'Montes', 'Salas', '2001-09-22', 'Av. Flores 2541', 'fmontes.salas@gmail.com', 'D0001'),
('C0004', 'Viviana', 'Gonzáles', 'Roca', '2000-07-17', 'Calle Lomas 251', 'viviana.gr20@gmail.com', 'D0001'),
('C0005', 'Jojan', 'Martínez', 'Salvatierra', '2003-04-24', 'Calle Los naranjos', 'johanm@gmail.com', 'D0003');

-- Johan
INSERT INTO Especialidades (Id_especialidad, Nombre, Area) VALUES 
('1','Ingeniería de Software', 'Desarrollo y Mantenimiento de Software'),
('2','Administración de Bases de Datos', 'Gestión y Seguridad de la Información'),
('3','Desarrollo Web', 'Diseño y Desarrollo de Sitios Web');
SELECT * from Especialidades;

-- Diego
insert into tb_empleado values
('12345678', 'Diego','Av.Peru','123456789','aea@gmail.com','1200','Casado'),
('11112222', 'Teresa','Campo de Marte','111222333','zzz@hotmail.com','1100','Divorciada'),
('88888888', 'Johan','Av.Larco','999999999','uwu@outlook.com','1000','Soltero'), 
('98765432', 'María', 'Av. España', '987654321', 'maria@example.com', '1300', 'Casado'),
('55556666', 'Juan', 'Jr. Tacna', '555555555', 'juan@example.com', '1150', 'Casado'),
('77779999', 'Ana', 'Av. Arequipa', '777777777', 'ana@example.com', '1250', 'Soltero'),
('44448888', 'Pedro', 'Av. Brasil', '444444444', 'pedro@example.com', '1200', 'Divorciado'),
('22223333', 'Lucía', 'Calle Alfonso Ugarte', '222222222', 'lucia@example.com', '1100', 'Viudo');

SELECT * from tb_empleado;

-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
-- Sp de Empleados
-- LISTAR EMPLEADO
-- MOSTRAR EMPLEADO
-- REGISTRAR EMPLEADO
-- BUSCAR AL EMPLEADO
-- EDITAR EMPLEADO
-- BORRAR EMPLEADO
-- CONSULTAR EMPLEADO
-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
-- SP de listar personal

CREATE PROCEDURE sp_listar_personal
AS
BEGIN
	SELECT * FROM tb_personal ORDER BY nombre;
END;
GO
exec sp_listar_personal;

CREATE PROCEDURE sp_consultar_personal
    @dni VARCHAR(8)
AS
BEGIN
    SELECT *
    FROM tb_personal
    WHERE dni = @dni;
END;
EXEC sp_consultar_personal '91368024';


-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
-- SP DE LISTAR ESPECIALIDADES
-- Johan
-- SP DE BORRAR ESPECIALIDADES
-- EDITAR ESPECIALIDADES
-- SP DE FILTRAR ESPECIALIDADES
-- SP DE REGISTRAR ESPECIALIDADES
-- SP DE MOSTRAR ESPECIALIDADES
-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
-- SP DE CLIENTES
-- Luis
DELIMITER $$

CREATE PROCEDURE sp_ListarCliente()
BEGIN
    SELECT 
        c.codigo_cliente,
        c.nombre,
        c.ap_paterno,
        c.ap_materno,
        c.fecha_nacimiento,
        c.direccion,
        c.correo_electronico,
        d.distrito AS distrito_nombre
    FROM 
        tb_cliente c
    INNER JOIN 
        tb_distrito d ON c.distrito_nombre = d.codigo_distrito;
END $$

DELIMITER $$

CREATE PROCEDURE sp_BuscarClientePorCodigo(IN codigo_cliente_param CHAR(5))
BEGIN
    SELECT 
        c.codigo_cliente,
        c.nombre,
        c.ap_paterno,
        c.ap_materno,
        c.fecha_nacimiento,
        c.direccion,
        c.correo_electronico,
        d.distrito AS distrito_nombre
    FROM 
        tb_cliente c
    INNER JOIN 
        tb_distrito d ON c.distrito_nombre = d.codigo_distrito
    WHERE 
        c.codigo_cliente = codigo_cliente_param;
END $$

DELIMITER ;

-- //////////////////////////////////////////////////////////////////////////////
DELIMITER $$

CREATE PROCEDURE sp_ListarDistrito()
BEGIN
    SELECT *
    FROM tb_distrito;
END $$

DELIMITER ;
-- //////////////////////////////////////////////////////////////////

DELIMITER //

CREATE PROCEDURE sp_EditarCliente(
    IN p_codigo_cliente INT,
    IN p_nombre VARCHAR(50),
    IN p_ap_paterno VARCHAR(50),
    IN p_ap_materno VARCHAR(50),
    IN p_fecha_nacimiento DATE,
    IN p_direccion VARCHAR(100),
    IN p_correo_electronico VARCHAR(100),
    IN p_distrito_nombre VARCHAR(50)
)
BEGIN
    UPDATE cliente
    SET nombre = p_nombre,
        ap_paterno = p_ap_paterno,
        ap_materno = p_ap_materno,
        fecha_nacimiento = p_fecha_nacimiento,
        direccion = p_direccion,
        correo_electronico = p_correo_electronico,
        distrito_nombre = p_distrito_nombre
    WHERE codigo_cliente = p_codigo_cliente;
END //

DELIMITER ;

-- //////////////////////////////////////////////////////////////////////////////////////

DELIMITER $$

CREATE PROCEDURE sp_ConsultarClientePorCodigo(IN p_codcli CHAR(5))
BEGIN
    SELECT 
        c.codigo_cliente,
        c.nombre,
        c.ap_paterno,
        c.ap_materno,
        c.fecha_nacimiento,
        c.direccion,
        c.correo_electronico,
        d.distrito AS distrito_nombre
    FROM 
        tb_cliente c
    INNER JOIN 
        tb_distrito d ON c.distrito_nombre = d.codigo_distrito
    WHERE 
        c.codigo_cliente = p_codcli;
END $$

DELIMITER ;
-- /////////////////////////////////////////////////////////////////////////////////////////////////
DELIMITER $$
CREATE PROCEDURE sp_RegistrarCliente(
    IN p_codigo_cliente CHAR(5),
    IN p_nombre VARCHAR(20),
    IN p_ap_paterno VARCHAR(20),
    IN p_ap_materno VARCHAR(20),
    IN p_fecha_nacimiento DATE,
    IN p_direccion VARCHAR(50),
    IN p_correo_electronico VARCHAR(50),
    IN p_distrito_nombre VARCHAR(50) -- Corregido el tipo de datos
)
BEGIN
    INSERT INTO tb_cliente (codigo_cliente, nombre, ap_paterno, ap_materno, fecha_nacimiento, direccion, correo_electronico, distrito_nombre)
    VALUES (p_codigo_cliente, p_nombre, p_ap_paterno, p_ap_materno, p_fecha_nacimiento, p_direccion, p_correo_electronico, p_distrito_nombre);
END $$

DELIMITER ;

-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
-- SP RECURSOS
-- Timoty
DELIMITER //

-- SP para listar todos los recursos
CREATE PROCEDURE sp_ListarRecurso()
BEGIN
    SELECT * FROM tb_recurso;
END//

-- SP para buscar un recurso por su ID
CREATE PROCEDURE sp_BuscarRecursoPorId(IN id INT)
BEGIN
    SELECT * FROM tb_recurso WHERE Id_recursos = id;
END//

DELIMITER //

-- SP para registrar un nuevo recurso
CREATE PROCEDURE sp_RegistrarRecurso(
    IN id INT,
    IN nombre VARCHAR(50),
    IN categoria VARCHAR(50),
    IN estado VARCHAR(50),
    IN fechaAdquisicion DATE,
    IN costo DOUBLE
)
BEGIN
    INSERT INTO tb_recurso(Id_recursos, Nombre, Categoria, Estado, Fecha_Adquisicion, Costo)
    VALUES(id, nombre, categoria, estado, fechaAdquisicion, costo);
END//
DELIMITER //



-- SP para editar un recurso existente
CREATE PROCEDURE sp_EditarRecurso(
    IN id INT,
    IN nombre VARCHAR(50),
    IN categoria VARCHAR(50),
    IN estado VARCHAR(50),
    IN fechaAdquisicion DATE,
    IN costo DOUBLE
)
BEGIN
    UPDATE tb_recurso 
    SET Nombre = nombre, Categoria = categoria, Estado = estado, Fecha_Adquisicion = fechaAdquisicion, Costo = costo
    WHERE Id_recursos = id;
END//

-- SP para borrar un recurso por su ID
CREATE PROCEDURE sp_BorrarRecurso(IN id INT)
BEGIN
    DELETE FROM tb_recurso WHERE Id_recursos = id;
END//

DELIMITER //

CREATE PROCEDURE ConsultarRecursoPorId(IN id_recurso INT)
BEGIN
    SELECT * FROM tb_recurso WHERE Id_recursos = id_recurso;
END
DELIMITER //

-- //////////////////////////////////////////////////////////////////////////////////////////////////////////

DELIMITER //

CREATE PROCEDURE sp_FiltrarRecurso(
    IN valor VARCHAR(100)
)
BEGIN
    SELECT * FROM tb_recurso WHERE Nombre LIKE CONCAT('%', valor, '%') OR Categoria LIKE CONCAT('%', valor, '%');
END//

DELIMITER ;

-- /////////////////////////////////////////////////////////////////////////////////////////////
-- Sp de Servicios
-- Marrufo
-- listar servicios
delimiter $$
create procedure sp_ListarServicios()
begin
    select * from Servicios;
end; $$
-- mostrar servicio por codigo
delimiter $$
create procedure sp_MostrarServiciosPorCodigo(in codser varchar(50))
begin
    select * from Servicios where Id_Servicios = codser;
end; $$

-- Eliminar servicios por Codigo
delimiter $$
create procedure sp_BorrarServicios(in codser varchar(50))
begin
    delete  from Servicios where Id_Servicios = codser;
end; $$


-- Filtrar servico por nombre y categoria
DELIMITER //
CREATE PROCEDURE sp_FiltrarServicios(IN p_valor VARCHAR(40))
BEGIN
    SELECT Id_servicios, Nombre, Precio, Duracion, Categoria, Estado
    FROM servicios
    WHERE Nombre LIKE CONCAT('%', p_valor, '%') OR Categoria LIKE CONCAT('%', p_valor, '%');
END //
DELIMITER ;
-- Buscar servicios por Codigo
delimiter $$
create procedure sp_BuscarServiciosporCodigo(in codser varchar(50))
begin
    select * from Servicios where Id_Servicios = codser;
end; $$
-- Registrar servicio
delimiter $$
CREATE PROCEDURE sp_RegistrarServicios(
    IN idser VARCHAR(10),
    IN nom VARCHAR(255),
    IN pre DECIMAL(10,2),
    IN dur VARCHAR(100),
    IN cat VARCHAR(255),
    IN est VARCHAR(50)
)
BEGIN
    INSERT INTO Servicios (Id_servicios, Nombre, Precio, Duracion, Categoria, Estado)
    VALUES (idser, nom, pre, dur, cat, est);
END;
$$
-- Editar Servicios
DELIMITER $$
CREATE PROCEDURE sp_EditarServicios(
    IN idser VARCHAR(10),
    IN nom VARCHAR(255),
    IN pre DECIMAL(10,2),
    IN dur VARCHAR(100),
    IN cat VARCHAR(255),
    IN est VARCHAR(50)
)
BEGIN
    UPDATE Servicios
    SET Nombre = nom,
        Precio = pre,
        Duracion = dur,
        Categoria = cat,
        Estado = est
    WHERE Id_servicios = idser;
END;
$$
-- /////////////////////////////////////////////////////////////////////////////////////////////
-- /////////////////////////////////////////////////////////////////////////////////////////////
-- /////////////////////////////////////////////////////////////////////////////////////////////
-- /////////////////////////////////////////////////////////////////////////////////////////////
-- /////////////////////////////////////////////////////////////////////////////////////////////
-- /////////////////////////////////////////////////////////////////////////////////////////////
-- /////////////////////////////////////////////////////////////////////////////////////////////
-- /////////////////////////////////////////////////////////////////////////////////////////////
-- /////////////////////////////////////////////////////////////////////////////////////////////