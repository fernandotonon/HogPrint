/**
*  Feito por: Fernando Tonon de Rossi
*  OBS: Esse header gera 1717 words (no modo de controlar todas as datas "não definido _ONLY_uSEG")
* 62 words de código de programa em modo de controlar apenas os us, então, quem for utilizar
* esse código deve tomar cuidado para não ultrapassar o limite de words do mcu.
**/

#ifndef _UTIME_H
#define _UTIME_H

//#define _ONLY_uSEG 1 //Define se vai controlar todo o tempo, ou apenas os us adicionados
//
//#ifndef _ONLY_uSEG
///// Struct dos canais
//struct utime
//{
//    unsigned short useg; /// micro segundo [0-999]
//    unsigned short mseg; /// mili segundo [0-999]
//    unsigned short seg;  /// segundo [0-59]
//    unsigned short min;  /// minuto [0-59]
//    unsigned short hora; /// hora [0-23]
//    unsigned short dia;  /// dia [1-31]
//    unsigned short mes;  /// mes [1-12]
//    unsigned int ano;    /// ano [0-65536] Default:2009
//}utime={0,0,0,0,0,1,1,2009};/// Seta os valores iniciais
//
//long added_useg=0; //Quantos micro segundos foram adicionados. PS: Demora 1h20 pra dar overflow
//
///// Adiciona os anos
//void add_ano(unsigned short _ano)
//{
//    utime.ano+=_ano;// Soma o novo ano.
//}
//
///// Adiciona os meses
//void add_mes(unsigned short _mes)
//{
//    if(utime.mes+_mes<13) // Se o tempo atual somado ao tempo novo não utrapassar 12
//    {
//        utime.mes+=_mes;// Soma o novo tempo.
//    }
//    else
//    {
//        add_ano((unsigned short)_mes/13); // Aumenta os anos de acordo com a quantia que tiver a mais
//        utime.mes=_mes-(((unsigned short)_mes/13)*13); // Atribui o resto dos meses
//    }
//}
//
///// Adiciona os dias
//void add_dia(unsigned short _dia)
//{
//    if(utime.mes==1||utime.mes==3||utime.mes==5||utime.mes==7||utime.mes==9||utime.mes==11) //se for um dos meses de 31 dias
//    {
//        if(utime.dia+_dia<31) // Se o tempo atual somado ao tempo novo não utrapassar 31
//        {
//            utime.dia+=_dia;// Soma o novo tempo.
//        }
//        else
//        {
//            add_mes((unsigned short)_dia/31); // Aumenta os meses de acordo com a quantia que tiver a mais
//            utime.dia=_dia-(((unsigned short)_dia/31)*31); // Atribui o resto dos dias
//        }
//    }
//    else if(utime.mes==4||utime.mes==6||utime.mes==8||utime.mes==10||utime.mes==12) //se for um dos meses de 30 dias
//    {
//        if(utime.dia+_dia<30) // Se o tempo atual somado ao tempo novo não utrapassar 23
//        {
//            utime.dia+=_dia;// Soma o novo tempo.
//        }
//        else
//        {
//            add_mes((unsigned short)_dia/30); // Aumenta as horas de acordo com a quantia que tiver a mais
//            utime.dia=_dia-(((unsigned short)_dia/30)*30); // Atribui o resto dos minutos
//        }
//    }
//    else if(utime.mes==2) //se for fevereiro
//    {
//        if(utime.ano%100>0) //se o ano num terminar em 00
//        {
//            if(utime.ano%4>0) //Se num for bissexto
//            {
//                if(utime.dia+_dia<28) // Se o tempo atual somado ao tempo novo não utrapassar 28
//                {
//                    utime.dia+=_dia;// Soma o novo tempo.
//                }
//                else
//                {
//                    add_mes((unsigned short)_dia/28); // Aumenta os meses de acordo com a quantia que tiver a mais
//                    utime.dia=_dia-(((unsigned short)_dia/28)*28); // Atribui o resto dos dias
//                }
//            }
//            else
//            {
//                if(utime.dia+_dia<29) // Se o tempo atual somado ao tempo novo não utrapassar 29
//                {
//                    utime.dia+=_dia;// Soma o novo tempo.
//                }
//                else
//                {
//                    add_mes((unsigned short)_dia/29); // Aumenta os meses de acordo com a quantia que tiver a mais
//                    utime.dia=_dia-(((unsigned short)_dia/29)*29); // Atribui o resto dos dias
//                }
//            }
//        }
//        else
//        {
//            if(utime.ano%400>0) //Se num for bissexto
//            {
//                if(utime.dia+_dia<28) // Se o tempo atual somado ao tempo novo não utrapassar 28
//                {
//                    utime.dia+=_dia;// Soma o novo tempo.
//                }
//                else
//                {
//                    add_mes((unsigned short)_dia/28); // Aumenta os meses de acordo com a quantia que tiver a mais
//                    utime.dia=_dia-(((unsigned short)_dia/28)*28); // Atribui o resto dos dias
//                }
//            }
//            else
//            {
//                if(utime.dia+_dia<29) // Se o tempo atual somado ao tempo novo não utrapassar 29
//                {
//                    utime.dia+=_dia;// Soma o novo tempo.
//                }
//                else
//                {
//                    add_mes((unsigned short)_dia/29); // Aumenta os meses de acordo com a quantia que tiver a mais
//                    utime.dia=_dia-(((unsigned short)_dia/29)*29); // Atribui o resto dos dias
//                }
//            }
//        }
//    }
//}
//
///// Adiciona as horas
//void add_hora(unsigned short _hora)
//{
//    if(utime.hora+_hora<24) // Se o tempo atual somado ao tempo novo não utrapassar 23
//    {
//        utime.hora+=_hora;// Soma o novo tempo.
//    }
//    else
//    {
//        add_dia((unsigned short)_hora/24); // Aumenta os dias de acordo com a quantia que tiver a mais
//        utime.hora=_hora-(((unsigned short)_hora/24)*24); // Atribui o resto das horas
//    }
//}
//
///// Adiciona os minutos
//void add_min(unsigned short _min)
//{
//    if(utime.min+_min<60) // Se o tempo atual somado ao tempo novo não utrapassar 59
//    {
//        utime.min+=_min;// Soma o novo tempo.
//    }
//    else
//    {
//        add_hora((unsigned short)_min/60); // Aumenta as horas de acordo com a quantia que tiver a mais
//        utime.min=_min-(((unsigned short)_min/60)*60); // Atribui o resto dos minutos
//    }
//}
//
///// Adiciona os segundos
//void add_seg(unsigned short _seg)
//{
//    if(utime.seg+_seg<60) // Se o tempo atual somado ao tempo novo não utrapassar 59
//    {
//        utime.seg+=_seg;// Soma o novo tempo.
//    }
//    else
//    {
//        add_min((unsigned short)_seg/60); // Aumenta os minutos de acordo com a quantia que tiver a mais
//        utime.seg=_seg-(((unsigned short)_seg/60)*60); // Atribui o resto dos segundos
//    }
//}
//
///// Adiciona os mili segundos
//void add_mseg(unsigned short _mseg)
//{
//    if(utime.mseg+_mseg<1000) // Se o tempo atual somado ao tempo novo não utrapassar 999
//    {
//        utime.mseg+=_mseg;// Soma o novo tempo.
//    }
//    else
//    {
//        add_seg((unsigned short)_mseg/1000); // Aumenta os segundos de acordo com a quantia que tiver a mais
//        utime.mseg=_mseg-(((unsigned short)_mseg/1000)*1000); // Atribui o resto dos mili segundos
//    }
//}
//
///// Adiciona os micro segundos
//void add_useg(unsigned short _useg)
//{
//    if(utime.useg+_useg<1000) // Se o tempo atual somado ao tempo novo não utrapassar 999
//    {
//        utime.useg+=_useg;// Soma o novo tempo.
//    }
//    else
//    {
//        add_mseg((unsigned short)_useg/1000); // Aumenta os mili segundos de acordo com a quantia que tiver a mais
//        utime.useg=_useg-(((unsigned short)_useg/1000)*1000); // Atribui o resto dos micro segundos
//    }
//    added_useg+=_useg; //Adicionar no valor de added_useg
//}
//
///// Retorna quantos micro segundos foram adicionados pela função add_useg()
//long get_added_useg()
//{
//    return added_useg;
//}
//
//#else

long added_useg=0; //Quantos micro segundos foram adicionados. PS: Demora 1h20 pra dar overflow

/// Adiciona os micro segundos
void add_useg(unsigned short _useg)
{
    added_useg+=_useg; //Adicionar no valor de added_useg
}

/// Retorna quantos micro segundos foram adicionados pela função add_useg()
long get_added_useg()
{
    return added_useg;
}
//#endif
#endif
