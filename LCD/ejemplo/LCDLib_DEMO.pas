// ****************************************************************************
//  (C) AguHDz 06-JUL-2017
//  Ultima Actualizacion: 10-SEP-2017
//  Prueba para compilador PicPas v.0.7.6
// 
//  Demo de libreria para uso de displays LCD
//  =========================================
//  Imprime de manera repatitiva la demostración en cualquier LCD compatible
//  con el estándar HITACHI HD44780.
//
// ****************************************************************************

{ --- DEFINICION DE MICROCONTROLADOR --- }
{$PROCESSOR PIC16F84A}
{$FREQUENCY 8Mhz}
// ****************************************************************
{ --- CONFIGURACION DE MICROCONTROLADOR (FUSES) --- }
{$IF PIC_MODEL = 'PIC16F84A'}
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
  {$CONFIG _CP_OFF, _PWRTEN_ON, _WDT_OFF, _HS_OSC}
  // =======================================
{$ELSE}
  {$MSGBOX 'FUSES DE ' + PIC_MODEL + ' NO CONFIGURADOS.'}
{$ENDIF}
// ****************************************************************
{ --- PARAMETROS DE CONFIGURACION DE LIBRERIA LCD --- }
{$DEFINE LCD_BUS_DATA_BITS = 4}  // Bits de datos usado por display (8 o 4)
// < MODO BUS DE DATOS 4 BITS >
{$IF LCD_BUS_DATA_BITS = 4}         // Si Modo bus de datos 4 BITS.
  {$DEFINE LCD_PIN_DATA_4 = PORTB.4}  // BIT D0 BUS de datos 4 bits.
  {$DEFINE LCD_PIN_DATA_5 = PORTB.5}  // BIT D1 BUS de datos 4 bits.
  {$DEFINE LCD_PIN_DATA_6 = PORTB.6}  // BIT D2 BUS de datos 4 bits.
  {$DEFINE LCD_PIN_DATA_7 = PORTB.7}  // BIT D3 BUS de datos 4 bits. 
{$ENDIF}
// < MODO BUS DE DATOS 8 BITS >
{$IF LCD_BUS_DATA_BITS = 8}         // Si Modo bus de datos 8 BITS.
  {$DEFINE LCD_PORT_DATA_8BIT = PORTB}  // Puerto de bus de datos de 8 BITS.
{$ENDIF}
// < COMUN PARA BUS DE 4 Y 8 BITS > 
{$DEFINE LCD_PIN_RS     = PORTA.0}  // SELECT REGISTER.
{$DEFINE LCD_PIN_EN     = PORTA.1}  // ENABLE STARTS DATA READ/WRITE.
// ****************************************************************

program LCDLib_DEMO;

uses {$PIC_MODEL}, LCDLib; 

const
  PAUSA = 50;
  
  SMILE_ALEGRE     = 0;         // Custom Character 0
  SMILE_ALEGRE_0   = %00000000;
  SMILE_ALEGRE_1   = %00001010;
  SMILE_ALEGRE_2   = %00000000;
  SMILE_ALEGRE_3   = %00000000;
  SMILE_ALEGRE_4   = %00010001;
  SMILE_ALEGRE_5   = %00001110;
  SMILE_ALEGRE_6   = %00000000;
  SMILE_ALEGRE_7   = %00000000;
  
  SMILE_TRISTE     = 1;         // Custom Character 1
  SMILE_TRISTE_0   = %00000000;
  SMILE_TRISTE_1   = %00001010;
  SMILE_TRISTE_2   = %00000000;
  SMILE_TRISTE_3   = %00000000;
  SMILE_TRISTE_4   = %00000000;
  SMILE_TRISTE_5   = %00001110;
  SMILE_TRISTE_6   = %00010001;
  SMILE_TRISTE_7   = %00000000;  

var
  Counter, Number : byte;
  
procedure EsperaPausas(Pausas : byte);
begin
  while(Pausas>0) do    
    delay_ms(PAUSA);
    dec(Pausas);
  end;
end;  

procedure LCD_PrintPicPas;
begin
  LCD_WriteChar('P');
  LCD_WriteChar('i');
  LCD_WriteChar('c');
  LCD_WriteChar('P');
  LCD_WriteChar('a');
  LCD_WriteChar('s');
  LCD_WriteChar(' ');
  LCD_WriteChar('0');
  LCD_WriteChar('.');
  LCD_WriteChar('7');
  LCD_WriteChar('.');
  LCD_WriteChar('6'); 
end;

procedure LCD_PrintDEMOLCDLib;
begin  
  LCD_WriteChar('D');
  LCD_WriteChar('E');
  LCD_WriteChar('M');
  LCD_WriteChar('O');
  LCD_WriteChar(' ');
  LCD_WriteChar('L');
  LCD_WriteChar('C');
  LCD_WriteChar('D');
  LCD_WriteChar('L');
  LCD_WriteChar('i');
  LCD_WriteChar('b');
