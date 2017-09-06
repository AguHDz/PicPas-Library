//  
//  (C) AguHDz 18-JUL-2017
//  Ultima Actualizacion: 06-SEP-2017
//  
//  Compilador PicPas v.0.7.6 (https://github.com/t-edson/PicPas)
//  
//  LIBRERIA DE FUNCIONES DE CONVERSION DE NUMEROS DECIMALES A BCD
//  

{$IFNDEF PIC_MODEL}
  {$ERROR 'Debe seleccionar un modelo de Microcontralador al inicio de su programa mediante la directiva $PROCESSOR.}  
{$ENDIF}

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
  aux := 9999;      // PicPas todavía no implementa la comparación word Var>Const.
  if(decimal > aux) then
    exit($EEEE);    // El valor decimal es mayor que 9999.
  end;              // Indica ERROR en valor decimal de entrada.
  bcd := 0; 
  aux := 999;
  while(decimal > aux) do       // Mientras decimal > 999.
    bcd     := bcd     + $1000;
    decimal := decimal - 1000; 
  end;
  aux := 99;
  while(decimal > aux) do       // Mientras decimal > 99.
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

