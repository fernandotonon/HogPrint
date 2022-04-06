;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Mar 22 2009) (MINGW32)
; This file was generated Fri Sep 09 12:42:44 2011
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f452

	radix dec

;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global _channel
	global _c_c
	global _c_total
	global _c
	global _NPeriodosPassadosNoCanal
	global _up
	global _top
	global _down
	global _control
	global _main

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
	extern _PORTAbits
	extern _PORTBbits
	extern _PORTCbits
	extern _PORTDbits
	extern _PORTEbits
	extern _LATAbits
	extern _LATBbits
	extern _LATCbits
	extern _LATDbits
	extern _LATEbits
	extern _TRISAbits
	extern _TRISBbits
	extern _TRISCbits
	extern _TRISDbits
	extern _TRISEbits
	extern _PIE1bits
	extern _PIR1bits
	extern _IPR1bits
	extern _PIE2bits
	extern _PIR2bits
	extern _IPR2bits
	extern _EECON1bits
	extern _RCSTAbits
	extern _TXSTAbits
	extern _T3CONbits
	extern _CCP2CONbits
	extern _CCP1CONbits
	extern _ADCON1bits
	extern _ADCON0bits
	extern _SSPCON2bits
	extern _SSPCON1bits
	extern _SSPSTATbits
	extern _T2CONbits
	extern _T1CONbits
	extern _RCONbits
	extern _WDTCONbits
	extern _LVDCONbits
	extern _OSCCONbits
	extern _T0CONbits
	extern _STATUSbits
	extern _INTCON3bits
	extern _INTCON2bits
	extern _INTCONbits
	extern _STKPTRbits
	extern _PORTA
	extern _PORTB
	extern _PORTC
	extern _PORTD
	extern _PORTE
	extern _LATA
	extern _LATB
	extern _LATC
	extern _LATD
	extern _LATE
	extern _TRISA
	extern _TRISB
	extern _TRISC
	extern _TRISD
	extern _TRISE
	extern _PIE1
	extern _PIR1
	extern _IPR1
	extern _PIE2
	extern _PIR2
	extern _IPR2
	extern _EECON1
	extern _EECON2
	extern _EEDATA
	extern _EEADR
	extern _RCSTA
	extern _TXSTA
	extern _TXREG
	extern _RCREG
	extern _SPBRG
	extern _T3CON
	extern _TMR3L
	extern _TMR3H
	extern _CCP2CON
	extern _CCPR2L
	extern _CCPR2H
	extern _CCP1CON
	extern _CCPR1L
	extern _CCPR1H
	extern _ADCON1
	extern _ADCON0
	extern _ADRESL
	extern _ADRESH
	extern _SSPCON2
	extern _SSPCON1
	extern _SSPSTAT
	extern _SSPADD
	extern _SSPBUF
	extern _T2CON
	extern _PR2
	extern _TMR2
	extern _T1CON
	extern _TMR1L
	extern _TMR1H
	extern _RCON
	extern _WDTCON
	extern _LVDCON
	extern _OSCCON
	extern _T0CON
	extern _TMR0L
	extern _TMR0H
	extern _STATUS
	extern _FSR2L
	extern _FSR2H
	extern _PLUSW2
	extern _PREINC2
	extern _POSTDEC2
	extern _POSTINC2
	extern _INDF2
	extern _BSR
	extern _FSR1L
	extern _FSR1H
	extern _PLUSW1
	extern _PREINC1
	extern _POSTDEC1
	extern _POSTINC1
	extern _INDF1
	extern _WREG
	extern _FSR0L
	extern _FSR0H
	extern _PLUSW0
	extern _PREINC0
	extern _POSTDEC0
	extern _POSTINC0
	extern _INDF0
	extern _INTCON3
	extern _INTCON2
	extern _INTCON
	extern _PRODL
	extern _PRODH
	extern _TABLAT
	extern _TBLPTRL
	extern _TBLPTRH
	extern _TBLPTRU
	extern _PCL
	extern _PCLATH
	extern _PCLATU
	extern _STKPTR
	extern _TOSL
	extern _TOSH
	extern _TOSU
	extern __mulint
	extern __divslong
	extern __mullong
	extern ___slong2fs
	extern ___fsdiv
	extern ___fsmul
	extern ___fsgt
	extern __modsint
	extern ___fssub
;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
STATUS	equ	0xfd8
WREG	equ	0xfe8
FSR0L	equ	0xfe9
FSR0H	equ	0xfea
FSR1L	equ	0xfe1
FSR2L	equ	0xfd9
INDF0	equ	0xfef
POSTINC0	equ	0xfee
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
PLUSW2	equ	0xfdb
PRODL	equ	0xff3
PRODH	equ	0xff4


; Internal registers
.registers	udata_ovr	0x0000
r0x00	res	1
r0x01	res	1
r0x02	res	1
r0x03	res	1
r0x04	res	1
r0x05	res	1
r0x06	res	1
r0x07	res	1
r0x08	res	1
r0x09	res	1
r0x0a	res	1
r0x0b	res	1
r0x0c	res	1
r0x0d	res	1
r0x0e	res	1
r0x0f	res	1
r0x10	res	1
r0x11	res	1

udata_main_0	udata
_channel	res	120

udata_main_1	udata
_c_c	res	16

udata_main_2	udata
_NPeriodosPassadosNoCanal	res	8

udata_main_3	udata
_c	res	2

udata_main_4	udata
_c_total	res	2

;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
S_main__main	code
_main:
;	.line	116; main.c	TRISC = 0;
	CLRF	_TRISC
;	.line	119; main.c	PORTC = 0;
	CLRF	_PORTC
;	.line	122; main.c	channel[0].T = 10;
	MOVLW	0x0a
	BANKSEL	(_channel + 16)
	MOVWF	(_channel + 16), B
	BANKSEL	(_channel + 17)
	CLRF	(_channel + 17), B
	BANKSEL	(_channel + 18)
	CLRF	(_channel + 18), B
	BANKSEL	(_channel + 19)
	CLRF	(_channel + 19), B
;	.line	123; main.c	channel[1].T = 10;
	MOVLW	0x0a
	BANKSEL	(_channel + 46)
	MOVWF	(_channel + 46), B
	BANKSEL	(_channel + 47)
	CLRF	(_channel + 47), B
	BANKSEL	(_channel + 48)
	CLRF	(_channel + 48), B
	BANKSEL	(_channel + 49)
	CLRF	(_channel + 49), B
;	.line	124; main.c	channel[2].T = 14;
	MOVLW	0x0e
	BANKSEL	(_channel + 76)
	MOVWF	(_channel + 76), B
	BANKSEL	(_channel + 77)
	CLRF	(_channel + 77), B
	BANKSEL	(_channel + 78)
	CLRF	(_channel + 78), B
	BANKSEL	(_channel + 79)
	CLRF	(_channel + 79), B
;	.line	125; main.c	channel[3].T = 50;
	MOVLW	0x32
	BANKSEL	(_channel + 106)
	MOVWF	(_channel + 106), B
	BANKSEL	(_channel + 107)
	CLRF	(_channel + 107), B
	BANKSEL	(_channel + 108)
	CLRF	(_channel + 108), B
	BANKSEL	(_channel + 109)
	CLRF	(_channel + 109), B
;	.line	128; main.c	channel[0].pulse_interval = 100;
	MOVLW	0x64
	BANKSEL	_channel
	MOVWF	_channel, B
	BANKSEL	(_channel + 1)
	CLRF	(_channel + 1), B
	BANKSEL	(_channel + 2)
	CLRF	(_channel + 2), B
	BANKSEL	(_channel + 3)
	CLRF	(_channel + 3), B