end;

procedure LCD_BlinkDisplay(Flashes: byte);
begin
  while(Flashes>0) do
    LCD_DisplayOff;
    EsperaPausas(10);
    LCD_DisplayOn;
    EsperaPausas(10);
    dec(Flashes);
  end; 
end;  

//***************************************************************************//
// PROGRAMA PRINCIPAL
//***************************************************************************//
begin
  LCD_Init(16,2);   // LCD 16x2
  
  LCD_CreateChar(SMILE_ALEGRE,         // Custom Character SMILE_ALEGRE
                 SMILE_ALEGRE_0,
                 SMILE_ALEGRE_1,
                 SMILE_ALEGRE_2,
                 SMILE_ALEGRE_3,
                 SMILE_ALEGRE_4,
                 SMILE_ALEGRE_5,
                 SMILE_ALEGRE_6,
                 SMILE_ALEGRE_7);

  LCD_CreateChar(SMILE_TRISTE,         // Custom Character SMILE_TRISTE
                 SMILE_TRISTE_0,
                 SMILE_TRISTE_1,
                 SMILE_TRISTE_2,
                 SMILE_TRISTE_3,
                 SMILE_TRISTE_4,
                 SMILE_TRISTE_5,
                 SMILE_TRISTE_6,
                 SMILE_TRISTE_7);
  
  while true do    
    LCD_gotoXY(1,0);
    LCD_PrintDEMOLCDLib;    
    EsperaPausas(20);
      
    LCD_CursorHome;
    LCD_Cursor(true, true, false);
    LCD_WriteChar('H');
    LCD_WriteChar('O');
    LCD_WriteChar('L');
    LCD_WriteChar('A');
    EsperaPausas(20); 
    LCD_CursorBlink;
    EsperaPausas(40);
    LCD_CursorUnderlineBlink;
    LCD_WriteChar(' ');
    EsperaPausas(3);
    LCD_WriteChar('M');
    EsperaPausas(3);
    LCD_WriteChar('U');
    EsperaPausas(3);
    LCD_WriteChar('N');
    EsperaPausas(3);
    LCD_WriteChar('D');
    EsperaPausas(3);
    LCD_WriteChar('O');    
    EsperaPausas(5);
    
    for Counter:=0 to 5 do
      LCD_DisplayCursorRight;
      EsperaPausas(10);
    end;
    
    for Counter:=0 to 5 do   
      EsperaPausas(10);
      LCD_DisplayCursorLeft;
    end;    
    
    LCD_CursorUnderline;
    for Counter:=0 to 2 do   
      EsperaPausas(5);
      LCD_WriteChar('.');
    end;
    EsperaPausas(10);
    
    LCD_BlinkDisplay(3);
    EsperaPausas(3);
    
    LCD_CursorOff;
    
    LCD_WriteChar(chr(SMILE_ALEGRE));
    LCD_DisplayCursorLeft;
    EsperaPausas(20);
    LCD_WriteChar(chr(SMILE_TRISTE));
    EsperaPausas(3);
    
    for Counter:=0 to 15 do
      LCD_DisplayShiftRight;
      EsperaPausas(1);
    end;
    
    for Counter:=0 to 15 do
      LCD_DisplayShiftLeft;
      EsperaPausas(1);
    end;

    LCD_DisplayCursorRight;
    LCD_DisplayCursorRight;
    LCD_PrintPicPas;
       
    for Counter:=0 to 13 do
      LCD_DisplayShiftLeft;
      EsperaPausas(1);
    end;
    
    EsperaPausas(6);
    LCD_BlinkDisplay(3);
    
    LCD_Clear;
    LCD_gotoXY(0,2);
    LCD_PrintPicPas;
    EsperaPausas(6);

    for Number:=1 to 5 do    
      for Counter := 0 to 7 do
        LCD_gotoXY(1,7-Counter);
        LCD_WriteChar('<');
        LCD_gotoXY(1,8+Counter);
        LCD_WriteChar('>');
        EsperaPausas(3);
      end;
      
      for Counter := 0 to 7 do
        LCD_gotoXY(1,7-Counter);
        LCD_WriteChar(' ');
        LCD_gotoXY(1,8+Counter);
        LCD_WriteChar(' ');
        EsperaPausas(3);
      end;
      
      for Counter := 0 to 7 do
        LCD_gotoXY(1,Counter);
        LCD_WriteChar('>');
        LCD_gotoXY(1,15-Counter);
        LCD_WriteChar('<');
        EsperaPausas(3);
      end;
    end;   

    delay_ms(1000);
    LCD_Clear;
    delay_ms(1000);
  end;
end.
///***************************************************************************//
