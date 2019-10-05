# fazer decodificador para o arduino usando python 
# primeiro ler um arquivo com as instrucoes de alto nivel e depois interpretar para o arduino
import serial
import time

serial.Serial('COM12')  # a com que sera usada no computador
arquivo = "testeula.ula"
saida = "testeula.hex"
lista = ["0", "0", "0"]
a = 0
b = 0
error = -1


def debugger(**args):
    pass


file = open(arquivo, "r")
outfile = open(saida, "w+")
inicio = file.readline()

# print(inicio.strip())

if inicio.strip() != "inicio:":
    raise Exception ("Erro: Arquivo selecionado invalido ou errado")


def formatar(linha):
    return linha.strip()


def atribuir_valor(Variavel=error, Valor=-1):

    global a
    global b

    print(Variavel)

    if Variavel == "A":
        a = Valor
        lista[0] = str(a)

    elif Variavel == "B":
        b = Valor
        lista[1] = str(b)


def pegar_valor(line):
    line = formatar(line)

    variavel = line[0]

    valor = line[2:len(line)-1]

    print(variavel, type(variavel))
    print(valor, type(valor))

    atribuir_valor(Variavel=variavel, Valor=valor)


def imprimir_saida(x):
    lista[2] = str(x)

    outfile.write(str(a))
    outfile.write(str(b))
    outfile.write(x)
    outfile.write("\n")
	
    dados = "".join(lista)
    dados = dados.encode()
	serial.write(dados)
	
    print(dados)


def valor_logico(line):
    print(formatar(line), end=" tem valor: ")
    if "um" in line:
        print("C")
        imprimir_saida("C")

    else:
        print(3)
        imprimir_saida("3")


def operacao_or(line, flag=False):

    if flag:
        print(1)  # codigo para or negada

    else:
        if "An" in line:
            print(8, end="\n")
            imprimir_saida("8")

        elif "Bn" in line:
            print("D", end="\n")
            imprimir_saida("D")

        else:
            print("E", end="\n")
            imprimir_saida("E")


def operacao_xor(line, flag=False):

    if flag:
        print(9)  # codigo para or negada
        imprimir_saida("9")

    else:
        print(6)
        imprimir_saida("6")


def operacao_and(line):

    if "An" in line:
        print(2, end="\n")
        imprimir_saida("2")

    elif "Bn" in line:
        print(7, end="\n")
        imprimir_saida("7")

    else:
        print("B", end="\n")
        imprimir_saida("B")


def operacao_a(line):

    if 'An' in line:
        print(0)
        imprimir_saida("0")

    else:
        print("F")
        imprimir_saida("F")


def operacao_b(line):

    if 'Bn' in line:
        print(5)
        imprimir_saida("5")

    else:
        print("A")
        imprimir_saida("A")



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
        imprimir_saida("4")

    elif "B" not in line:
        print(formatar(line), end=" tem valor: ")
        operacao_a(line)

    elif "A" not in line:
        print(formatar(line), end=" tem valor: ")
        operacao_b(line)

    else:
        print(formatar(line), end=" tem valor: ")
        operacao_and(line)


for x in file:

    # print(x)

    if "fim." in x:
        continue

    if '=' in x:

        print("Atribuir")
        pegar_valor(x)

    elif "L" in x:
        valor_logico(x)

    elif 'n' == x[0]:
        selecionar_operacao(x, True)

    else:
        selecionar_operacao(x)




file.close()
outfile.close()
print(a)
print(b)