;	.line	129; main.c	channel[1].pulse_interval = 100;
	MOVLW	0x64
	BANKSEL	(_channel + 30)
	MOVWF	(_channel + 30), B
	BANKSEL	(_channel + 31)
	CLRF	(_channel + 31), B
	BANKSEL	(_channel + 32)
	CLRF	(_channel + 32), B
	BANKSEL	(_channel + 33)
	CLRF	(_channel + 33), B
;	.line	130; main.c	channel[2].pulse_interval = 100;
	MOVLW	0x64
	BANKSEL	(_channel + 60)
	MOVWF	(_channel + 60), B
	BANKSEL	(_channel + 61)
	CLRF	(_channel + 61), B
	BANKSEL	(_channel + 62)
	CLRF	(_channel + 62), B
	BANKSEL	(_channel + 63)
	CLRF	(_channel + 63), B
;	.line	131; main.c	channel[3].pulse_interval = 110;
	MOVLW	0x6e
	BANKSEL	(_channel + 90)
	MOVWF	(_channel + 90), B
	BANKSEL	(_channel + 91)
	CLRF	(_channel + 91), B
	BANKSEL	(_channel + 92)
	CLRF	(_channel + 92), B
	BANKSEL	(_channel + 93)
	CLRF	(_channel + 93), B
	BANKSEL	(_channel + 4)
;	.line	134; main.c	channel[0].initial = 0;
	CLRF	(_channel + 4), B
	BANKSEL	(_channel + 5)
	CLRF	(_channel + 5), B
	BANKSEL	(_channel + 6)
	CLRF	(_channel + 6), B
	BANKSEL	(_channel + 7)
	CLRF	(_channel + 7), B
;	.line	135; main.c	channel[1].initial = 100;
	MOVLW	0x64
	BANKSEL	(_channel + 34)
	MOVWF	(_channel + 34), B
	BANKSEL	(_channel + 35)
	CLRF	(_channel + 35), B
	BANKSEL	(_channel + 36)
	CLRF	(_channel + 36), B
	BANKSEL	(_channel + 37)
	CLRF	(_channel + 37), B
;	.line	136; main.c	channel[2].initial = 200;
	MOVLW	0xc8
	BANKSEL	(_channel + 64)
	MOVWF	(_channel + 64), B
	BANKSEL	(_channel + 65)
	CLRF	(_channel + 65), B
	BANKSEL	(_channel + 66)
	CLRF	(_channel + 66), B
	BANKSEL	(_channel + 67)
	CLRF	(_channel + 67), B
;	.line	137; main.c	channel[3].initial = 300;
	MOVLW	0x2c
	BANKSEL	(_channel + 94)
	MOVWF	(_channel + 94), B
	MOVLW	0x01
	BANKSEL	(_channel + 95)
	MOVWF	(_channel + 95), B
	BANKSEL	(_channel + 96)
	CLRF	(_channel + 96), B
	BANKSEL	(_channel + 97)
	CLRF	(_channel + 97), B
;	.line	140; main.c	channel[0].time = 1000;
	MOVLW	0xe8
	BANKSEL	(_channel + 8)
	MOVWF	(_channel + 8), B
	MOVLW	0x03
	BANKSEL	(_channel + 9)
	MOVWF	(_channel + 9), B
	BANKSEL	(_channel + 10)
	CLRF	(_channel + 10), B
	BANKSEL	(_channel + 11)
	CLRF	(_channel + 11), B
;	.line	141; main.c	channel[1].time = 1000;
	MOVLW	0xe8
	BANKSEL	(_channel + 38)
	MOVWF	(_channel + 38), B
	MOVLW	0x03
	BANKSEL	(_channel + 39)
	MOVWF	(_channel + 39), B
	BANKSEL	(_channel + 40)
	CLRF	(_channel + 40), B
	BANKSEL	(_channel + 41)
	CLRF	(_channel + 41), B
;	.line	142; main.c	channel[2].time = 2000;
	MOVLW	0xd0
	BANKSEL	(_channel + 68)
	MOVWF	(_channel + 68), B
	MOVLW	0x07
	BANKSEL	(_channel + 69)
	MOVWF	(_channel + 69), B
	BANKSEL	(_channel + 70)
	CLRF	(_channel + 70), B
	BANKSEL	(_channel + 71)
	CLRF	(_channel + 71), B
;	.line	143; main.c	channel[3].time = 1500;
	MOVLW	0xdc
	BANKSEL	(_channel + 98)
	MOVWF	(_channel + 98), B
	MOVLW	0x05
	BANKSEL	(_channel + 99)
	MOVWF	(_channel + 99), B
	BANKSEL	(_channel + 100)
	CLRF	(_channel + 100), B
	BANKSEL	(_channel + 101)
	CLRF	(_channel + 101), B
;	.line	146; main.c	channel[0].timeup = 100;
	MOVLW	0x64
	BANKSEL	(_channel + 12)
	MOVWF	(_channel + 12), B
	BANKSEL	(_channel + 13)
	CLRF	(_channel + 13), B
	BANKSEL	(_channel + 14)
	CLRF	(_channel + 14), B
	BANKSEL	(_channel + 15)
	CLRF	(_channel + 15), B
;	.line	147; main.c	channel[1].timeup = 100;
	MOVLW	0x64
	BANKSEL	(_channel + 42)
	MOVWF	(_channel + 42), B
	BANKSEL	(_channel + 43)
	CLRF	(_channel + 43), B
	BANKSEL	(_channel + 44)
	CLRF	(_channel + 44), B
	BANKSEL	(_channel + 45)
	CLRF	(_channel + 45), B
;	.line	148; main.c	channel[2].timeup = 500;
	MOVLW	0xf4
	BANKSEL	(_channel + 72)
	MOVWF	(_channel + 72), B
	MOVLW	0x01
	BANKSEL	(_channel + 73)
	MOVWF	(_channel + 73), B
	BANKSEL	(_channel + 74)
	CLRF	(_channel + 74), B
	BANKSEL	(_channel + 75)
	CLRF	(_channel + 75), B
;	.line	149; main.c	channel[3].timeup = 600;
	MOVLW	0x58
	BANKSEL	(_channel + 102)
	MOVWF	(_channel + 102), B
	MOVLW	0x02
	BANKSEL	(_channel + 103)
	MOVWF	(_channel + 103), B
	BANKSEL	(_channel + 104)
	CLRF	(_channel + 104), B
	BANKSEL	(_channel + 105)
	CLRF	(_channel + 105), B
	BANKSEL	_c
;	.line	152; main.c	for (c=0;c<4;c++)
	CLRF	_c, B
	BANKSEL	(_c + 1)
	CLRF	(_c + 1), B
_00176_DS_:
	BANKSEL	(_c + 1)
	MOVF	(_c + 1), W, B
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00205_DS_
	MOVLW	0x04
	BANKSEL	_c
	SUBWF	_c, W, B
_00205_DS_:
	BTFSC	STATUS, 0
	BRA	_00174_DS_
	BANKSEL	(_c + 1)
