-- fill database tables--

-- fill first table (chofer)
COPY chofer
(
	nombre_pila,
	apellido_paterno,
	apellido_materno,
	calle,
	correo_electronic,
	fecha_nacimiento,
	fecha_ingreso
)
FROM
	'../CSVs/choferes.csv' WITH FORMAT csv;
	

-- fill second table (carros)
COPY carros
FROM
	'../CSVs/carros.csv' WITH FORMAT csv;
			
COPY telefonos
FROM
	'../CSVs/telefonos.csv' WITH FORMAT csv;

COPY telefonos
FROM
	'../CSVs/horarios.csv' WITH FORMAT csv;