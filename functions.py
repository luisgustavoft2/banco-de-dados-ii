
from sqlalchemy import create_engine, text, URL
import os



def execute_from_file_split(engine, path: str):

    
    with open(path, 'r') as file:
        sql_script = file.read()

    
    
    with engine.connect() as connection:


        statements = sql_script.split(';')

        for statement in statements:
            connection.execute(text(statement))

def execute_from_file_raw(engine, path: str):

    
    with open(path, 'r') as file:
        sql_script = file.read()

    
    
    with engine.connect() as connection:
        connection.execute(text(sql_script))

def drop_database(engine):

    with engine.connect() as connection:

            connection.execute(text("drop database restaurante"))

            connection.execute(text("DROP USER IF EXISTS 'admin'@'localhost'"))
            connection.execute(text("DROP USER IF EXISTS 'gerente'@'localhost';"))
            connection.execute(text("DROP USER IF EXISTS 'funcionario'@'localhost';"))


def create_database(engine):
     
    execute_from_file_split(engine, 'scripts/restaurantedatabase.sql')

    execute_from_file_split(engine, 'scripts/insertions.sql')

    execute_from_file_split(engine, 'scripts/users.sql')


    execute_from_file_raw(engine, 'scripts/procedures/procedure_reajuste.sql')
   
    execute_from_file_raw(engine, 'scripts/triggers/trigger_ponto_por_compra.sql')




    