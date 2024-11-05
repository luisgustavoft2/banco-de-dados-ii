
from sqlalchemy import create_engine, text, URL


def execute_from_file(url: str, path: str):

    
    with open(path, 'r') as file:
        sql_script = file.read()

    engine = create_engine(url)
    
    with engine.connect() as connection:


        statements = sql_script.split(';')

        for statement in statements:
            connection.execute(text(statement))