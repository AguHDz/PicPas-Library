//  
//  (C) AguHDz 30-SEP-2017
//  Ultima Actualizacion: 01-OCT-2017
//  
//  DEMO Librería : delay_us_Lib.pas
//  
//  Compilador PicPas v.0.7.8 (https://github.com/t-edson/PicPas)
//  
//  LIBRERIA PAUSAR PROGRAMA DURANTE MICROSEGUNDOS
//  ==============================================
//  PicPas incluye la función de sistema delay_ms() para pausar el 
//  programa durante microsegundos. Sin embargo, hay ocasiones
//  en se requieren pausas de microsegundos, especialmente cuando
//  se programan protocolos de comunicación con hardware exterior.
//  Esta librería automatiza la programación de pausas menores de
//  un milisegundo, para cualquier velocidad de reloj, utizando funciones
//  macro que insertarán en el programa el código de espera más 
//  eficiente en función de la velocidad de reloj del sistema y de
//  la pausa en microsegundos que se requiera.
//  

{$PROCESSOR PIC16F84A}             
{$FREQUENCY 8 Mhz}

uses {$PIC_MODEL}, delay_us_Lib;

procedure delay_355us_PRECISO;
// Mínimo Error de 4 ciclos máquina por llamada y retorno de funcion.
begin
  delay_100us;
  delay_100us;
  delay_100us;
  delay_10us;
  delay_10us;
  delay_10us;
  delay_10us;
  delay_10us;
  {$DELAY_001_US}
  {$DELAY_001_US}
  {$DELAY_001_US}
  {$DELAY_001_US}
  {$DELAY_001_US}  // Dependiendo de la velocidad de reloj, se podría eliminar esta
                   // última pausa de 1 us para compensar los 4 ciclos de llamada a
                   // este procedimiento y aumentar la exactitud. Pero en la práctica,
                   // normalmente este mínimo error no tiene ninguna transcendencia.
end;

procedure delay_355_MUY_APROXIMADO;
// Pequeño Error por llamada a función y ciclos de los bucles de las funciones delay_x
begin
  delay_x100us(3);
  delay_x10us(5);
  // Para disminuir el pequeño error, no se suman lo 5 us restantes.
  // O se pueden añadir MACROS DELAY_001_US de manera experimental
  // en función de la velocidad de reloj del microcontrolador.
end;


// *****************************************************************
// PROGRAMA PRINCIPAL  *********************************************
// ***************************************************************** 
begin

// Pausa de 1 us
  {$DELAY_001_US}
// Pausa de 10 us
  {$DELAY_010_US}
// Pausa de 100 us
  {$DELAY_100_US}
// Pausa de 10 us
  delay_10us;
// Pausa de 100 us
  delay_100us;
// Pausa 50 us
  delay_x10us(1);
// Pausa 800 us
  delay_x100us(8);
// Pausa 355 us EXACTO
  delay_100us;
  delay_100us;
  delay_100us;
  delay_10us;
  delay_10us;
  delay_10us;
  delay_10us;
  delay_10us;
  {$DELAY_001_US}
  {$DELAY_001_US}
  {$DELAY_001_US}
  {$DELAY_001_US}
  {$DELAY_001_US}
// Pausa 355 us PRECISO
  delay_355us_PRECISO;
// Pausa 355 us MUY APROXIMADO
  delay_355_MUY_APROXIMADO;
  
end. 
