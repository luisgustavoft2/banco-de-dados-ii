from sqlalchemy import create_engine, text, URL
from sqlalchemy.exc import SQLAlchemyError
from functions import execute_from_file


url_object = URL.create(
    "mysql+mysqlconnector",
    username="root",
    password="Usuario123",
    host="localhost"
)


#inicialização do banco (usar try caso já tenha sido inicializado)
#menu com opções
#chamadas de função para cada opção


#try:
    #with engine.connect() as connection:

     #   connection.execute(text("drop database restaurante"))

#except SQLAlchemyError as e:
    #print("ERROR:" , e)



try:
    execute_from_file(url_object, 'scripts/restaurantedatabase.sql')
except SQLAlchemyError as e:
    print("ERROR: ", e)

print("REACHED EOF")

