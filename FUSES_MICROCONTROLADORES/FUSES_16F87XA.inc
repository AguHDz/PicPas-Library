// CONFIGURATION WORD PIC16F87XA
// PIC16F873A
// PIC16F874A
// PIC16F876A
// PIC16F877A

// =======================================
// CP : FLASH Program Memory Code Protection bit.
{$DEFINE _CP_ON         =    1FFF}      // All program memory code-protected
{$DEFINE _CP_ALL        =    1FFF}      // All program memory code-protected
{$DEFINE _CP_OFF        =    3FFF}      // Code protection off
// DEBUG : In-Circuit Debugger Mode bit
// RB6-RB7 are dedicaded to the debugger.
{$DEFINE _DEBUG_ON      =    37FF}      // In-Circuit Debugger enabled, RB6 and RB7 are dedicated to the debugger
{$DEFINE _DEBUG_OFF     =    3FFF}      // In-Circuit Debugger disabled, RB6 and RB7 are general purpose I/O pins
// WRT1:WRT0 : Flash Program Memory Write Enable bits.
{$DEFINE _WRT_HALF      =    39FF}      // 0000h to 0FFFh write-protected; 1000h to 1FFFh may be written to by EECON control
{$DEFINE _WRT_1FOURTH   =    3BFF}      // 0000h to 07FFh write-protected; 0800h to 1FFFh may be written to by EECON control
{$DEFINE _WRT_256       =    3DFF}      // 0000h to 00FFh write-protected; 0100h to 1FFFh may be written to by EECON control
{$DEFINE _WRT_OFF       =    3FFF}      // Write protection off; all program memory may be written to by EECON control
// CPD : Data EEPROM Memory Code Protection bit.
{$DEFINE _CPD_ON        =    3EFF}      // Data EEPROM code-protected
{$DEFINE _CPD_OFF       =    3FFF}      // Data EEPROM code protection off
// LVP : Low-Voltage (Single-Supply) In-Circuit Serial Programming Enable bit.
{$DEFINE _LVP_OFF       =    3F7F}      // RB3 is digital I/O, HV on MCLR must be used for programming
{$DEFINE _LVP_ON        =    3FFF}      // RB3/PGM pin has PGM function; low-voltage programming enabled
// BOREN : Brown-out Reset Enable bit.
// Enable BOREN automatically enable PWRTEN, regardless of the
// value of bit PWRTEN. Ensure the PWRTEN is enable any time
// BOREN is enable.
{$DEFINE _BOREN_OFF     =    3FBF}      // BOR disabled
{$DEFINE _BOREN_ON      =    3FFF}      // BOR enabled
// /PWRTEN : Power-up Timer Enable bit.
{$DEFINE _PWRTEN_ON     =    3FF7}      // PWRT enabled
{$DEFINE _PWRTEN_OFF    =    3FFF}      // PWRT disabled
// WDTEN : Watchdog Timer Eneble bit.
{$DEFINE _WDT_OFF       =    3FFB}      // WDT disabled
{$DEFINE _WDT_ON        =    3FFF}      // WDT enabled
// FOSC1:FOSC2 : Oscilator Seleccion bits.
{$DEFINE _LP_OSC        =    3FFC}      // LP oscillator
{$DEFINE _XT_OSC        =    3FFD}      // XT oscillator
{$DEFINE _HS_OSC        =    3FFE}      // HS oscillator
{$DEFINE _RC_OSC        =    3FFF}      // RC oscillator
// =======================================
// The erased (unprogrammed) value of the configuration word is 3FFFFh.
// Configuration Word Address : 2007h.










