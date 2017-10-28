// CONFIGURATION WORD PIC16F84A

// =======================================
// CP : FLASH Program Memory Code Protection bit.
{$DEFINE _CP_ON         =     $000F}   // All program memory is code protected
{$DEFINE _CP_OFF        =     $3FFF}   // Code protection disabled
// /PWRTEN : Power-up Timer Enable bit.
{$DEFINE _PWRTEN_ON     =     $3FF7}   // Power-up Timer is enabled
{$DEFINE _PWRTEN_OFF    =     $3FFF}   // Power-up Timer is disabled
// WDTEN : Watchdog Timer Eneble bit.
{$DEFINE _WDT_OFF       =     $3FFB}   // WDT disabled
{$DEFINE _WDT_ON        =     $3FFF}   // WDT enabled
// FOSC1:FOSC2 : Oscilator Seleccion bits.
{$DEFINE _LP_OSC        =     $3FFC}   // LP oscillator
{$DEFINE _XT_OSC        =     $3FFD}   // XT oscillator
{$DEFINE _HS_OSC        =     $3FFE}   // HS oscillator
{$DEFINE _RC_OSC        =     $3FFF}   // RC oscillator
// =======================================
// The erased (unprogrammed) value of the configuration word is 3FFFFh.
// Configuration Word Address : 2007h.