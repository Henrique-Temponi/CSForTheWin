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

String toBit (byte x){

  String resposta = "";
  
  '0' - '0'

  return resposta;
}

void ULA (byte op, byte a, byte b){

  switch (op)
  {
  case '0':

    ! 15
    ! '1'
    'F' & 'D';

    break;
    
  case '1':

    break;
    
  case '2':

    break;
    
  case '3':

    break;
    
  case '4':

    break;
    
  case '5':

    break;
    
  case '6':

    break;
    
  case '7':

    break;
    
  case '8':

    break;
    
  case '9':

    break;
    
  case 'A':

    break;
    
  case 'B':

    break;
    
  case 'C':

    break;
    
  case 'D':

    break;
    
  case 'E':

    break;
    
  case 'F':

    break;
  
  default:
    break;
  }
}

void loop()
{
  if (Serial.available() >  0){

    String dados = Serial.readString();

    byte a   = dados[0];
    byte b   = dados[1];
    byte op  = dados[2];

    ULA(op, a, b)

    Serial.flush();
  }

}


// int main()
// {
//   ohyeah yey(0, 1);

//   yey.printar();

//   return 0;
// }