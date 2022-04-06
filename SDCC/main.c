#include <pic16/pic18f452.h>

/// Configurações do pic
//typedef unsigned int config;
//config at 0x2007 __CONFIG = _HS_OSC & _PWRTE_ON & _BODEN_OFF & _WDT_OFF & _LVP_OFF;

/// Struct dos canais
struct
{
    long pulse_interval; /// Intervalo entre os pulsos em us
    long initial; /// Delay inicial pra ativar a porta em us
    long time; /// Tempo do pulso em us
    long timeup; /// Tempo der  subida e descida do pulso em us
    long T; /// Periodo em us
    long timetotal; /// Periodo total do pulso
    long currTime; /// Tempo atual
    int started;
}channel[4];

short c_c[8];
int c_total;

int c; /// Variável pra controle de loops


///@    Quantos períodos passaram dentro do tempo do canal
int NPeriodosPassadosNoCanal[4];

/// Subida
void up(int _channel)
{
    long timeInT = channel[_channel].currTime-(((int)(channel[_channel].currTime / channel[_channel].T))*channel[_channel].T);
    float perTimeUP = (float)channel[_channel].currTime/(float)channel[_channel].timeup;
    if (timeInT<=perTimeUP*channel[_channel].T/2) /// Se o tempo que passou dentro do período for menor q a metade do tempo que é pra ficar on
    {
        c_c[_channel*2] = 1;
        c_c[_channel*2+1] = 0;
    }
    else if (timeInT<=perTimeUP*channel[_channel].T) /// Se for a outra metade
    {
        c_c[_channel*2] = 0;
        c_c[_channel*2+1] = 1;
    }
}

/// Controle do tempo On do canal
void top(int _channel)
{
    ///@    Quantos períodos passaram dentro do tempo do canal
    NPeriodosPassadosNoCanal[_channel] = (long)(channel[_channel].currTime / (channel[_channel].T / 2));

    /// Enquanto está no tempo de subida do canal
    if (NPeriodosPassadosNoCanal[_channel]%2) /// Se o tempo que passou dentro do período for menor q a metade do tempo que é pra ficar on
    {
        c_c[_channel*2] = 0;
        c_c[_channel*2+1] = 1;
    }
    else /// Se for a outra metade
    {
        c_c[_channel*2] = 1;
        c_c[_channel*2+1] = 0;
    }
}

/// Descida
void down(int _channel)
{
    long TD = channel[_channel].currTime-channel[_channel].timeup-channel[_channel].time;
    long timeInT = TD-(((int)(TD / channel[_channel].T))*channel[_channel].T);
    float perTimeUP = (float)TD/(float)channel[_channel].timeup;
    if (timeInT<=(1-perTimeUP)*channel[_channel].T/2) /// Se o tempo que passou dentro do período for menor q a metade do tempo que é pra ficar on
    {
        c_c[_channel*2] = 1;
        c_c[_channel*2+1] = 0;
    }
    else if (timeInT<=(1-perTimeUP)*channel[_channel].T) /// Se for a outra metade
    {
        c_c[_channel*2] = 0;
        c_c[_channel*2+1] = 1;
    }
}


void control()
{
int control_c=0; /// Variável pra controle de loops
    for (control_c=0; control_c<4; control_c++)
    {
        if (channel[control_c].started>0) /// Se já passou do delay inicial do canal
        {
            if (channel[control_c].currTime<channel[control_c].timeup) ///Se está no tempo de subida do canal
            {
                up(control_c);
            }
            else if (channel[control_c].currTime<channel[control_c].timeup+channel[control_c].time) ///Se está no tempo de subida do canal
            {
                top(control_c);
            }
            else if (channel[control_c].currTime<channel[control_c].timeup+channel[control_c].time+channel[control_c].timeup) ///Se está no tempo de subida do canal
            {
                down(control_c);
            }
           else /// Se ta no tempo do intervalo
           {
                c_c[control_c*2]=0;
                c_c[control_c*2+1]=0;
           }
        }
    }
}

/// Principal
void main()
{
    /// Seta a porta C como saída
    TRISC = 0;

    /// Inicia as portas
    PORTC = 0;

    /// Configura as frequencias
    channel[0].T = 10;
    channel[1].T = 10;
    channel[2].T = 14;
    channel[3].T = 50;

    /// Configura os intervalos
    channel[0].pulse_interval = 100;
    channel[1].pulse_interval = 100;
    channel[2].pulse_interval = 100;
    channel[3].pulse_interval = 110;

    /// Configura os delays
    channel[0].initial = 0;
    channel[1].initial = 100;
    channel[2].initial = 200;
    channel[3].initial = 300;

    /// Configura os tempos de duração do pulso
    channel[0].time = 1000;
    channel[1].time = 1000;
    channel[2].time = 2000;
    channel[3].time = 1500;

    /// Configura os tempos da subida e descida do pulso
    channel[0].timeup = 100;
    channel[1].timeup = 100;
    channel[2].timeup = 500;
    channel[3].timeup = 600;

    /// Configura os tempos totais
    for (c=0;c<4;c++)
    {
        channel[c].timetotal = channel[c].timeup *2 + channel[c].time + channel[c].pulse_interval;
        channel[c].started = 0;
        channel[c].currTime = 0;
    }

    //T1CONbits.TMR1ON = 1; // liga o timer1
    //T1CONbits.TMR1CS = 0; // seta o clock = osc/4
    //T1CKPS1 = 1; // prescale 1:4
    /// Configura os tempos de estimulação
    while (1)
    {
        for (c=0;c<8;c++)
            c_c[c] = 0;

        c_total = 0;

        control();

        c_total = c_c[0];
        c_total += c_c[1]*2;
        c_total += c_c[2]*4;
        c_total += c_c[3]*8;
        c_total += c_c[4]*16;
        c_total += c_c[5]*32;
        c_total += c_c[6]*64;
        c_total += c_c[7]*128;

        PORTC = c_total;

        /// Controle de Tempo
        //add_useg(((unsigned short) TMR1H*51+TMR1L/5)); //Cada TMR1H demora 51 us e cada TMR1L demora 0.2 us com clock de 20MHz em um PIC16f876a de acordo com o PIC Simulator IDE
        for (c=0;c<4;c++)
            channel[c].currTime++;
        //TMR1H=0;
        //TMR1L=TMR1L%5; //TMR1L recebe o resto que num foi adicionado

        for (c=0;c<4;c++)
        {
            if(channel[c].started==0)
            {
                if(channel[c].currTime>channel[c].initial)
                {
                    channel[c].started = 1;
                    channel[c].currTime-=channel[c].started;
                }
            }
            else if(channel[c].currTime>channel[c].timetotal)
            {
                channel[c].currTime-=channel[c].timetotal;
            }
        }
    }
}
