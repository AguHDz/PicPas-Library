//  
//  (C) AguHDz 30-SEP-2017
//  Ultima Actualizacion: 01-OCT-2017
//  
//  Librería : delay_us_Lib.pas
//  
//  Compilador PicPas v.0.7.8 (https://github.com/t-edson/PicPas)
//  
//  LIBRERIA PAUSAR PROGRAMA DURANTE MICROSEGUNDOS
//  ==============================================
//  PicPas incluye la función de sistema delay_ms() para pausar el 
//  programa durante microsegundos. Sin embargo, hay ocasiones
//  en se requieren pausar de microsegundos, especialmente cuando
//  se programan protocolos de comunicación con hardware exterior.
//  Esta librería automatiza la programación de pausas menores de
//  un milisegundo, para cualquier velocidad de reloj, utizando funciones
//  macro que insertarán en el programa el código de espera más 
//  eficiente en función de la velocidad de reloj del sistema y de
//  la pausa en microsegundos que se requiera.
// 