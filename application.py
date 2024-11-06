from sqlalchemy import create_engine, text, URL
from sqlalchemy.exc import SQLAlchemyError
from functions import drop_database, create_database, insert_cliente
from selects_inserts import *

#checar se banco existe com root engine, inicializar o banco caso não exista
#sistema possuirá funcionalidades descritas no requerimento de projeto
#demais funcionalidades serão criadas para demonstração dos requisitos

url_object = URL.create(
    "mysql+mysqlconnector",
    username="root",
    password="Usuario123",
    host="localhost"
)
engine = create_engine(url_object)



drop_database(engine)

try:
    create_database(engine)
    print()

except SQLAlchemyError as e:
    print("erro:", e)

else:
    print("database created")

insert_cliente(engine, "Breno", "m", "31", "1993-07-09", "0")

rows = select_venda(engine)
print(rows)

print("REACHED EOF")