;	.line	154; main.c	channel[c].timetotal = channel[c].timeup *2 + channel[c].time + channel[c].pulse_interval;
	MOVF	(_c + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_c
	MOVF	_c, W, B
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x1e
	MOVWF	POSTDEC1
	CALL	__mulint
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVLW	LOW(_channel)
	ADDWF	r0x00, F
	MOVLW	HIGH(_channel)
	ADDWFC	r0x01, F
	MOVF	r0x00, W
	ADDLW	0x14
	MOVWF	r0x02
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x03
	MOVF	r0x00, W
	ADDLW	0x0c
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x05
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, FSR0H
	MOVFF	POSTINC0, r0x04
	MOVFF	POSTINC0, r0x05
	MOVFF	POSTINC0, r0x06
	MOVFF	INDF0, r0x07
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	__mullong
	MOVWF	r0x04
	MOVFF	PRODL, r0x05
	MOVFF	PRODH, r0x06
	MOVFF	FSR0L, r0x07
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	ADDLW	0x08
	MOVWF	r0x08
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x09
	MOVFF	r0x08, FSR0L
	MOVFF	r0x09, FSR0H
	MOVFF	POSTINC0, r0x08
	MOVFF	POSTINC0, r0x09
	MOVFF	POSTINC0, r0x0a
	MOVFF	INDF0, r0x0b
	MOVF	r0x08, W
	ADDWF	r0x04, F
	MOVF	r0x09, W
	ADDWFC	r0x05, F
	MOVF	r0x0a, W
	ADDWFC	r0x06, F
	MOVF	r0x0b, W
	ADDWFC	r0x07, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	POSTINC0, r0x08
	MOVFF	POSTINC0, r0x09
	MOVFF	POSTINC0, r0x0a
	MOVFF	INDF0, r0x0b
	MOVF	r0x08, W
	ADDWF	r0x04, F
	MOVF	r0x09, W
	ADDWFC	r0x05, F
	MOVF	r0x0a, W
	ADDWFC	r0x06, F
	MOVF	r0x0b, W
	ADDWFC	r0x07, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	r0x04, POSTINC0
	MOVFF	r0x05, POSTINC0
	MOVFF	r0x06, POSTINC0
	MOVFF	r0x07, INDF0
;	.line	155; main.c	channel[c].started = 0;
	MOVF	r0x00, W
	ADDLW	0x1c
	MOVWF	r0x02
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x03
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVLW	0x00
	MOVWF	POSTINC0
	MOVLW	0x00
	MOVWF	INDF0
;	.line	156; main.c	channel[c].currTime = 0;
	MOVLW	0x18
	ADDWF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVLW	0x00
	MOVWF	POSTINC0
	MOVLW	0x00
	MOVWF	POSTINC0
	MOVLW	0x00
	MOVWF	POSTINC0
	MOVLW	0x00
	MOVWF	INDF0
	BANKSEL	_c
;	.line	152; main.c	for (c=0;c<4;c++)
	INCF	_c, F, B
	BNC	_10166_DS_
	BANKSEL	(_c + 1)
	INCF	(_c + 1), F, B
_10166_DS_:
	BRA	_00176_DS_
_00174_DS_:
	BANKSEL	_c
;	.line	165; main.c	for (c=0;c<8;c++)
	CLRF	_c, B
	BANKSEL	(_c + 1)
	CLRF	(_c + 1), B
_00180_DS_:
	BANKSEL	(_c + 1)
	MOVF	(_c + 1), W, B
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00206_DS_
	MOVLW	0x08
	BANKSEL	_c
	SUBWF	_c, W, B
_00206_DS_:
	BC	_00183_DS_
	BANKSEL	(_c + 1)
;	.line	166; main.c	c_c[c] = 0;
	MOVF	(_c + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_c
	MOVF	_c, W, B
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	__mulint
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVLW	LOW(_c_c)
	ADDWF	r0x00, F
	MOVLW	HIGH(_c_c)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVLW	0x00
	MOVWF	POSTINC0
	MOVLW	0x00
	MOVWF	INDF0
	BANKSEL	_c
;	.line	165; main.c	for (c=0;c<8;c++)
	INCF	_c, F, B
	BNC	_20167_DS_
	BANKSEL	(_c + 1)
	INCF	(_c + 1), F, B
_20167_DS_:
	BRA	_00180_DS_
_00183_DS_:
	BANKSEL	_c_total
;	.line	168; main.c	c_total = 0;
	CLRF	_c_total, B
	BANKSEL	(_c_total + 1)
	CLRF	(_c_total + 1), B
;	.line	170; main.c	control();
	CALL	_control
;	.line	172; main.c	c_total = c_c[0];
	MOVFF	_c_c, _c_total
	MOVFF	(_c_c + 1), (_c_total + 1)
	BANKSEL	(_c_c + 3)
;	.line	173; main.c	c_total += c_c[1]*2;
	MOVF	(_c_c + 3), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_c_c + 2)
	MOVF	(_c_c + 2), W, B
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	__mulint
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	BANKSEL	_c_total
	ADDWF	_c_total, F, B
	MOVF	r0x01, W
	BANKSEL	(_c_total + 1)
	ADDWFC	(_c_total + 1), F, B
	BANKSEL	(_c_c + 5)
;	.line	174; main.c	c_total += c_c[2]*4;
	MOVF	(_c_c + 5), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_c_c + 4)
	MOVF	(_c_c + 4), W, B
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	CALL	__mulint
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	BANKSEL	_c_total
	ADDWF	_c_total, F, B
	MOVF	r0x01, W
	BANKSEL	(_c_total + 1)
	ADDWFC	(_c_total + 1), F, B
	BANKSEL	(_c_c + 7)
;	.line	175; main.c	c_total += c_c[3]*8;
	MOVF	(_c_c + 7), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_c_c + 6)
	MOVF	(_c_c + 6), W, B
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x08
	MOVWF	POSTDEC1
	CALL	__mulint
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	BANKSEL	_c_total
	ADDWF	_c_total, F, B
	MOVF	r0x01, W
	BANKSEL	(_c_total + 1)
	ADDWFC	(_c_total + 1), F, B
	BANKSEL	(_c_c + 9)
;	.line	176; main.c	c_total += c_c[4]*16;
	MOVF	(_c_c + 9), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_c_c + 8)
	MOVF	(_c_c + 8), W, B
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x10
	MOVWF	POSTDEC1
	CALL	__mulint
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	BANKSEL	_c_total
	ADDWF	_c_total, F, B
	MOVF	r0x01, W
	BANKSEL	(_c_total + 1)
	ADDWFC	(_c_total + 1), F, B
	BANKSEL	(_c_c + 11)
;	.line	177; main.c	c_total += c_c[5]*32;
	MOVF	(_c_c + 11), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_c_c + 10)
	MOVF	(_c_c + 10), W, B
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x20
	MOVWF	POSTDEC1
	CALL	__mulint
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	BANKSEL	_c_total
	ADDWF	_c_total, F, B
	MOVF	r0x01, W
	BANKSEL	(_c_total + 1)
	ADDWFC	(_c_total + 1), F, B
	BANKSEL	(_c_c + 13)
;	.line	178; main.c	c_total += c_c[6]*64;
	MOVF	(_c_c + 13), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_c_c + 12)
	MOVF	(_c_c + 12), W, B
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x40
	MOVWF	POSTDEC1
	CALL	__mulint
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	BANKSEL	_c_total
	ADDWF	_c_total, F, B
	MOVF	r0x01, W
	BANKSEL	(_c_total + 1)
	ADDWFC	(_c_total + 1), F, B
	BANKSEL	(_c_c + 15)
;	.line	179; main.c	c_total += c_c[7]*128;
	MOVF	(_c_c + 15), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_c_c + 14)
	MOVF	(_c_c + 14), W, B
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x80
	MOVWF	POSTDEC1
	CALL	__mulint
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	BANKSEL	_c_total
	ADDWF	_c_total, F, B
	MOVF	r0x01, W
	BANKSEL	(_c_total + 1)
	ADDWFC	(_c_total + 1), F, B
	BANKSEL	_c_total
;	.line	181; main.c	PORTC = c_total;
	MOVF	_c_total, W, B
	MOVWF	_PORTC
