# fazer decodificador para o arduino usando python 
# primeiro ler um arquivo com as instrucoes de alto nivel e depois interpretar para o arduino
arquivo = "textoula.txt"
a = 0
b = 0
error = -1

def debugger (**args):
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

for x in file:

    if '=' in x:

        print("Atribuir")
        pegar_Valor(x)

        

    print(x)

print(a)
print(b)