int azul  = 10;
int verde = 11;
int amarelo = 12;
int vermelho = 13;

void inicializar (){
  digitalWrite(azul, 1);
  digitalWrite(verde, 1);
  digitalWrite(amarelo, 1);
  digitalWrite(vermelho, 1);
  delay(1000);
  digitalWrite(azul, 0);
  digitalWrite(verde, 0);
  digitalWrite(amarelo, 0);
  digitalWrite(vermelho, 0);
  delay(1000);
}


void setup()
{
  Serial.begin(9600);
  pinMode(azul, OUTPUT);
  pinMode(verde, OUTPUT);
  pinMode(amarelo, OUTPUT);
  pinMode(vermelho, OUTPUT);
  inicializar();
}

String toBit (char x){

  String resposta = "";

  switch(x){

    case '0':
      resposta = "0000";
    break;
    case '1':
      resposta = "0001";
    break;
    case '2':
      resposta = "0010";
    break;
    case '3':
      resposta = "0011";
    break;
    case '4':
      resposta = "0100";
    break;
    case '5':
      resposta = "0101";
    break;
    case '6':
      resposta = "0110";
    break;
    case '7':
      resposta = "0111";
    break;
    case '8':
      resposta = "1000";
    break;
    case '9':
      resposta = "1001";
    break;
    case 'A':
      resposta = "1010";
    break;
    case 'B':
      resposta = "1011";
    break;
    case 'C':
      resposta = "1100";
    break;
    case 'D':
      resposta = "1101";
    break;
    case 'E':
      resposta = "1110";
    break;
    case 'F':
      resposta = "1111";
    break;
  }

  return resposta;
}

void mandarValores (String dado){
  
  digitalWrite(vermelho, (dado[0] == '1'));
  digitalWrite(amarelo, (dado[1] == '1'));
  digitalWrite(verde, (dado[2] == '1'));
  digitalWrite(azul, (dado[3] == '1'));
}


void mostrar (char x){

  Serial.print("Char no mostrar: ");
  Serial.println(x);

  String dado = toBit (x);

  
  Serial.print("depois to toBit: ");
  Serial.println(dado);

  int tam = dado.length();

  
  Serial.print("tamanho depois do tobit: ");
  Serial.println(tam);

  mandarValores(dado);
}

String negar(String x){

  int tam = x.length();

  for (int y = 0; y < tam; y++){

    Serial.println(x);
    
    if(x[y] == '1'){
      x[y] = '0';
    }
    else if (x[y] == '0'){
      x[y] = '1';
    }
  }

  Serial.println(x);
  
  return x;
}

String operacaoes (int x, String a, String b){

  String resposta = "";

  switch(x){

    case 1:
    //AND
      for (int x = 0; x < 4; x++){
        if ( a[x] == '1' && b[x] == '1'){
          resposta = resposta + "1";
        }
        else{
          resposta = resposta + "0";
        }
      }
    break;
    case 2:
    //OR
      for (int x = 0; x < 4; x++){
        if ( a[x] == '1' || b[x] == '1'){
          resposta = resposta + "1";
        }
        else{
          resposta = resposta + "0";
        }
      }
    break;
    case 3:
    //XOR
    for (int x = 0; x < 4; x++){
        if (a[x] != b[x]){
          resposta = resposta + "1";
        }
        else{
          resposta = resposta + "0";
        }
      }
    break;
  }
  return resposta;
}

void ULA (char op, String a, String b){

  switch (op)
  {
  case '0':
    mandarValores(negar(a));  
    break;
    
  case '1':
    
      mandarValores(negar(operacaoes(2,a,b)));
//    mostrar (~(a|b));
    
    break;
    
  case '2':

    mandarValores(operacaoes(1,negar(a),b));
//    mostrar ((~a)&b);

    break;
    
  case '3':

    mostrar ('0');

    break;
    
  case '4':
    mandarValores(negar(operacaoes(1,a,b)));
//    mostrar (~(a&b));

    break;
    
  case '5':

    mandarValores(negar(b));  

    break;
    
  case '6':
    mandarValores(operacaoes(3,a,b));
//    mostrar (a^b);

    break;
    
  case '7':

    mandarValores(operacaoes(1,a,negar(b)));
//    mostrar (a&(~b));

    break;
    
  case '8':
    mandarValores(operacaoes(2,negar(a),b));
//    mostrar ((~a)|b);

    break;
    
  case '9':
    mandarValores(negar(operacaoes(3,a,b)));
//    mostrar (~(a^b));

    break;
    
  case 'A':

    mandarValores (b);

    break;
    
  case 'B':
    mandarValores(operacaoes(2,a,b));
//    mostrar (a|b);

    break;
    
  case 'C':

    mostrar ('F');
    
    break;
    
  case 'D':
    mandarValores(operacaoes(2,a,negar(b)));
//    mostrar (a|(~b));

    break;
    
  case 'E':
    mandarValores(operacaoes(2,a,b));
//    mostrar (a|b);

    break;
    
  case 'F':
    
    mandarValores (a);

    break;
  
  default:
    break;
  }
}

void loop()
{
  if (Serial.available() >  0){

    String dados = Serial.readString();
    Serial.println(dados);

    String a = toBit(dados[0]);
    String b = toBit(dados[1]);
    char op  = dados[2];

    Serial.print("a: ");
    Serial.println(a);
    Serial.print("b: ");
    Serial.println(b);
    Serial.print("op: ");
    Serial.println(op);

    ULA(op, a, b);

    Serial.flush();
  }

}
