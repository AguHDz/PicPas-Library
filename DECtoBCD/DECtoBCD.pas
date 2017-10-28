//  
//  (C) AguHDz 18-JUL-2017
//  Ultima Actualizacion: 20-SEP-2017
//  
//  Compilador PicPas v.0.7.7 (https://github.com/t-edson/PicPas)
//  
//  LIBRERIA DE FUNCIONES DE CONVERSION DE NUMEROS DECIMALES A BCD
//
//  Una de sus principales aplicaciones sería mostrar resultados numéricos
//  en display LED de 7 segmentos como se muestra en el ejemplo de uso de
//  la librería.
//  

unit DECtoBCD;

interface

procedure DecToBCD_2(decimal : byte) : byte;
procedure DecToBCD_4(decimal : word) : word;

implementation

//***********************************************************************
//  FUNCION: DecToBCD
//  Devuelve el valor de entrada decimal en formato BCD de 2 digitos.
//***********************************************************************
procedure DecToBCD_2(decimal : byte) : byte;
var
  bcd : byte;
begin
  if(decimal > 99) then
    exit($EE);         // Indica ERROR en valor decimal de entrada.
  end; 
  bcd := 0;
  while(decimal>9) do          // Mientras decimal > 9.
    bcd     := bcd     + $10;
    decimal := decimal - 10; 
  end;
  bcd := bcd + decimal;        // Suma el resto < 9.
  exit(bcd);                   // Devuelve valor en formato BCD.
end;

//***********************************************************************
//  FUNCION: DecToBCD
//  Devuelve el valor de entrada decimal en formato BCD de 4 digitos.
//***********************************************************************
procedure DecToBCD_4(decimal : word) : word;
var
  bcd : word;
  aux : word;
begin
  if(decimal > 9999) then
    exit($EEEE);    // El valor decimal es mayor que 9999.
  end;              // Indica ERROR en valor decimal de entrada.
  bcd := 0; 
  while(decimal > 999) do       // Mientras decimal > 999.
    bcd     := bcd     + $1000;
    decimal := decimal - 1000; 
  end;
  while(decimal > word(99)) do       // Mientras decimal > 99.
    bcd     := bcd     + word($100);
    decimal := decimal - word(100); 
  end;
  while(decimal.low > 9) do    // Mientras decimal > 9.
    bcd     := bcd     + word($10);
    decimal := decimal - word(10); 
  end;
  bcd := bcd + decimal;        // Suma el resto < 9.
  exit(bcd);                   // Devuelve valor en formato BCD.
end;

end.

