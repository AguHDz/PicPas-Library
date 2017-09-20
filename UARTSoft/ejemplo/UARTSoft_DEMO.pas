//  
//  (C) AguHDz 27-JUN-2017
//  Ultima Actualizacion: 20-SEP-2017
//  Compilador PicPas v.0.7.7 (https://github.com/t-edson/PicPas)
//  
//  COMUNICACION SERIE RS232 (UART) MEDIANTE SOFTWARE
//  =================================================
//  Envío y recepción de caracteres ASCII mediante puerto serie RS232 usando la
//  librería UARTSoft que crea una unidad UART (Universal Asynchronous
//  Receiver-Transmitter) mediante software.
//  
//  Cualquier pin de los puertos I/O del microcontrolador es valido para
//  configurarse como linea de Transmision (TX) o Recepcion (RX) de datos.
//  
//  La librería UARTSoft utiliza el protocolo RS-232 en su configuracion más
//  común: 8 bits de datos, 1 bit de Stop, sin paridad ni control de flujo
//  (solo 2 hilos de comunicacion).
//  

{$PROCESSOR PIC16F84A}             
{$FREQUENCY 8Mhz}

{$SET BAUDIOS = 9600}              // VELOCIDAD DE COMUNICACION SERIE
{$SET UART_PIN_RX = 'PORTB_RB7'}   // PUERTO DE RECEPCION RDX 
{$SET UART_PIN_TX = 'PORTB_RB6'}   // PUERTO DE TRANSMISION TDX

uses {$PIC_MODEL}, UARTSoftLib;

// *****************************************************************
// PROGRAMA PRINCIPAL  *********************************************
// ***************************************************************** 
begin

  UARTSoft_Init;              // Inicializa puertos de comunicacion TX y RX.  

  UARTSoft_SendChar('H');     // Mensaje HOLA MUNDO
  UARTSoft_SendChar('O');
  UARTSoft_SendChar('L');
  UARTSoft_SendChar('A');
  UARTSoft_SendChar(' ');
  UARTSoft_SendChar('M');
  UARTSoft_SendChar('U');
  UARTSoft_SendChar('N');
  UARTSoft_SendChar('D');
  UARTSoft_SendChar('O');
  UARTSoft_SendChar(Char_LF); // Salto de Linea.
  UARTSoft_SendChar(Char_CR); // Retorno de Carro.

  repeat
    UARTSoft_SendChar(UARTSoft_GetChar);  // Escribe en el terminal cada caracter recibido (ECHO)
  until false;

end. 
