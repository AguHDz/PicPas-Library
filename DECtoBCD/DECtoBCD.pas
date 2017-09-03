//  
//  (C) AguHDz 18-JUL-2017
//  Ultima Actualizacion: 03-SEP-2017
//  
//  Compilador PicPas v.0.7.6 (https://github.com/t-edson/PicPas)
//  
//  LIBRERIA DE FUNCIONES DE CONVERSION DE NUMEROS DECIMALES A BCD
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
  if (decimal > 99) then exit($EE) end;  // Indica ERROR en valor decimal de entrada.
  bcd := 0;
  // Mientras decimal > 9
  while(decimal > 9) do
    bcd     := bcd + $10;
    decimal := decimal - 10; 
  end;
  bcd := bcd + decimal;
  exit(bcd);
end;

//***********************************************************************
//  FUNCION: DecToBCD
//  Devuelve el valor de entrada decimal en formato BCD de 4 digitos.
//***********************************************************************
procedure DecToBCD_4(decimal : word) : word;
var
  bcd : word;
begin
  if ((decimal.high > $27) OR ((decimal.high = $27) AND (decimal.low > $0F))) then
    exit($EEEE);    // El valor decimal es mayor que 9999   (9999 = $270F)
  end;  // Indica ERROR en valor decimal de entrada.
  bcd := 0; 
  // Mientras decimal > 999  (999 = $03E7)
  while ((decimal.high > $03) OR ((decimal.high = $03) AND (decimal.low > $E7))) do
    bcd     := bcd + $1000;
    decimal := decimal - 1000; 
  end;
  // Mientras decimal > 99
  while ((decimal.high > $00) OR ((decimal.high = $00) AND (decimal.low > 99))) do
    bcd     := bcd + word($100);
    decimal := decimal - word(100); 
  end;
  // Mientras decimal > 9
  while (decimal.low > 9) do
    bcd     := bcd + word($10);
    decimal := decimal - word(10); 
  end;
  bcd := bcd + decimal; 
  exit(bcd);
end;

end.

