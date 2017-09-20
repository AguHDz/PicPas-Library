//  
//  (C) AguHDz 01-AGO-2017
//  Ultima Actualizacion: 20-SEP-2017
//  
//  Librer�a : UARTSoft.pas
//  
//  Compilador PicPas v.0.7.7 (https://github.com/t-edson/PicPas)
//  
//  LIBRERIA DE COMUNICACION SERIE RS232 (UART) MEDIANTE SOFTWARE
//  =============================================================
//  Env�o y recepci�n de caracteres ASCII a trav�s del puerto serie RS232.
//  
//  Esta librer�a (UARTSoft) crea una unidad UART (Universal Asynchronous
//  Receiver-Transmitter) mediante software.
//  
//  Cualquier pin de los puertos I/O del microcontrolador es valido para
//  configurarse como l�nea de Transmisi�n (TX) o Recepci�n (RX) de
//  datos.
//  
//  Configurar los pines en el programa mediante las directivas:
//  
//  {$SET UART_PIN_RX = 'PORTB.7'}   // PUERTO DE RECEPCION RDX 
//  {$SET UART_PIN_TX = 'PORTB.6'}   // PUERTO DE TRANSMISION TDX
//  
//  Se utiliza el protocolo RS-232 en su configuracion m�s com�nn: 8 bits de
//  datos, 1 bit de Stop, sin paridad ni control de flujo (solo 2 hilos de
//  comunicaci�n). La velocidad, en bits por segundo (bps o baudios), se
//  configura en el programa mediante la directiva:
//  
//  {$SET BAUDIOS = 9600}     // VELOCIDAD DE COMUNICACION SERIE
//  
//  Cualquier velocidad es v�lida, siempre que la combinaci�n velocidad de
//  trabajo del microcontrolador (fijaca con {$FREQUENCY XXMhz}) y los baudios
//  no den lugar a un n�mero mayor de 255 (un byte) en los c�lculos de ciclos 
//  de espera que realiza la librer�a, en cuyo caso, lo advierte con un mensaje
//  de error durante el tipo de compilaci�n para se disminuya la velocidad de
//  reloj del microcontrolador o se eleve la velocidad de la comunicaci�n.
//  
//  En caso de microcontroladores PIC que dispongar de UART integrada en su
//  hardware, esta librer�a se puede utilizar para crear un segundo puerto de
//  comunicaciones serie, para uso de la aplicaci�n o para su uso durante la
//  depuraci�n del programa.
//
//  La librer�a completa solo ocupa 64 bytes.
//  