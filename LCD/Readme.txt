// ---------------------------------------------------------------------------------
//
//  (C) AguHDz 06-JUL-2017
//  Ultima Actualizacion: 01-SEP-2017
//
//  Compilador PicPas v.0.7.6 (https://github.com/t-edson/PicPas)
//
//  LIBRERIA MANEJO DE DISPLAY LCD (BUS DATOS: 8 o 4 BITS)
//  ======================================================
//  Para LCD compatibles con el estandar HITACHI HD44780 usando el modo Bus 
//  de Datos de 8 o 4 bits.
//  
// ---------------------------------------------------------------------------------
//
//  INSTRUCCIONES DE USO DE LIBRERIA:
//   
//   1. Seleccionar el microcontrolador y su velocidad.
//      {$PROCESSOR PIC16F84A}
//      {$FREQUENCY 8Mhz}
//
//   2. Seleccionar el modo de conexión del bus da datos del LCD (8 o 4 bits)
//      {$DEFINE LCD_BUS_DATA_BITS = 4} // Modo bus de datos 4 BITS.
//      {$DEFINE LCD_BUS_DATA_BITS = 8} // Modo bus de datos 8 BITS.
//
//   3. Configurar los pines de conexión entre entre el microcontrolador y el
//      display LCD.
//
//      > Para el modo bus 4 BITS no es necesario que los pines sean del mismo
//        puerto o que guarde ningún orden, se tratan de manera individual. Por
//        ejemplo, esta definición sería válida:
//        {$DEFINE LCD_PIN_DATA_4 = PORTA.1}  // BIT D0 BUS de datos 4 bits.
//        {$DEFINE LCD_PIN_DATA_5 = PORTC.5}  // BIT D1 BUS de datos 4 bits.
//        {$DEFINE LCD_PIN_DATA_6 = PORTB.1}  // BIT D2 BUS de datos 4 bits.
//        {$DEFINE LCD_PIN_DATA_7 = PORTB.2}  // BIT D3 BUS de datos 4 bits.
//
//      > Para el modo bus 8 BITS se debe definir un puerto completo como bus
//        de datos. Por ejemplo:
//        {$DEFINE LCD_PORT_DATA_8BIT = PORTB}  // Puerto de bus de datos de 8 BITS. 
//      
//   4. Configurar los pines de control RS y ENABLE.
//      {$DEFINE LCD_PIN_RS     = PORTA.0}  // SELECT REGISTER.
//      {$DEFINE LCD_PIN_EN     = PORTA.1}  // ENABLE STARTS DATA READ/WRITE.
//   
// ---------------------------------------------------------------------------------   
//  
//  INSTRUCCIONES DE CONEXIONADO ELECTRICO:
//  
//    ---- Alimentacion y Contraste ----
//   Vss  (LCD pin 1) a negativo alimentacion
//   Vdd  (LCD pin 2) a + 5V, (si no queremos controlar el apagado el LCD)
//   Contraste (LCD pin 3) a tierra a traves de una resistencia fija (p.e. 2K2,
//   menos valor = mayor contraste) o de un potenciometro ajustable de 5K.
//   
//   --- Alimentación eléctrica del LCD ---
//     +5v a Pin 2 del LCD (VDD)
//     GND a Pin 1 del LCD (VSS)
//   
//   ---- Control ----
//     RS (LCD pin 4) a PIC: LCD_RS
//     RW (LCD pin 5) a tierra (conectado a pin 1 del LCD)
//     E  (LCD pin 6) a PIC: LCD_EN
//
//   ---- Data bus 4 bits ----
//     D4 (LCD pin 11) a PIC: LCD_DATA_4
//     D5 (LCD pin 12) a PIC: LCD_DATA_5
//     D6 (LCD pin 13) a PIC: LCD_DATA_6
//     D7 (LCD pin 14) a PIC: LCD_DATA_7  
//   
//   ---- Data bus 8 bits ----
//     D0 (LCD pin  7) a PIC: LCD_DATA_0
//     D1 (LCD pin  8) a PIC: LCD_DATA_1
//     D2 (LCD pin  9) a PIC: LCD_DATA_2
//     D3 (LCD pin 10) a PIC: LCD_DATA_3  
//     D4 (LCD pin 11) a PIC: LCD_DATA_4
//     D5 (LCD pin 12) a PIC: LCD_DATA_5
//     D6 (LCD pin 13) a PIC: LCD_DATA_6
//     D7 (LCD pin 14) a PIC: LCD_DATA_7  
//  
// ---------------------------------------------------------------------------------