;	.line	185; main.c	for (c=0;c<4;c++)
	MOVLW	0x04
	BANKSEL	_c
	MOVWF	_c, B
	BANKSEL	(_c + 1)
	CLRF	(_c + 1), B
_00186_DS_:
	BANKSEL	_c
;	.line	186; main.c	channel[c].currTime++;
	MOVF	_c, W, B
	ADDLW	0xff
	MOVWF	r0x00
	MOVLW	0xff
	BANKSEL	(_c + 1)
	ADDWFC	(_c + 1), W, B
	MOVWF	r0x01
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x1e
	MOVWF	POSTDEC1
	CALL	__mulint
	MOVWF	r0x02
	MOVFF	PRODL, r0x03
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVLW	LOW(_channel)
	ADDWF	r0x02, F
	MOVLW	HIGH(_channel)
	ADDWFC	r0x03, F
	MOVLW	0x18
	ADDWF	r0x02, F
	BTFSC	STATUS, 0
	INCF	r0x03, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	POSTINC0, r0x04
	MOVFF	POSTINC0, r0x05
	MOVFF	POSTINC0, r0x06
	MOVFF	INDF0, r0x07
	INCF	r0x04, F
	BTFSC	STATUS, 0
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	r0x04, POSTINC0
	MOVFF	r0x05, POSTINC0
	MOVFF	r0x06, POSTINC0
	MOVFF	r0x07, INDF0
	MOVFF	r0x00, _c
	MOVFF	r0x01, (_c + 1)
	BANKSEL	_c
;	.line	185; main.c	for (c=0;c<4;c++)
	MOVF	_c, W, B
	BANKSEL	(_c + 1)
	IORWF	(_c + 1), W, B
	BTFSS	STATUS, 2
	BRA	_00186_DS_
	BANKSEL	_c
;	.line	190; main.c	for (c=0;c<4;c++)
	CLRF	_c, B
	BANKSEL	(_c + 1)
	CLRF	(_c + 1), B
_00187_DS_:
	BANKSEL	(_c + 1)
	MOVF	(_c + 1), W, B
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00207_DS_
	MOVLW	0x04
	BANKSEL	_c
	SUBWF	_c, W, B
_00207_DS_:
	BTFSC	STATUS, 0
	BRA	_00174_DS_
	BANKSEL	(_c + 1)
