-- -----QUERYS----- --

-- 1.- Conocer los datos de los automóviles que tengan más de 15 años de haberse comprado.
   
    SELECT *
	FROM carros
	WHERE CAST(carros.año as INTEGER) < CAST(date_part('year',CURRENT_DATE)-15 as INTEGER);

-- 2.- Conocer los datos de los automóviles que están contenidos en cada una de
    -- las categorías (Lite, Luxury). No olvides que la categoría se debe visualizar
    -- dentro de los datos del automóvil.

    --Lite
	SELECT * 
	FROM carros
	WHERE precio_factura < 449,999.00;
	
	--Luxury
	SELECT * 
	FROM carros
	WHERE precio_factura > 449,999.00;
	

-- 3.- Conocer el nombre, edad y la fecha en la que inició a trabajar de todos los choferes.

     SELECT 
		nombre_pila,
		age(fecha_nacimiento,CURRENT_DATE) as edad,
		fecha_ingreso
	FROM chofer;

-- 4.- Conocer el nombre y edad de todos los choferes que han conducido en más
    -- de un automóvil.

    SELECT 
        chofer.nombre_pila,
        age(chofer.fecha_nacimiento,CURRENT_DATE) as edad
	FROM maneja
	    JOIN chofer on maneja.id_chofer = chofer.id_chofer
	
    GROUP BY maneja.id_chofer,nombre_pila,edad
	
    HAVING COUNT(maneja.id_chofer)>1;

-- 5.- Conocer la capacidad de pasajeros, el costo, categoría y modelo de cada
    -- uno de los automóviles.

    --pendiente