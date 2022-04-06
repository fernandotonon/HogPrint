/**  @file inpout32_test.c
     @brief Test program for inpout32 DLL.

     Find more information about Inpout32 at
     http://www.logix4u.net/inpout32.htm

<br> Copyright (C) 2007 Douglas Beattie Jr
<br> beattidp@ieee.org
<br> http://www.hytherion.com/beattidp/

     @warning
     Be sure to change PPORT_BASE (Port Base address)
     accordingly if your LPT port is addressed

     @note
	Last change: DBJR 12/25/2007 7:38:24 PM
*/

/*   Known to build successfully with the following
     compilers:

    [ gcc-MinGW32 ]
    gcc.exe ./inpout32_test.c  ./inpout32.c  -oTEST -I"."

    [ Borland C++ 5.5 ]
    BCC32 -I. inpout32_test.c inpout32.c

    [ Microsoft Visual C++ v6 ]
    CL -I. inpout32_test.c inpout32.c
*/

#include <stdio.h>
#include <conio.h>
#include <windows.h>

#include "inpout32.h"    // our non-system header in quotes


#define PPORT_BASE ((short) 0x378) //! < CHANGE THIS IF NEEDED !


// Prototypes for Test functions
static void test_read8(void);
static void test_write(void);
static void test_write_datum(short datum);


int main(void)
{
     HINSTANCE hLib;

     // Attempt to initialize the interface
     if (inpout32_init() != 0) {

          fprintf(stderr,
               "ERROR: Failed to initialize Inpout32 interface!\n");

          exit (-1);
     }

/* *************************************************** */
/*  IF WE REACHED HERE, INITIALIZED SUCCESSFUL    **** */
/* *************************************************** */

     /* now test the functions */

     /// Read 8 bytes at I/O base address
     test_read8();

     /// Write 0x75 to data register and verify
     test_write();

     /// One more time, different value, 0xAA
     test_write_datum(0xAA);

     /// One more time, different value, 0x33
     test_write_datum(0x33);

     /// One more time, different value, 0x55
     test_write_datum(0x55);

     /* finished - unload library and exit */
     inpout32_unload();

     return 0;
}

/*
   TEST:  Read inputs of 8 registers from PORT_BASE address
 */
void test_read8(void) {

     short x;
     short i;

     /* Try to read 0x378..0x37F, LPT1:  */

     for (i=PPORT_BASE; (i<(PPORT_BASE+8)); i++) {

          x = Inp32(i);

          printf("Port read (%04X)= %04X\n",i,x);
     }

     return;
}

/*
   TEST:  Write constant 0x75 to PORT_BASE (Data register)
 */
void test_write(void) {
     short x;
     short i;

     /// Write the data register

     i=PPORT_BASE;
     x=0x75;

     /// Write the data register
     Out32(i,x);

     printf("Port write to 0x%X, datum=0x%2X\n" ,i ,x);

     /// And read back to verify
     x = Inp32(i);
     printf("Port read (%04X)= %04X\n",i,x);


     /// Set all bits high
     x=0xFF;
     Out32(i,x);

     /// Set bi-directional and read again
     Out32(PPORT_BASE+2,0x20);     // Activate bi-directional
     x = Inp32(i);
     printf("Set Input, read (%04X)= %04X\n",i,x);

     Out32(PPORT_BASE+2,0x00);     // Set Output-only again
     x = Inp32(i);
     printf("Reset Ouput, read (%04X)= %04X\n",i,x);

     return;
}

/*
   TEST:  Write data from parameter
 */
void test_write_datum(short datum) {
     short x;
     short i;

     i=PPORT_BASE;
     x = datum;

     /*****  Write the data register */
     Out32(i,x);

     printf("Port write to 0x%X, datum=0x%2X\n" ,i ,x);

     /***** And read back to verify  */
     x = Inp32(i);
     printf("Port read (%04X)= %04X\n",i,x);

     return;
}

