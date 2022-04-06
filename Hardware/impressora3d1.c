char recebido[8];
char sendXYZ[3],lastXYZ[3];
unsigned Xatual,Yatual,Zatual;
unsigned Xtarget,Ytarget,Ztarget;
short X,Y,ZE;
short broca;

void main()
{
    char tmp2[10];
    char* XYZ = &sendXYZ;
    TRISB = 0;
    TRISD = 0;
    PORTB = 0;
    PORTD = 0;
    Xatual = 0;Yatual = 0;Zatual = 0;
    Xtarget = 0;Ytarget = 0;Ztarget = 0;
    X = 0;Y = 0;ZE = 0;
    memset(sendXYZ,'\0',3);
    memset(lastXYZ,'\0',3);

    //agora tem isso.. vai saber...
    ADCON1 |= 0x0F;// Configure AN pins as digital

    Delay_ms(100);
    while (1)
    {
       PORTB = 17;
       PORTD = 17;
       Delay_ms(50);
       PORTB = 34;
       PORTD = 18;
       Delay_ms(50);
       PORTB = 68;
       PORTD = 20;
       Delay_ms(50);
       PORTB = 136;
       PORTD = 24;
       Delay_ms(50);
    }
}