;	.line	192; main.c	if(channel[c].started==0)
	MOVF	(_c + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_c
	MOVF	_c, W, B
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x1e
	MOVWF	POSTDEC1
	CALL	__mulint
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVLW	LOW(_channel)
	ADDWF	r0x00, F
	MOVLW	HIGH(_channel)
	ADDWFC	r0x01, F
	MOVF	r0x00, W
	ADDLW	0x1c
	MOVWF	r0x02
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x03
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	POSTINC0, r0x04
	MOVFF	INDF0, r0x05
	MOVF	r0x04, W
	IORWF	r0x05, W
	BTFSS	STATUS, 2
	BRA	_00171_DS_
;	.line	194; main.c	if(channel[c].currTime>channel[c].initial)
	MOVF	r0x00, W
	ADDLW	0x18
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x05
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, FSR0H
	MOVFF	POSTINC0, r0x06
	MOVFF	POSTINC0, r0x07
	MOVFF	POSTINC0, r0x08
	MOVFF	INDF0, r0x09
	MOVF	r0x00, W
	ADDLW	0x04
	MOVWF	r0x0a
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x0b
	MOVFF	r0x0a, FSR0L
	MOVFF	r0x0b, FSR0H
	MOVFF	POSTINC0, r0x0a
	MOVFF	POSTINC0, r0x0b
	MOVFF	POSTINC0, r0x0c
	MOVFF	INDF0, r0x0d
	MOVF	r0x0d, W
	ADDLW	0x80
	MOVWF	PRODL
	MOVF	r0x09, W
	ADDLW	0x80
	SUBWF	PRODL, W
	BNZ	_00208_DS_
	MOVF	r0x08, W
	SUBWF	r0x0c, W
	BNZ	_00208_DS_
	MOVF	r0x07, W
	SUBWF	r0x0b, W
	BNZ	_00208_DS_
	MOVF	r0x06, W
	SUBWF	r0x0a, W
_00208_DS_:
	BTFSC	STATUS, 0
	BRA	_00189_DS_
;	.line	196; main.c	channel[c].started = 1;
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVLW	0x01
	MOVWF	POSTINC0
	MOVLW	0x00
	MOVWF	INDF0
;	.line	197; main.c	channel[c].currTime-=channel[c].started;
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	POSTINC0, r0x02
	MOVFF	INDF0, r0x03
	CLRF	WREG
	BTFSC	r0x03, 7
	MOVLW	0xff
	MOVWF	r0x0a
	MOVWF	r0x0b
	MOVF	r0x02, W
	SUBWF	r0x06, F
	MOVF	r0x03, W
	SUBWFB	r0x07, F
	MOVF	r0x0a, W
	SUBWFB	r0x08, F
	MOVF	r0x0b, W
	SUBWFB	r0x09, F
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, FSR0H
	MOVFF	r0x06, POSTINC0
	MOVFF	r0x07, POSTINC0
	MOVFF	r0x08, POSTINC0
	MOVFF	r0x09, INDF0
	BRA	_00189_DS_
_00171_DS_:
;	.line	200; main.c	else if(channel[c].currTime>channel[c].timetotal)
	MOVF	r0x00, W
	ADDLW	0x18
	MOVWF	r0x02
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x03
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	POSTINC0, r0x04
	MOVFF	POSTINC0, r0x05
	MOVFF	POSTINC0, r0x06
	MOVFF	INDF0, r0x07
	MOVLW	0x14
	ADDWF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	POSTINC0, r0x00
	MOVFF	POSTINC0, r0x01
	MOVFF	POSTINC0, r0x08
	MOVFF	INDF0, r0x09
	MOVF	r0x09, W
	ADDLW	0x80
	MOVWF	PRODL
	MOVF	r0x07, W
	ADDLW	0x80
	SUBWF	PRODL, W
	BNZ	_00209_DS_
	MOVF	r0x06, W
	SUBWF	r0x08, W
	BNZ	_00209_DS_
	MOVF	r0x05, W
	SUBWF	r0x01, W
	BNZ	_00209_DS_
	MOVF	r0x04, W
	SUBWF	r0x00, W
_00209_DS_:
	BC	_00189_DS_
;	.line	202; main.c	channel[c].currTime-=channel[c].timetotal;
	MOVF	r0x00, W
	SUBWF	r0x04, F
	MOVF	r0x01, W
	SUBWFB	r0x05, F
	MOVF	r0x08, W
	SUBWFB	r0x06, F
	MOVF	r0x09, W
	SUBWFB	r0x07, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	r0x04, POSTINC0
	MOVFF	r0x05, POSTINC0
	MOVFF	r0x06, POSTINC0
	MOVFF	r0x07, INDF0
_00189_DS_:
	BANKSEL	_c
;	.line	190; main.c	for (c=0;c<4;c++)
	INCF	_c, F, B
	BNC	_30168_DS_
	BANKSEL	(_c + 1)
	INCF	(_c + 1), F, B
_30168_DS_:
	BRA	_00187_DS_
	RETURN	

; ; Starting pCode block
S_main__control	code
_control:
;	.line	84; main.c	void control()
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	MOVFF	r0x0c, POSTDEC1
	MOVFF	r0x0d, POSTDEC1
	MOVFF	r0x0e, POSTDEC1
	MOVFF	r0x0f, POSTDEC1
;	.line	87; main.c	for (control_c=0; control_c<4; control_c++)
	CLRF	r0x00
	CLRF	r0x01
	CLRF	r0x02
	CLRF	r0x03
_00144_DS_:
	MOVF	r0x01, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00157_DS_
	MOVLW	0x04
	SUBWF	r0x00, W
_00157_DS_:
	BTFSC	STATUS, 0
	BRA	_00148_DS_
;	.line	89; main.c	if (channel[control_c].started>0) /// Se já passou do delay inicial do canal
	MOVLW	LOW(_channel)
	ADDWF	r0x02, W
	MOVWF	r0x04
	MOVLW	HIGH(_channel)
	ADDWFC	r0x03, W
	MOVWF	r0x05
	MOVF	r0x04, W
	ADDLW	0x1c
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x05, W
	MOVWF	r0x07
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, FSR0H
	MOVFF	POSTINC0, r0x06
	MOVFF	INDF0, r0x07
	MOVF	r0x07, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00158_DS_
	MOVLW	0x01
	SUBWF	r0x06, W
_00158_DS_:
	BTFSS	STATUS, 0
	BRA	_00146_DS_
;	.line	91; main.c	if (channel[control_c].currTime<channel[control_c].timeup) ///Se está no tempo de subida do canal
	MOVF	r0x04, W
	ADDLW	0x18
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x05, W
	MOVWF	r0x07
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, FSR0H
	MOVFF	POSTINC0, r0x06
	MOVFF	POSTINC0, r0x07
	MOVFF	POSTINC0, r0x08
	MOVFF	INDF0, r0x09
	MOVF	r0x04, W
	ADDLW	0x0c
	MOVWF	r0x0a
	MOVLW	0x00
	ADDWFC	r0x05, W
	MOVWF	r0x0b
	MOVFF	r0x0a, FSR0L
	MOVFF	r0x0b, FSR0H
	MOVFF	POSTINC0, r0x0a
	MOVFF	POSTINC0, r0x0b
	MOVFF	POSTINC0, r0x0c
	MOVFF	INDF0, r0x0d
	MOVF	r0x09, W
	ADDLW	0x80
	MOVWF	PRODL
	MOVF	r0x0d, W
	ADDLW	0x80
	SUBWF	PRODL, W
	BNZ	_00159_DS_
	MOVF	r0x0c, W
	SUBWF	r0x08, W
	BNZ	_00159_DS_
	MOVF	r0x0b, W
	SUBWF	r0x07, W
	BNZ	_00159_DS_
	MOVF	r0x0a, W
	SUBWF	r0x06, W
_00159_DS_:
	BC	_00140_DS_
;	.line	93; main.c	up(control_c);
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_up
	MOVLW	0x02
	ADDWF	FSR1L, F
	BRA	_00146_DS_
_00140_DS_:
;	.line	95; main.c	else if (channel[control_c].currTime<channel[control_c].timeup+channel[control_c].time) ///Se está no tempo de subida do canal
	MOVLW	0x08
	ADDWF	r0x04, F
	BTFSC	STATUS, 0
	INCF	r0x05, F
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, FSR0H
	MOVFF	POSTINC0, r0x04
	MOVFF	POSTINC0, r0x05
	MOVFF	POSTINC0, r0x0e
	MOVFF	INDF0, r0x0f
	MOVF	r0x0a, W
	ADDWF	r0x04, F
	MOVF	r0x0b, W
	ADDWFC	r0x05, F
	MOVF	r0x0c, W
	ADDWFC	r0x0e, F
	MOVF	r0x0d, W
	ADDWFC	r0x0f, F
	MOVF	r0x09, W
	ADDLW	0x80
	MOVWF	PRODL
	MOVF	r0x0f, W
	ADDLW	0x80
	SUBWF	PRODL, W
	BNZ	_00160_DS_
	MOVF	r0x0e, W
	SUBWF	r0x08, W
	BNZ	_00160_DS_
	MOVF	r0x05, W
	SUBWF	r0x07, W
	BNZ	_00160_DS_
	MOVF	r0x04, W
	SUBWF	r0x06, W
_00160_DS_:
	BC	_00137_DS_
;	.line	97; main.c	top(control_c);
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_top
	MOVLW	0x02
	ADDWF	FSR1L, F
	BRA	_00146_DS_
_00137_DS_:
;	.line	99; main.c	else if (channel[control_c].currTime<channel[control_c].timeup+channel[control_c].time+channel[control_c].timeup) ///Se está no tempo de subida do canal
	MOVF	r0x04, W
	ADDWF	r0x0a, F
	MOVF	r0x05, W
	ADDWFC	r0x0b, F
	MOVF	r0x0e, W
	ADDWFC	r0x0c, F
	MOVF	r0x0f, W
	ADDWFC	r0x0d, F
	MOVF	r0x09, W
	ADDLW	0x80
	MOVWF	PRODL
	MOVF	r0x0d, W
	ADDLW	0x80
	SUBWF	PRODL, W
	BNZ	_00161_DS_
	MOVF	r0x0c, W
	SUBWF	r0x08, W
	BNZ	_00161_DS_
	MOVF	r0x0b, W
	SUBWF	r0x07, W
	BNZ	_00161_DS_
	MOVF	r0x0a, W
	SUBWF	r0x06, W
_00161_DS_:
	BC	_00134_DS_
;	.line	101; main.c	down(control_c);
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_down
	MOVLW	0x02
	ADDWF	FSR1L, F
	BRA	_00146_DS_
_00134_DS_:
;	.line	105; main.c	c_c[control_c*2]=0;
	MOVF	r0x00, W
	MOVWF	r0x04
; ;multiply lit val:0x02 by variable r0x04 and store in r0x04
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	BCF	STATUS, 0
	RLCF	r0x04, F
; ;multiply lit val:0x02 by variable r0x04 and store in r0x05
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	MOVLW	0x00
	BTFSC	r0x04, 7
	MOVLW	0xff
	BCF	STATUS, 0
	RLCF	r0x04, W
	MOVWF	r0x05
	CLRF	r0x06
	BTFSC	r0x05, 7
	SETF	r0x06
	MOVLW	LOW(_c_c)
	ADDWF	r0x05, F
	MOVLW	HIGH(_c_c)
	ADDWFC	r0x06, F
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, FSR0H
	MOVLW	0x00
	MOVWF	POSTINC0
	MOVLW	0x00
	MOVWF	INDF0
;	.line	106; main.c	c_c[control_c*2+1]=0;
	INCF	r0x04, F
; ;multiply lit val:0x02 by variable r0x04 and store in r0x04
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	BCF	STATUS, 0
	RLCF	r0x04, F
	CLRF	r0x05
	BTFSC	r0x04, 7
	SETF	r0x05
	MOVLW	LOW(_c_c)
	ADDWF	r0x04, F
	MOVLW	HIGH(_c_c)
	ADDWFC	r0x05, F
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, FSR0H
	MOVLW	0x00
	MOVWF	POSTINC0
	MOVLW	0x00
	MOVWF	INDF0
_00146_DS_:
;	.line	87; main.c	for (control_c=0; control_c<4; control_c++)
	MOVLW	0x1e
	ADDWF	r0x02, F
	BTFSC	STATUS, 0
	INCF	r0x03, F
	INCF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	BRA	_00144_DS_
_00148_DS_:
	MOVFF	PREINC1, r0x0f
	MOVFF	PREINC1, r0x0e
	MOVFF	PREINC1, r0x0d
	MOVFF	PREINC1, r0x0c
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__down	code
_down:
;	.line	66; main.c	void down(int _channel)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	MOVFF	r0x0c, POSTDEC1
	MOVFF	r0x0d, POSTDEC1
	MOVFF	r0x0e, POSTDEC1
	MOVFF	r0x0f, POSTDEC1
	MOVFF	r0x10, POSTDEC1
	MOVFF	r0x11, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
;	.line	68; main.c	long TD = channel[_channel].currTime-channel[_channel].timeup-channel[_channel].time;
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x1e
	MOVWF	POSTDEC1
	CALL	__mulint
	MOVWF	r0x02
	MOVFF	PRODL, r0x03
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVLW	LOW(_channel)
	ADDWF	r0x02, F
	MOVLW	HIGH(_channel)
	ADDWFC	r0x03, F
	MOVF	r0x02, W
	ADDLW	0x18
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x03, W
	MOVWF	r0x05
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, FSR0H
	MOVFF	POSTINC0, r0x04
	MOVFF	POSTINC0, r0x05
	MOVFF	POSTINC0, r0x06
	MOVFF	INDF0, r0x07
	MOVF	r0x02, W
	ADDLW	0x0c
	MOVWF	r0x08
	MOVLW	0x00
	ADDWFC	r0x03, W
	MOVWF	r0x09
	MOVFF	r0x08, FSR0L
	MOVFF	r0x09, FSR0H
	MOVFF	POSTINC0, r0x08
	MOVFF	POSTINC0, r0x09
	MOVFF	POSTINC0, r0x0a
	MOVFF	INDF0, r0x0b
	MOVF	r0x08, W
	SUBWF	r0x04, F
	MOVF	r0x09, W
	SUBWFB	r0x05, F
	MOVF	r0x0a, W
	SUBWFB	r0x06, F
	MOVF	r0x0b, W
	SUBWFB	r0x07, F
	MOVF	r0x02, W
	ADDLW	0x08
	MOVWF	r0x0c
	MOVLW	0x00
	ADDWFC	r0x03, W
	MOVWF	r0x0d
	MOVFF	r0x0c, FSR0L
	MOVFF	r0x0d, FSR0H
	MOVFF	POSTINC0, r0x0c
	MOVFF	POSTINC0, r0x0d
	MOVFF	POSTINC0, r0x0e
	MOVFF	INDF0, r0x0f
	MOVF	r0x0c, W
	SUBWF	r0x04, F
	MOVF	r0x0d, W
	SUBWFB	r0x05, F
	MOVF	r0x0e, W
	SUBWFB	r0x06, F
	MOVF	r0x0f, W
	SUBWFB	r0x07, F
;	.line	69; main.c	long timeInT = TD-(((int)(TD / channel[_channel].T))*channel[_channel].T);
	MOVLW	0x10
	ADDWF	r0x02, F
	BTFSC	STATUS, 0
	INCF	r0x03, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	POSTINC0, r0x02
	MOVFF	POSTINC0, r0x03
	MOVFF	POSTINC0, r0x0c
	MOVFF	INDF0, r0x0d
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	CALL	__divslong
	MOVWF	r0x0e
	MOVFF	PRODL, r0x0f
	MOVFF	PRODH, r0x10
	MOVFF	FSR0L, r0x11
	MOVLW	0x08
	ADDWF	FSR1L, F
	CLRF	WREG
	BTFSC	r0x0f, 7
	MOVLW	0xff
	MOVWF	r0x10
	MOVWF	r0x11
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	MOVF	r0x0f, W
	MOVWF	POSTDEC1
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	CALL	__mullong
	MOVWF	r0x0e
	MOVFF	PRODL, r0x0f
	MOVFF	PRODH, r0x10
	MOVFF	FSR0L, r0x11
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x0e, W
	SUBWF	r0x04, W
	MOVWF	r0x0e
	MOVF	r0x0f, W
	SUBWFB	r0x05, W
	MOVWF	r0x0f
	MOVF	r0x10, W
	SUBWFB	r0x06, W
	MOVWF	r0x10
	MOVF	r0x11, W
	SUBWFB	r0x07, W
	MOVWF	r0x11
;	.line	70; main.c	float perTimeUP = (float)TD/(float)channel[_channel].timeup;
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	CALL	___slong2fs
	MOVWF	r0x04
	MOVFF	PRODL, r0x05
	MOVFF	PRODH, r0x06
	MOVFF	FSR0L, r0x07
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	CALL	___slong2fs
	MOVWF	r0x08
	MOVFF	PRODL, r0x09
	MOVFF	PRODH, r0x0a
	MOVFF	FSR0L, r0x0b
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	CALL	___fsdiv
	MOVWF	r0x04
	MOVFF	PRODL, r0x05
	MOVFF	PRODH, r0x06
	MOVFF	FSR0L, r0x07
	MOVLW	0x08
	ADDWF	FSR1L, F
;	.line	71; main.c	if (timeInT<=(1-perTimeUP)*channel[_channel].T/2) /// Se o tempo que passou dentro do período for menor q a metade do tempo que é pra ficar on
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVLW	0x3f
	MOVWF	POSTDEC1
	MOVLW	0x80
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	___fssub
	MOVWF	r0x04
	MOVFF	PRODL, r0x05
	MOVFF	PRODH, r0x06
	MOVFF	FSR0L, r0x07
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	CALL	___slong2fs
	MOVWF	r0x02
	MOVFF	PRODL, r0x03
	MOVFF	PRODH, r0x08
	MOVFF	FSR0L, r0x09
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	CALL	___fsmul
	MOVWF	r0x02
	MOVFF	PRODL, r0x03
	MOVFF	PRODH, r0x04
	MOVFF	FSR0L, r0x05
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVLW	0x40
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	CALL	___fsdiv
	MOVWF	r0x06
	MOVFF	PRODL, r0x07
	MOVFF	PRODH, r0x08
	MOVFF	FSR0L, r0x09
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	MOVF	r0x0f, W
	MOVWF	POSTDEC1
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	CALL	___slong2fs
	MOVWF	r0x0a
	MOVFF	PRODL, r0x0b
	MOVFF	PRODH, r0x0c
	MOVFF	FSR0L, r0x0d
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	CALL	___fsgt
	MOVWF	r0x06
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x06, W
	BNZ	_00126_DS_
;	.line	73; main.c	c_c[_channel*2] = 1;
	MOVF	r0x00, W
	MOVWF	r0x06
; ;multiply lit val:0x02 by variable r0x06 and store in r0x06
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	BCF	STATUS, 0
	RLCF	r0x06, F
; ;multiply lit val:0x02 by variable r0x06 and store in r0x07
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	MOVLW	0x00
	BTFSC	r0x06, 7
	MOVLW	0xff
	BCF	STATUS, 0
	RLCF	r0x06, W
	MOVWF	r0x07
	CLRF	r0x08
	BTFSC	r0x07, 7
	SETF	r0x08
	MOVLW	LOW(_c_c)
	ADDWF	r0x07, F
	MOVLW	HIGH(_c_c)
	ADDWFC	r0x08, F
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, FSR0H
	MOVLW	0x01
	MOVWF	POSTINC0
	MOVLW	0x00
	MOVWF	INDF0
;	.line	74; main.c	c_c[_channel*2+1] = 0;
	INCF	r0x06, F
; ;multiply lit val:0x02 by variable r0x06 and store in r0x06
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	BCF	STATUS, 0
	RLCF	r0x06, F
	CLRF	r0x07
	BTFSC	r0x06, 7
	SETF	r0x07
	MOVLW	LOW(_c_c)
	ADDWF	r0x06, F
	MOVLW	HIGH(_c_c)
	ADDWFC	r0x07, F
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, FSR0H
	MOVLW	0x00
	MOVWF	POSTINC0
	MOVLW	0x00
	MOVWF	INDF0
	BRA	_00128_DS_
_00126_DS_:
;	.line	76; main.c	else if (timeInT<=(1-perTimeUP)*channel[_channel].T) /// Se for a outra metade
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	CALL	___fsgt
	MOVWF	r0x02
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x02, W
	BNZ	_00128_DS_
; ;multiply lit val:0x02 by variable r0x00 and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
;	.line	78; main.c	c_c[_channel*2] = 0;
	BCF	STATUS, 0
	RLCF	r0x00, F
; ;multiply lit val:0x02 by variable r0x00 and store in r0x01
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	MOVLW	0x00
	BTFSC	r0x00, 7
	MOVLW	0xff
	BCF	STATUS, 0
	RLCF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	BTFSC	r0x01, 7
	SETF	r0x02
	MOVLW	LOW(_c_c)
	ADDWF	r0x01, F
	MOVLW	HIGH(_c_c)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	MOVLW	0x00
	MOVWF	POSTINC0
	MOVLW	0x00
	MOVWF	INDF0
;	.line	79; main.c	c_c[_channel*2+1] = 1;
	INCF	r0x00, F
; ;multiply lit val:0x02 by variable r0x00 and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	BCF	STATUS, 0
	RLCF	r0x00, F
	CLRF	r0x01
	BTFSC	r0x00, 7
	SETF	r0x01
	MOVLW	LOW(_c_c)
	ADDWF	r0x00, F
	MOVLW	HIGH(_c_c)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVLW	0x01
	MOVWF	POSTINC0
	MOVLW	0x00
	MOVWF	INDF0
_00128_DS_:
	MOVFF	PREINC1, r0x11
	MOVFF	PREINC1, r0x10
	MOVFF	PREINC1, r0x0f
	MOVFF	PREINC1, r0x0e
	MOVFF	PREINC1, r0x0d
	MOVFF	PREINC1, r0x0c
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__top	code
_top:
;	.line	47; main.c	void top(int _channel)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
;	.line	50; main.c	NPeriodosPassadosNoCanal[_channel] = (long)(channel[_channel].currTime / (channel[_channel].T / 2));
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	__mulint
	MOVWF	r0x02
	MOVFF	PRODL, r0x03
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVLW	LOW(_NPeriodosPassadosNoCanal)
	ADDWF	r0x02, F
	MOVLW	HIGH(_NPeriodosPassadosNoCanal)
	ADDWFC	r0x03, F
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x1e
	MOVWF	POSTDEC1
	CALL	__mulint
	MOVWF	r0x04
	MOVFF	PRODL, r0x05
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVLW	LOW(_channel)
	ADDWF	r0x04, F
	MOVLW	HIGH(_channel)
	ADDWFC	r0x05, F
	MOVF	r0x04, W
	ADDLW	0x18
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x05, W
	MOVWF	r0x07
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, FSR0H
	MOVFF	POSTINC0, r0x06
	MOVFF	POSTINC0, r0x07
	MOVFF	POSTINC0, r0x08
	MOVFF	INDF0, r0x09
	MOVLW	0x10
	ADDWF	r0x04, F
	BTFSC	STATUS, 0
	INCF	r0x05, F
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, FSR0H
	MOVFF	POSTINC0, r0x04
	MOVFF	POSTINC0, r0x05
	MOVFF	POSTINC0, r0x0a
	MOVFF	INDF0, r0x0b
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	CALL	__divslong
	MOVWF	r0x04
	MOVFF	PRODL, r0x05
	MOVFF	PRODH, r0x0a
	MOVFF	FSR0L, r0x0b
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	CALL	__divslong
	MOVWF	r0x04
	MOVFF	PRODL, r0x05
	MOVFF	PRODH, r0x06
	MOVFF	FSR0L, r0x07
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	r0x04, POSTINC0
	MOVFF	r0x05, INDF0
;	.line	53; main.c	if (NPeriodosPassadosNoCanal[_channel]%2) /// Se o tempo que passou dentro do período for menor q a metade do tempo que é pra ficar on
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	CALL	__modsint
	MOVWF	r0x02
	MOVFF	PRODL, r0x03
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVF	r0x02, W
	IORWF	r0x03, W
	BZ	_00116_DS_
;	.line	55; main.c	c_c[_channel*2] = 0;
	MOVF	r0x00, W
	MOVWF	r0x02
; ;multiply lit val:0x02 by variable r0x02 and store in r0x02
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	BCF	STATUS, 0
	RLCF	r0x02, F
; ;multiply lit val:0x02 by variable r0x02 and store in r0x03
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	MOVLW	0x00
	BTFSC	r0x02, 7
	MOVLW	0xff
	BCF	STATUS, 0
	RLCF	r0x02, W
	MOVWF	r0x03
	CLRF	r0x04
	BTFSC	r0x03, 7
	SETF	r0x04
	MOVLW	LOW(_c_c)
	ADDWF	r0x03, F
	MOVLW	HIGH(_c_c)
	ADDWFC	r0x04, F
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	MOVLW	0x00
	MOVWF	POSTINC0
	MOVLW	0x00
	MOVWF	INDF0
;	.line	56; main.c	c_c[_channel*2+1] = 1;
	INCF	r0x02, F
; ;multiply lit val:0x02 by variable r0x02 and store in r0x02
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	BCF	STATUS, 0
	RLCF	r0x02, F
	CLRF	r0x03
	BTFSC	r0x02, 7
	SETF	r0x03
	MOVLW	LOW(_c_c)
	ADDWF	r0x02, F
	MOVLW	HIGH(_c_c)
	ADDWFC	r0x03, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVLW	0x01
	MOVWF	POSTINC0
	MOVLW	0x00
	MOVWF	INDF0
	BRA	_00118_DS_
; ;multiply lit val:0x02 by variable r0x00 and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
_00116_DS_:
;	.line	60; main.c	c_c[_channel*2] = 1;
	BCF	STATUS, 0
	RLCF	r0x00, F
; ;multiply lit val:0x02 by variable r0x00 and store in r0x01
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	MOVLW	0x00
	BTFSC	r0x00, 7
	MOVLW	0xff
	BCF	STATUS, 0
	RLCF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	BTFSC	r0x01, 7
	SETF	r0x02
	MOVLW	LOW(_c_c)
	ADDWF	r0x01, F
	MOVLW	HIGH(_c_c)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	MOVLW	0x01
	MOVWF	POSTINC0
	MOVLW	0x00
	MOVWF	INDF0
;	.line	61; main.c	c_c[_channel*2+1] = 0;
	INCF	r0x00, F
; ;multiply lit val:0x02 by variable r0x00 and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	BCF	STATUS, 0
	RLCF	r0x00, F
	CLRF	r0x01
	BTFSC	r0x00, 7
	SETF	r0x01
	MOVLW	LOW(_c_c)
	ADDWF	r0x00, F
	MOVLW	HIGH(_c_c)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVLW	0x00
	MOVWF	POSTINC0
	MOVLW	0x00
	MOVWF	INDF0
_00118_DS_:
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__up	code
_up:
;	.line	30; main.c	void up(int _channel)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	MOVFF	r0x0c, POSTDEC1
	MOVFF	r0x0d, POSTDEC1
	MOVFF	r0x0e, POSTDEC1
	MOVFF	r0x0f, POSTDEC1
	MOVFF	r0x10, POSTDEC1
	MOVFF	r0x11, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
;	.line	32; main.c	long timeInT = channel[_channel].currTime-(((int)(channel[_channel].currTime / channel[_channel].T))*channel[_channel].T);
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x1e
	MOVWF	POSTDEC1
	CALL	__mulint
	MOVWF	r0x02
	MOVFF	PRODL, r0x03
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVLW	LOW(_channel)
	ADDWF	r0x02, F
	MOVLW	HIGH(_channel)
	ADDWFC	r0x03, F
	MOVF	r0x02, W
	ADDLW	0x18
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x03, W
	MOVWF	r0x05
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, FSR0H
	MOVFF	POSTINC0, r0x04
	MOVFF	POSTINC0, r0x05
	MOVFF	POSTINC0, r0x06
	MOVFF	INDF0, r0x07
	MOVF	r0x02, W
	ADDLW	0x10
	MOVWF	r0x08
	MOVLW	0x00
	ADDWFC	r0x03, W
	MOVWF	r0x09
	MOVFF	r0x08, FSR0L
	MOVFF	r0x09, FSR0H
	MOVFF	POSTINC0, r0x08
	MOVFF	POSTINC0, r0x09
	MOVFF	POSTINC0, r0x0a
	MOVFF	INDF0, r0x0b
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	CALL	__divslong
	MOVWF	r0x0c
	MOVFF	PRODL, r0x0d
	MOVFF	PRODH, r0x0e
	MOVFF	FSR0L, r0x0f
	MOVLW	0x08
	ADDWF	FSR1L, F
	CLRF	WREG
	BTFSC	r0x0d, 7
	MOVLW	0xff
	MOVWF	r0x0e
	MOVWF	r0x0f
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x0f, W
	MOVWF	POSTDEC1
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	CALL	__mullong
	MOVWF	r0x0c
	MOVFF	PRODL, r0x0d
	MOVFF	PRODH, r0x0e
	MOVFF	FSR0L, r0x0f
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x0c, W
	SUBWF	r0x04, W
	MOVWF	r0x0c
	MOVF	r0x0d, W
	SUBWFB	r0x05, W
	MOVWF	r0x0d
	MOVF	r0x0e, W
	SUBWFB	r0x06, W
	MOVWF	r0x0e
	MOVF	r0x0f, W
	SUBWFB	r0x07, W
	MOVWF	r0x0f
;	.line	33; main.c	float perTimeUP = (float)channel[_channel].currTime/(float)channel[_channel].timeup;
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	CALL	___slong2fs
	MOVWF	r0x04
	MOVFF	PRODL, r0x05
	MOVFF	PRODH, r0x06
	MOVFF	FSR0L, r0x07
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVLW	0x0c
	ADDWF	r0x02, F
	BTFSC	STATUS, 0
	INCF	r0x03, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	POSTINC0, r0x02
	MOVFF	POSTINC0, r0x03
	MOVFF	POSTINC0, r0x10
	MOVFF	INDF0, r0x11
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	CALL	___slong2fs
	MOVWF	r0x02
	MOVFF	PRODL, r0x03
	MOVFF	PRODH, r0x10
	MOVFF	FSR0L, r0x11
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	CALL	___fsdiv
	MOVWF	r0x02
	MOVFF	PRODL, r0x03
	MOVFF	PRODH, r0x04
	MOVFF	FSR0L, r0x05
	MOVLW	0x08
	ADDWF	FSR1L, F
;	.line	34; main.c	if (timeInT<=perTimeUP*channel[_channel].T/2) /// Se o tempo que passou dentro do período for menor q a metade do tempo que é pra ficar on
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	CALL	___slong2fs
	MOVWF	r0x06
	MOVFF	PRODL, r0x07
	MOVFF	PRODH, r0x08
	MOVFF	FSR0L, r0x09
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	CALL	___fsmul
	MOVWF	r0x02
	MOVFF	PRODL, r0x03
	MOVFF	PRODH, r0x04
	MOVFF	FSR0L, r0x05
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVLW	0x40
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	CALL	___fsdiv
	MOVWF	r0x06
	MOVFF	PRODL, r0x07
	MOVFF	PRODH, r0x08
	MOVFF	FSR0L, r0x09
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x0f, W
	MOVWF	POSTDEC1
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	CALL	___slong2fs
	MOVWF	r0x0a
	MOVFF	PRODL, r0x0b
	MOVFF	PRODH, r0x0c
	MOVFF	FSR0L, r0x0d
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	CALL	___fsgt
	MOVWF	r0x06
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x06, W
	BNZ	_00108_DS_
;	.line	36; main.c	c_c[_channel*2] = 1;
	MOVF	r0x00, W
	MOVWF	r0x06
; ;multiply lit val:0x02 by variable r0x06 and store in r0x06
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	BCF	STATUS, 0
	RLCF	r0x06, F
; ;multiply lit val:0x02 by variable r0x06 and store in r0x07
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	MOVLW	0x00
	BTFSC	r0x06, 7
	MOVLW	0xff
	BCF	STATUS, 0
	RLCF	r0x06, W
	MOVWF	r0x07
	CLRF	r0x08
	BTFSC	r0x07, 7
	SETF	r0x08
	MOVLW	LOW(_c_c)
	ADDWF	r0x07, F
	MOVLW	HIGH(_c_c)
	ADDWFC	r0x08, F
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, FSR0H
	MOVLW	0x01
	MOVWF	POSTINC0
	MOVLW	0x00
	MOVWF	INDF0
;	.line	37; main.c	c_c[_channel*2+1] = 0;
	INCF	r0x06, F
; ;multiply lit val:0x02 by variable r0x06 and store in r0x06
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	BCF	STATUS, 0
	RLCF	r0x06, F
	CLRF	r0x07
	BTFSC	r0x06, 7
	SETF	r0x07
	MOVLW	LOW(_c_c)
	ADDWF	r0x06, F
	MOVLW	HIGH(_c_c)
	ADDWFC	r0x07, F
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, FSR0H
	MOVLW	0x00
	MOVWF	POSTINC0
	MOVLW	0x00
	MOVWF	INDF0
	BRA	_00110_DS_
_00108_DS_:
;	.line	39; main.c	else if (timeInT<=perTimeUP*channel[_channel].T) /// Se for a outra metade
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	CALL	___fsgt
	MOVWF	r0x02
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x02, W
	BNZ	_00110_DS_
; ;multiply lit val:0x02 by variable r0x00 and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
;	.line	41; main.c	c_c[_channel*2] = 0;
	BCF	STATUS, 0
	RLCF	r0x00, F
; ;multiply lit val:0x02 by variable r0x00 and store in r0x01
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	MOVLW	0x00
	BTFSC	r0x00, 7
	MOVLW	0xff
	BCF	STATUS, 0
	RLCF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	BTFSC	r0x01, 7
	SETF	r0x02
	MOVLW	LOW(_c_c)
	ADDWF	r0x01, F
	MOVLW	HIGH(_c_c)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	MOVLW	0x00
	MOVWF	POSTINC0
	MOVLW	0x00
	MOVWF	INDF0
;	.line	42; main.c	c_c[_channel*2+1] = 1;
	INCF	r0x00, F
; ;multiply lit val:0x02 by variable r0x00 and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	BCF	STATUS, 0
	RLCF	r0x00, F
	CLRF	r0x01
	BTFSC	r0x00, 7
	SETF	r0x01
	MOVLW	LOW(_c_c)
	ADDWF	r0x00, F
	MOVLW	HIGH(_c_c)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVLW	0x01
	MOVWF	POSTINC0
	MOVLW	0x00
	MOVWF	INDF0
_00110_DS_:
	MOVFF	PREINC1, r0x11
	MOVFF	PREINC1, r0x10
	MOVFF	PREINC1, r0x0f
	MOVFF	PREINC1, r0x0e
	MOVFF	PREINC1, r0x0d
	MOVFF	PREINC1, r0x0c
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	



; Statistics:
; code size:	 5172 (0x1434) bytes ( 3.95%)
;           	 2586 (0x0a1a) words
; udata size:	  148 (0x0094) bytes (11.56%)
; access size:	   18 (0x0012) bytes


	end
