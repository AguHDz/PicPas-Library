//  
//  (C) AguHDz 30-SEP-2017
//  Ultima Actualizacion: 01-OCT-2017
//  
//  Librer�a : delay_us_Lib.pas
//  
//  Compilador PicPas v.0.7.8 (https://github.com/t-edson/PicPas)
//  
//  LIBRERIA PAUSAR PROGRAMA DURANTE MICROSEGUNDOS
//  ==============================================
//  PicPas incluye la funci�n de sistema delay_ms() para pausar el 
//  programa durante microsegundos. Sin embargo, hay ocasiones
//  en se requieren pausar de microsegundos, especialmente cuando
//  se programan protocolos de comunicaci�n con hardware exterior.
//  Esta librer�a automatiza la programaci�n de pausas menores de
//  un milisegundo, para cualquier velocidad de reloj, utizando funciones
//  macro que insertar�n en el programa el c�digo de espera m�s 
//  eficiente en funci�n de la velocidad de reloj del sistema y de
//  la pausa en microsegundos que se requiera.
// 