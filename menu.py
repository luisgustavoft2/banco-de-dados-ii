

def main_menu():
    print("\nMenu de Navegação do Sistema de Banco de Dados para Restaurante")
    print("1. Criar Banco de Dados")
    print("2. Destruir Banco de Dados")
    print("3. Inserir Dados em Cliente")
    print("4. Consultar Vendas")
    print("5. Listar Procedimentos")
    print("6. Listar Funcoes")
    print("7. Listar Triggers")
    print("8. Sair")
    
    try:
        choice = int(input("\nSelecione uma opcoo: "))
        return choice
    except ValueError:
        print("Entrada invalida. Insira um número correspondente a opcao.")
        return None

def handle_option(choice, engine):
    if choice == 1:
        create_database(engine)
        print("Banco de dados criado.")
    elif choice == 2:
        drop_database(engine)
        print("Banco de dados destruido.")
    elif choice == 3:
        nome = input("Nome do cliente: ")
        sexo = input("Sexo (m/f/o): ")
        idade = input("Idade: ")
        nascimento = input("Data de nascimento (YYYY-MM-DD): ")
        pontos = input("Pontos iniciais: ")
        insert_cliente(engine, nome, sexo, idade, nascimento, pontos)
        print("Cliente inserido.")
    elif choice == 4:
        vendas = select_venda(engine)
        print("Vendas:", vendas)
    elif choice == 5:
        print("Procedimentos disponiveis: reajuste, sorteio, estatisticas, gastar_pontos")
    elif choice == 6:
        print("Funcoes disponiveis: calculo de pontos")
    elif choice == 7:
        print("Triggers implementados: calculo de pontos por gasto, expiracao de ingredientes, disponibilidade de pratos e atualizacao de estoque")
    elif choice == 8:
        print("Saindo do sistema...")
        return False
    else:
        print("Opcao invalida. Tente novamente.")
    return True

def run_menu(engine):
    running = True
    while running:
        choice = main_menu()
        if choice is not None:
            running = handle_option(choice, engine)

run_menu(engine)
