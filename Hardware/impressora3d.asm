
_Send:
;impressora3d.c,7 :: 		void Send(unsigned char* text)
;impressora3d.c,10 :: 		memset(buff,'\0',6);
	MOVLW       Send_buff_L0+0
	MOVWF       FARG_memset_p1+0 
	MOVLW       hi_addr(Send_buff_L0+0
	MOVWF       FARG_memset_p1+1 
	CLRF        FARG_memset_character+0 
	MOVLW       6
	MOVWF       FARG_memset_n+0 
	MOVLW       0
	MOVWF       FARG_memset_n+1 
	CALL        _memset+0, 0
;impressora3d.c,11 :: 		strncpy(buff,text,5);
	MOVLW       Send_buff_L0+0
	MOVWF       FARG_strncpy_to+0 
	MOVLW       hi_addr(Send_buff_L0+0
	MOVWF       FARG_strncpy_to+1 
	MOVF        FARG_Send_text+0, 0 
	MOVWF       FARG_strncpy_from+0 
	MOVF        FARG_Send_text+1, 0 
	MOVWF       FARG_strncpy_from+1 
	MOVLW       5
	MOVWF       FARG_strncpy_size+0 
	MOVLW       0
	MOVWF       FARG_strncpy_size+1 
	CALL        _strncpy+0, 0
;impressora3d.c,12 :: 		strncat(buff,"f",1);
	MOVLW       Send_buff_L0+0
	MOVWF       FARG_strncat_to+0 
	MOVLW       hi_addr(Send_buff_L0+0
	MOVWF       FARG_strncat_to+1 
	MOVLW       ?lstr1_impressora3d+0
	MOVWF       FARG_strncat_from+0 
	MOVLW       hi_addr(?lstr1_impressora3d+0
	MOVWF       FARG_strncat_from+1 
	MOVLW       1
	MOVWF       FARG_strncat_size+0 
	MOVLW       0
	MOVWF       FARG_strncat_size+1 
	CALL        _strncat+0, 0
;impressora3d.c,13 :: 		while (UART1_Tx_Idle() != 1) {
L_Send0:
	CALL        _UART1_Tx_Idle+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_Send1
;impressora3d.c,14 :: 		}
	GOTO        L_Send0
L_Send1:
;impressora3d.c,15 :: 		UART1_Write_Text(buff);
	MOVLW       Send_buff_L0+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(Send_buff_L0+0
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;impressora3d.c,16 :: 		}
	RETURN      0
; end of _Send

_protocol:
;impressora3d.c,18 :: 		void protocol(char* prot)
;impressora3d.c,22 :: 		strncpy(tmp,prot,4);
	MOVLW       protocol_tmp_L0+0
	MOVWF       FARG_strncpy_to+0 
	MOVLW       hi_addr(protocol_tmp_L0+0
	MOVWF       FARG_strncpy_to+1 
	MOVF        FARG_protocol_prot+0, 0 
	MOVWF       FARG_strncpy_from+0 
	MOVF        FARG_protocol_prot+1, 0 
	MOVWF       FARG_strncpy_from+1 
	MOVLW       4
	MOVWF       FARG_strncpy_size+0 
	MOVLW       0
	MOVWF       FARG_strncpy_size+1 
	CALL        _strncpy+0, 0
;impressora3d.c,24 :: 		if(prot[4]=='X')
	MOVLW       4
	ADDWF       FARG_protocol_prot+0, 0 
	MOVWF       FSR0L 
	MOVLW       0
	ADDWFC      FARG_protocol_prot+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	XORLW       88
	BTFSS       STATUS+0, 2 
	GOTO        L_protocol2
;impressora3d.c,26 :: 		Xtarget = atoi(tmp);
	MOVLW       protocol_tmp_L0+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(protocol_tmp_L0+0
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
	MOVF        R0, 0 
	MOVWF       _Xtarget+0 
	MOVF        R1, 0 
	MOVWF       _Xtarget+1 
;impressora3d.c,27 :: 		}
	GOTO        L_protocol3
L_protocol2:
;impressora3d.c,28 :: 		else if(prot[4]=='Y')
	MOVLW       4
	ADDWF       FARG_protocol_prot+0, 0 
	MOVWF       FSR0L 
	MOVLW       0
	ADDWFC      FARG_protocol_prot+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	XORLW       89
	BTFSS       STATUS+0, 2 
	GOTO        L_protocol4
;impressora3d.c,30 :: 		Ytarget = atoi(tmp);
	MOVLW       protocol_tmp_L0+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(protocol_tmp_L0+0
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
	MOVF        R0, 0 
	MOVWF       _Ytarget+0 
	MOVF        R1, 0 
	MOVWF       _Ytarget+1 
;impressora3d.c,31 :: 		}
	GOTO        L_protocol5
L_protocol4:
;impressora3d.c,32 :: 		else if(prot[4]=='Z')
	MOVLW       4
	ADDWF       FARG_protocol_prot+0, 0 
	MOVWF       FSR0L 
	MOVLW       0
	ADDWFC      FARG_protocol_prot+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	XORLW       90
	BTFSS       STATUS+0, 2 
	GOTO        L_protocol6
;impressora3d.c,34 :: 		Ztarget = atoi(tmp);
	MOVLW       protocol_tmp_L0+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(protocol_tmp_L0+0
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
	MOVF        R0, 0 
	MOVWF       _Ztarget+0 
	MOVF        R1, 0 
	MOVWF       _Ztarget+1 
;impressora3d.c,35 :: 		}
	GOTO        L_protocol7
L_protocol6:
;impressora3d.c,36 :: 		else if(prot[4]=='B')
	MOVLW       4
	ADDWF       FARG_protocol_prot+0, 0 
	MOVWF       FSR0L 
	MOVLW       0
	ADDWFC      FARG_protocol_prot+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	XORLW       66
	BTFSS       STATUS+0, 2 
	GOTO        L_protocol8
;impressora3d.c,38 :: 		broca = atoi(tmp);
	MOVLW       protocol_tmp_L0+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(protocol_tmp_L0+0
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
	MOVF        R0, 0 
	MOVWF       _broca+0 
;impressora3d.c,39 :: 		}
L_protocol8:
L_protocol7:
L_protocol5:
L_protocol3:
;impressora3d.c,40 :: 		}
	RETURN      0
; end of _protocol

_main:
;impressora3d.c,42 :: 		void main()
;impressora3d.c,45 :: 		TRISB = 0;
	CLRF        TRISB+0 
;impressora3d.c,46 :: 		TRISD = 0;
	CLRF        TRISD+0 
;impressora3d.c,47 :: 		PORTB = 0;
	CLRF        PORTB+0 
;impressora3d.c,48 :: 		PORTD = 0;
	CLRF        PORTD+0 
;impressora3d.c,49 :: 		Xatual = 0;Yatual = 0;Zatual = 0;
	CLRF        _Xatual+0 
	CLRF        _Xatual+1 
	CLRF        _Yatual+0 
	CLRF        _Yatual+1 
	CLRF        _Zatual+0 
	CLRF        _Zatual+1 
;impressora3d.c,50 :: 		Xtarget = 0;Ytarget = 0;Ztarget = 0;
	CLRF        _Xtarget+0 
	CLRF        _Xtarget+1 
	CLRF        _Ytarget+0 
	CLRF        _Ytarget+1 
	CLRF        _Ztarget+0 
	CLRF        _Ztarget+1 
;impressora3d.c,51 :: 		X = 1;Y = 1;ZE = 16;
	MOVLW       1
	MOVWF       _X+0 
	MOVLW       0
	MOVWF       _X+1 
	MOVLW       1
	MOVWF       _Y+0 
	MOVLW       0
	MOVWF       _Y+1 
	MOVLW       16
	MOVWF       _ZE+0 
	MOVLW       0
	MOVWF       _ZE+1 
;impressora3d.c,52 :: 		broca = 0;
	CLRF        _broca+0 
;impressora3d.c,54 :: 		UART1_init(9600);// Initialize UART module at 9600 bps
	MOVLW       129
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;impressora3d.c,55 :: 		Delay_ms(100);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main9:
	DECFSZ      R13, 1, 0
	BRA         L_main9
	DECFSZ      R12, 1, 0
	BRA         L_main9
	DECFSZ      R11, 1, 0
	BRA         L_main9
	NOP
	NOP
;impressora3d.c,56 :: 		Send("Ready");
	MOVLW       ?lstr2_impressora3d+0
	MOVWF       FARG_Send_text+0 
	MOVLW       hi_addr(?lstr2_impressora3d+0
	MOVWF       FARG_Send_text+1 
	CALL        _Send+0, 0
;impressora3d.c,57 :: 		while (1)
L_main10:
;impressora3d.c,59 :: 		if (UART1_Data_Ready())
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main12
;impressora3d.c,61 :: 		memset(recebido,'\0',8);
	MOVLW       _recebido+0
	MOVWF       FARG_memset_p1+0 
	MOVLW       hi_addr(_recebido+0
	MOVWF       FARG_memset_p1+1 
	CLRF        FARG_memset_character+0 
	MOVLW       8
	MOVWF       FARG_memset_n+0 
	MOVLW       0
	MOVWF       FARG_memset_n+1 
	CALL        _memset+0, 0
;impressora3d.c,62 :: 		UART1_Read_Text(recebido,"f",8);
	MOVLW       _recebido+0
	MOVWF       FARG_UART1_Read_Text_Output+0 
	MOVLW       hi_addr(_recebido+0
	MOVWF       FARG_UART1_Read_Text_Output+1 
	MOVLW       ?lstr3_impressora3d+0
	MOVWF       FARG_UART1_Read_Text_Delimiter+0 
	MOVLW       hi_addr(?lstr3_impressora3d+0
	MOVWF       FARG_UART1_Read_Text_Delimiter+1 
	MOVLW       8
	MOVWF       FARG_UART1_Read_Text_Attempts+0 
	CALL        _UART1_Read_Text+0, 0
;impressora3d.c,63 :: 		Send(recebido);
	MOVLW       _recebido+0
	MOVWF       FARG_Send_text+0 
	MOVLW       hi_addr(_recebido+0
	MOVWF       FARG_Send_text+1 
	CALL        _Send+0, 0
;impressora3d.c,64 :: 		if(!strcmp(recebido,"OK"))
	MOVLW       _recebido+0
	MOVWF       FARG_strcmp_s1+0 
	MOVLW       hi_addr(_recebido+0
	MOVWF       FARG_strcmp_s1+1 
	MOVLW       ?lstr4_impressora3d+0
	MOVWF       FARG_strcmp_s2+0 
	MOVLW       hi_addr(?lstr4_impressora3d+0
	MOVWF       FARG_strcmp_s2+1 
	CALL        _strcmp+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_main13
;impressora3d.c,66 :: 		protocol(proc);
	MOVLW       main_proc_L0+0
	MOVWF       FARG_protocol_prot+0 
	MOVLW       hi_addr(main_proc_L0+0
	MOVWF       FARG_protocol_prot+1 
	CALL        _protocol+0, 0
;impressora3d.c,67 :: 		}
	GOTO        L_main14
L_main13:
;impressora3d.c,68 :: 		else if(strlen(recebido)==5)
	MOVLW       _recebido+0
	MOVWF       FARG_strlen_s+0 
	MOVLW       hi_addr(_recebido+0
	MOVWF       FARG_strlen_s+1 
	CALL        _strlen+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main38
	MOVLW       5
	XORWF       R0, 0 
L__main38:
	BTFSS       STATUS+0, 2 
	GOTO        L_main15
;impressora3d.c,70 :: 		strcpy(proc,recebido);
	MOVLW       main_proc_L0+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(main_proc_L0+0
	MOVWF       FARG_strcpy_to+1 
	MOVLW       _recebido+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(_recebido+0
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;impressora3d.c,71 :: 		}
L_main15:
L_main14:
;impressora3d.c,72 :: 		}
L_main12:
;impressora3d.c,73 :: 		if(Xatual>Xtarget)
	MOVF        _Xatual+1, 0 
	SUBWF       _Xtarget+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main39
	MOVF        _Xatual+0, 0 
	SUBWF       _Xtarget+0, 0 
L__main39:
	BTFSC       STATUS+0, 0 
	GOTO        L_main16
;impressora3d.c,75 :: 		Xatual--;
	MOVLW       1
	SUBWF       _Xatual+0, 1 
	MOVLW       0
	SUBWFB      _Xatual+1, 1 
;impressora3d.c,76 :: 		X = (X==1)?8:X/2;
	MOVLW       0
	XORWF       _X+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main40
	MOVLW       1
	XORWF       _X+0, 0 
L__main40:
	BTFSS       STATUS+0, 2 
	GOTO        L_main17
	MOVLW       8
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	GOTO        L_main18
L_main17:
	MOVF        _X+0, 0 
	MOVWF       R0 
	MOVF        _X+1, 0 
	MOVWF       R1 
	RRCF        R1, 1 
	RRCF        R0, 1 
	BCF         R1, 7 
	BTFSC       R1, 6 
	BSF         R1, 7 
	MOVF        R0, 0 
	MOVWF       R3 
	MOVF        R1, 0 
	MOVWF       R4 
L_main18:
	MOVF        R3, 0 
	MOVWF       _X+0 
	MOVF        R4, 0 
	MOVWF       _X+1 
;impressora3d.c,77 :: 		}
	GOTO        L_main19
L_main16:
;impressora3d.c,78 :: 		else if(Xatual<Xtarget)
	MOVF        _Xtarget+1, 0 
	SUBWF       _Xatual+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main41
	MOVF        _Xtarget+0, 0 
	SUBWF       _Xatual+0, 0 
L__main41:
	BTFSC       STATUS+0, 0 
	GOTO        L_main20
;impressora3d.c,80 :: 		Xatual++;
	INFSNZ      _Xatual+0, 1 
	INCF        _Xatual+1, 1 
;impressora3d.c,81 :: 		X = (X==8)?1:X*2;
	MOVLW       0
	XORWF       _X+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main42
	MOVLW       8
	XORWF       _X+0, 0 
L__main42:
	BTFSS       STATUS+0, 2 
	GOTO        L_main21
	MOVLW       1
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	GOTO        L_main22
L_main21:
	MOVF        _X+0, 0 
	MOVWF       R0 
	MOVF        _X+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVF        R0, 0 
	MOVWF       R3 
	MOVF        R1, 0 
	MOVWF       R4 
L_main22:
	MOVF        R3, 0 
	MOVWF       _X+0 
	MOVF        R4, 0 
	MOVWF       _X+1 
;impressora3d.c,82 :: 		}
L_main20:
L_main19:
;impressora3d.c,84 :: 		if(Zatual>Ztarget)
	MOVF        _Zatual+1, 0 
	SUBWF       _Ztarget+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main43
	MOVF        _Zatual+0, 0 
	SUBWF       _Ztarget+0, 0 
L__main43:
	BTFSC       STATUS+0, 0 
	GOTO        L_main23
;impressora3d.c,86 :: 		Zatual--;
	MOVLW       1
	SUBWF       _Zatual+0, 1 
	MOVLW       0
	SUBWFB      _Zatual+1, 1 
;impressora3d.c,87 :: 		ZE = (ZE==16)?128:ZE/2;
	MOVLW       0
	XORWF       _ZE+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main44
	MOVLW       16
	XORWF       _ZE+0, 0 
L__main44:
	BTFSS       STATUS+0, 2 
	GOTO        L_main24
	MOVLW       128
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	GOTO        L_main25
L_main24:
	MOVF        _ZE+0, 0 
	MOVWF       R0 
	MOVF        _ZE+1, 0 
	MOVWF       R1 
	RRCF        R1, 1 
	RRCF        R0, 1 
	BCF         R1, 7 
	BTFSC       R1, 6 
	BSF         R1, 7 
	MOVF        R0, 0 
	MOVWF       R3 
	MOVF        R1, 0 
	MOVWF       R4 
L_main25:
	MOVF        R3, 0 
	MOVWF       _ZE+0 
	MOVF        R4, 0 
	MOVWF       _ZE+1 
;impressora3d.c,88 :: 		}
	GOTO        L_main26
L_main23:
;impressora3d.c,89 :: 		else if(Zatual<Ztarget)
	MOVF        _Ztarget+1, 0 
	SUBWF       _Zatual+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main45
	MOVF        _Ztarget+0, 0 
	SUBWF       _Zatual+0, 0 
L__main45:
	BTFSC       STATUS+0, 0 
	GOTO        L_main27
;impressora3d.c,91 :: 		Zatual++;
	INFSNZ      _Zatual+0, 1 
	INCF        _Zatual+1, 1 
;impressora3d.c,92 :: 		ZE = (ZE==128)?16:ZE*2;
	MOVLW       0
	XORWF       _ZE+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main46
	MOVLW       128
	XORWF       _ZE+0, 0 
L__main46:
	BTFSS       STATUS+0, 2 
	GOTO        L_main28
	MOVLW       16
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	GOTO        L_main29
L_main28:
	MOVF        _ZE+0, 0 
	MOVWF       R0 
	MOVF        _ZE+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVF        R0, 0 
	MOVWF       R3 
	MOVF        R1, 0 
	MOVWF       R4 
L_main29:
	MOVF        R3, 0 
	MOVWF       _ZE+0 
	MOVF        R4, 0 
	MOVWF       _ZE+1 
;impressora3d.c,93 :: 		}
L_main27:
L_main26:
;impressora3d.c,95 :: 		if(Yatual>Ytarget)
	MOVF        _Yatual+1, 0 
	SUBWF       _Ytarget+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main47
	MOVF        _Yatual+0, 0 
	SUBWF       _Ytarget+0, 0 
L__main47:
	BTFSC       STATUS+0, 0 
	GOTO        L_main30
;impressora3d.c,97 :: 		Yatual--;
	MOVLW       1
	SUBWF       _Yatual+0, 1 
	MOVLW       0
	SUBWFB      _Yatual+1, 1 
;impressora3d.c,98 :: 		Y = (Y==8)?1:Y*2;
	MOVLW       0
	XORWF       _Y+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main48
	MOVLW       8
	XORWF       _Y+0, 0 
L__main48:
	BTFSS       STATUS+0, 2 
	GOTO        L_main31
	MOVLW       1
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	GOTO        L_main32
L_main31:
	MOVF        _Y+0, 0 
	MOVWF       R0 
	MOVF        _Y+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVF        R0, 0 
	MOVWF       R3 
	MOVF        R1, 0 
	MOVWF       R4 
L_main32:
	MOVF        R3, 0 
	MOVWF       _Y+0 
	MOVF        R4, 0 
	MOVWF       _Y+1 
;impressora3d.c,99 :: 		}
	GOTO        L_main33
L_main30:
;impressora3d.c,100 :: 		else if(Yatual<Ytarget)
	MOVF        _Ytarget+1, 0 
	SUBWF       _Yatual+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main49
	MOVF        _Ytarget+0, 0 
	SUBWF       _Yatual+0, 0 
L__main49:
	BTFSC       STATUS+0, 0 
	GOTO        L_main34
;impressora3d.c,102 :: 		++Yatual;
	INFSNZ      _Yatual+0, 1 
	INCF        _Yatual+1, 1 
;impressora3d.c,103 :: 		Y = (Y==1)?8:Y/2;
	MOVLW       0
	XORWF       _Y+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main50
	MOVLW       1
	XORWF       _Y+0, 0 
L__main50:
	BTFSS       STATUS+0, 2 
	GOTO        L_main35
	MOVLW       8
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	GOTO        L_main36
L_main35:
	MOVF        _Y+0, 0 
	MOVWF       R0 
	MOVF        _Y+1, 0 
	MOVWF       R1 
	RRCF        R1, 1 
	RRCF        R0, 1 
	BCF         R1, 7 
	BTFSC       R1, 6 
	BSF         R1, 7 
	MOVF        R0, 0 
	MOVWF       R3 
	MOVF        R1, 0 
	MOVWF       R4 
L_main36:
	MOVF        R3, 0 
	MOVWF       _Y+0 
	MOVF        R4, 0 
	MOVWF       _Y+1 
;impressora3d.c,104 :: 		}
L_main34:
L_main33:
;impressora3d.c,106 :: 		PORTB = X + ZE;
	MOVF        _ZE+0, 0 
	ADDWF       _X+0, 0 
	MOVWF       PORTB+0 
;impressora3d.c,107 :: 		PORTD = broca * 16 + Y;
	MOVLW       4
	MOVWF       R1 
	MOVF        _broca+0, 0 
	MOVWF       R0 
	MOVF        R1, 0 
L__main51:
	BZ          L__main52
	RLCF        R0, 1 
	BCF         R0, 0 
	ADDLW       255
	GOTO        L__main51
L__main52:
	MOVF        _Y+0, 0 
	ADDWF       R0, 0 
	MOVWF       PORTD+0 
;impressora3d.c,108 :: 		Delay_ms(5);
	MOVLW       33
	MOVWF       R12, 0
	MOVLW       118
	MOVWF       R13, 0
L_main37:
	DECFSZ      R13, 1, 0
	BRA         L_main37
	DECFSZ      R12, 1, 0
	BRA         L_main37
	NOP
;impressora3d.c,109 :: 		}
	GOTO        L_main10
;impressora3d.c,110 :: 		}
	GOTO        $+0
; end of _main
