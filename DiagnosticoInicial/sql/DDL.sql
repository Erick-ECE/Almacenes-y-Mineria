 -- create the database
CREATE DATABASE conductores; 

 -- create tables
CREATE TABLE chofer(
	id_chofer SERIAL PRIMARY KEY,
    nombre_pila VARCHAR(25),
    apellido_paterno VARCHAR(25),
	apellido_materno VARCHAR(25),
	calle VARCHAR(25),
	correo_electronico VARCHAR(320),
	fecha_nacimiento DATE,
	fecha_ingreso DATE    
);

CREATE TABLE carros(
	placas CHAR(7) PRIMARY KEY,
	marca VARCHAR(15),
	submarca VARCHAR(15),
	año CHAR(4),
	color VARCHAR(22),
	capacidad SMALLINT,
	precio_factura NUMERIC(20,2)
);

CREATE TABLE telefonos(
	id_chofer INT REFERENCES chofer(id_chofer),
	telefonos VARCHAR(20)
);


CREATE TABLE maneja(
	id_chofer INT REFERENCES chofer(id_chofer),
	placas_carro CHAR(7) REFERENCES carros(placas),
	fecha_inicio DATE,
	fecha_fin DATE
);


		

