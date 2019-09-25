# fazer decodificador para o arduino usando python 
# primeiro ler um arquivo com as instrucoes de alto nivel e depois interpretar para o arduino
arquivo = "textoula.txt"
a = 0
b = 0
error = -1


def debugger(**args):
    pass


file = open(arquivo, "r")
inicio = file.readline()

# print(inicio.strip())

if inicio.strip() != "BEGIN:":
    raise Exception ("Erro: Arquivo selecionado invalido ou errado")


def formatar(linha):
    return linha.strip()


def atribuir_valor(Variavel=error, Valor=-1):

    global a
    global b

    print(Variavel)

    if Variavel == "A":
        a = Valor
    elif Variavel == "B":
        b = Valor


def pegar_Valor(line):
    line = formatar(line)

    variavel = line[0]
    
    valor = line[len(line) - 2]
    valor = int(valor, 16)

    print(variavel, type(variavel))
    print(valor, type(valor))

    atribuir_valor(Variavel=variavel, Valor=valor)


def operacao_or(line, flag=False):

    if flag:
        print(1)  # codigo para or negada

    else:
        if "An" in line:
            print(8, end="\n")

        elif "Bn" in line:
            print("D", end="\n")

        else:
            print("E", end="\n")


def operacao_xor(line, flag=False):

    if flag:
        print(9)  # codigo para or negada

    else:
        print(6)


def operacao_and(line):

    if "An" in line:
        print(2, end="\n")

    elif "Bn" in line:
        print(7, end="\n")

    else:
        print("B", end="\n")


def selecionar_operacao(line, flag=False):

    if 'o' in line:
        print(formatar(line), end=" tem valor: ")
        operacao_or(line, flag)

    elif 'x' in line:
        print(formatar(line), end=" tem valor: ")
        operacao_xor(line, flag)

    elif 'e' in line:
        print(formatar(line), end=" tem valor: ")
        print(4)

    elif 'A' in line and 'B' in line:
        print(formatar(line), end=" tem valor: ")
        operacao_and(line)


for x in file:

    # print(x)

    if '=' in x:

        print("Atribuir")
        pegar_Valor(x)

    elif 'n' == x[0]:
        selecionar_operacao(x, True)

    else:
        selecionar_operacao(x)


print(a)
print(b)
