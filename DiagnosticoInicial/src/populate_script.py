import csv
import logging
import psycopg2

#################
# Usr = "Usuario del smbd"
# Pswrd = "password"
##################

print("Bienvenido!\n Para comenzar a cargar los datos ingresa usuario y contraseña de postgres")
print("NOTA: para esto deberias haber creado la BD primero ejecutando el script DDL.sql")
print(" \n")
print("Usuario: ")
usr = input()
print("Contraseña: ")
pswrd = input()



try:
    connection = psycopg2.connect(user = usr,
                                  password = pswrd,
                                  host = "127.0.0.1",
                                  port = "5432",
                                  database = "conductores")

    cursor = connection.cursor()

    # Populate  Tables
    try:
        
        #populate "carros" table
        with open('../CSVs/carros.csv', 'r') as f:
            reader = csv.reader(f)
            for row in reader:
                cursor.execute("INSERT INTO carros VALUES (%s,%s,%s,%s,%s,%s,%s)",row)
            connection.commit()
            
        
        #populate "chofer" table
        with open('../CSVs/choferes.csv', 'r') as f:
            reader = csv.reader(f)
            for row in reader:
                cursor.execute("INSERT INTO chofer VALUES (DEFAULT,%s,%s,%s,%s,%s,%s,%s)",row)
            connection.commit()


        # Populate "telefonos" table  
        with open('../CSVs/telefonos.csv', 'r') as f:
            reader = csv.reader(f)
            for row in reader:
                cursor.execute("INSERT INTO telefonos VALUES (%s,%s)",row)
            connection.commit()


        #populate maneja table        
        with open('../CSVs/horarios.csv', 'r') as f:
            reader = csv.reader(f)
            for row in reader:
                cursor.execute("INSERT INTO maneja VALUES (%s,%s,%s,%s)",row)
            connection.commit()


    
    except IOError:
        logging.exception('')
    
    
    print("Registros agregados!")


except (Exception, psycopg2.Error) as error :
    print ("Error while connecting to PostgreSQL", error)

finally:
    #closing database connection.
        if(connection):
            cursor.close()
            connection.close()
            print("PostgreSQL connection is closed")