char recebido[8];
unsigned Xatual=0,Yatual=0,Zatual=0;
unsigned Xtarget=0,Ytarget=0,Ztarget=0;
int X=1,Y=1,ZE=16;
short broca=0;

void Send(unsigned char* text)
{
     char buff[6];
     memset(buff,'\0',6);
     strncpy(buff,text,5);
     strncat(buff,"f",1);
     while (UART1_Tx_Idle() != 1) {
     }
     UART1_Write_Text(buff);
}

void protocol(char* prot)
{
     char tmp[4];
     //Pega os 4 bytes do numero
     strncpy(tmp,prot,4);

     if(prot[4]=='X')
     {
         Xtarget = atoi(tmp);
     }
     else if(prot[4]=='Y')
     {
         Ytarget = atoi(tmp);
     }
     else if(prot[4]=='Z')
     {
         Ztarget = atoi(tmp);
     }
     else if(prot[4]=='B')
     {
         broca = atoi(tmp);
     }
}

void main()
{
    char proc[5];
    TRISB = 0;
    TRISD = 0;
    PORTB = 0;
    PORTD = 0;
    Xatual = 0;Yatual = 0;Zatual = 0;
    Xtarget = 0;Ytarget = 0;Ztarget = 0;
    X = 1;Y = 1;ZE = 16;
    broca = 0;

    UART1_init(9600);// Initialize UART module at 9600 bps
    Delay_ms(100);
    Send("Ready");
    while (1)
    {
       if (UART1_Data_Ready())
       {
         memset(recebido,'\0',8);
         UART1_Read_Text(recebido,"f",8);
         Send(recebido);
         if(!strcmp(recebido,"OK"))
         {
             protocol(proc);
         }
         else if(strlen(recebido)==5)
         {
             strcpy(proc,recebido);
         }
       }
       if(Xatual>Xtarget)
       {
          Xatual--;
          X = (X==1)?8:X/2;
       }
       else if(Xatual<Xtarget)
       {
          Xatual++;
          X = (X==8)?1:X*2;
       }

       if(Zatual>Ztarget)
       {
          Zatual--;
          ZE = (ZE==16)?128:ZE/2;
       }
       else if(Zatual<Ztarget)
       {
          Zatual++;
          ZE = (ZE==128)?16:ZE*2;
       }

       if(Yatual>Ytarget)
       {
          Yatual--;
          Y = (Y==8)?1:Y*2;
       }
       else if(Yatual<Ytarget)
       {
          ++Yatual;
          Y = (Y==1)?8:Y/2;
       }

       PORTB = X + ZE;
       PORTD = broca * 16 + Y;
       Delay_ms(5);
    }
}
