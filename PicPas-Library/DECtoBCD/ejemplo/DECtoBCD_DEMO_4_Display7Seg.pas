// ------------------------------------------------------------------------
//
//  (C) AguHDz 02-SEP-2017
//  Ultima Actualizacion: 06-SEP-2017
//
//  Compilador PicPas v.0.7.6 (https://github.com/t-edson/PicPas)
//
//  Prueba de uso de la librería DECtoBCD que permite mostrar cualquier
//  resultado numérico entre 0000 y 9999 en 4 displays LED de 7 segmentos.
//  O entre 00 y 99 con dos displays.
//
// ------------------------------------------------------------------------

{$PROCESSOR PIC16F877A}
{$FREQUENCY 8 MHZ}
{$MODE PICPAS}

program Conversion_DECtoBCD;

uses {$PIC_MODEL}, DecToBCD;

var
  contador : word;

// FUNCIONES DE PRUEBA........
procedure Print_Numero_BCD(numero : word);
begin
  if((numero.high = $00) AND (numero.low < 100)) then
    numero.low := DecToBCD_2(numero.low);
  else
    numero := DecToBCD_4(numero);
  end;
  PORTC := numero.low;
  PORTD := numero.high;
end;

//***********************************************************************
// PROGRAMA PRINCIPAL ***************************************************
//***********************************************************************
begin
  ADCON1 := $07;           // Todos los pines configurados como digitales.
  ADCON0 := $00;           // Desactiva conversor A/D.
  SetAsOutput(PORTC);
  SetAsOutput(PORTD);
  PORTC:=0;
  PORTD:=0;
  
  contador := 0;
  while true do
    Print_Numero_BCD(contador);
    Inc(contador);
    // Acelera contaje a partir de valor 255.
    if(contador.high>$00) then contador := contador + 100 end; 
    // Espera desbordado mostrando EEEE y empieza de cero.
    if(contador.high>$40) then contador := 0 end;
    delay_ms(50);
  end;                        

end.

