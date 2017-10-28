//  
//  (C) AguHDz 01-AGO-2017
//  Ultima Actualizacion: 20-SEP-2017
//  
//  Librería : UARTSoft.pas
//  
//  Compilador PicPas v.0.7.7 (https://github.com/t-edson/PicPas)
//  
//  LIBRERIA DE COMUNICACION SERIE RS232 (UART) MEDIANTE SOFTWARE
//  =============================================================
//  Envío y recepción de caracteres ASCII a través del puerto serie RS232.
//  
//  Esta librería (UARTSoft) crea una unidad UART (Universal Asynchronous
//  Receiver-Transmitter) mediante software.
//  
//  Cualquier pin de los puertos I/O del microcontrolador es valido para
//  configurarse como línea de Transmisión (TX) o Recepción (RX) de
//  datos.
//  
//  Configurar los pines en el programa mediante las directivas:
//  
//  {$SET UART_PIN_RX = 'PORTB.7'}   // PUERTO DE RECEPCION RDX 
//  {$SET UART_PIN_TX = 'PORTB.6'}   // PUERTO DE TRANSMISION TDX
//  
//  Se utiliza el protocolo RS-232 en su configuracion más comúnn: 8 bits de
//  datos, 1 bit de Stop, sin paridad ni control de flujo (solo 2 hilos de
//  comunicación). La velocidad, en bits por segundo (bps o baudios), se
//  configura en el programa mediante la directiva:
//  
//  {$SET BAUDIOS = 9600}     // VELOCIDAD DE COMUNICACION SERIE
//  
//  Cualquier velocidad es válida, siempre que la combinación velocidad de
//  trabajo del microcontrolador (fijaca con {$FREQUENCY XXMhz}) y los baudios
//  no den lugar a un número mayor de 255 (un byte) en los cálculos de ciclos 
//  de espera que realiza la librería, en cuyo caso, lo advierte con un mensaje
//  de error durante el tipo de compilación para se disminuya la velocidad de
//  reloj del microcontrolador o se eleve la velocidad de la comunicación.
//  
//  En caso de microcontroladores PIC que dispongar de UART integrada en su
//  hardware, esta librería se puede utilizar para crear un segundo puerto de
//  comunicaciones serie, para uso de la aplicación o para su uso durante la
//  depuración del programa.
//
//  La librería completa solo ocupa 64 bytes.
//  