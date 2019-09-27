int azul  = 10;
int verde = 11;
int amarelo = 12;
int vermelho = 13;

void setup()
{
  Serial.begin(9600);
  for (int i = azul; i <= vermelho; i++){
    pinMode(i,OUTPUT);
  } 
}

void toBit (char x){

  String resposta = "";
  
  

  return resposta;
}

void mostrar (char x ){
  
}

void ULA (char op, char a, char b){

  switch (op)
  {
  case '0':

    mostrar (~a);
    
    break;
    
  case '1':

    mostrar (~(a|b);
  
    break;
    
  case '2':

    mostrar ((~a)&b);

    break;
    
  case '3':

    mostrar ('0');

    break;
    
  case '4':

    mostrar (~(a&b));

    break;
    
  case '5':

    mostrar (~b);

    break;
    
  case '6':

    mostrar (a^b);

    break;
    
  case '7':

    mostrar (a&(~b));

    break;
    
  case '8':

    mostrar ((~a)|b);

    break;
    
  case '9':

    mostrar (~(a^b));

    break;
    
  case 'A':

    mostrar (b);

    break;
    
  case 'B':

    mostrar (a|b);

    break;
    
  case 'C':

    mostrar ('1');
    
    break;
    
  case 'D':

    mostrar (a|(~b));

    break;
    
  case 'E':

    mostrar (a|b);

    break;
    
  case 'F':

    mostrar (a);

    break;
  
  default:
    break;
  }
}

void loop()
{
  if (Serial.available() >  0){

    String dados = Serial.readString();

    char a   = dados[0];
    char b   = dados[1];
    char op  = dados[2];

    ULA(op, a, b)

    Serial.flush();
  }

}
