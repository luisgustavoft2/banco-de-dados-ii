from sqlalchemy import create_engine, text, URL
from sqlalchemy.exc import SQLAlchemyError
from functions import drop_database, create_database


url_object = URL.create(
    "mysql+mysqlconnector",
    username="root",
    password="Usuario123",
    host="localhost"
)
engine = create_engine(url_object)

#inicialização do banco

try:
    create_database(engine)

except SQLAlchemyError as e:
    print("banco de dados já existe")

else:
    print("database created")


#menu com opções
#chamadas de função para apresentar requisitos

print("REACHED EOF")