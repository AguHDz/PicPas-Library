// ******* CALCULO DE CICLOS DELAY MICROSEGUNDOS **********

{$SET DEBUG_LIBRARY_UARTSOFT = 'ON'}   // Activa modo pruebas (DEBUG) de librería.
//{$SET DEBUG_LIBRARY_UARTSOFT = 'OFF'}    // Para usar la librería, SIEMPRE en OFF.

{$IF DEBUG_LIBRARY_UARTSOFT = 'ON'}
  {$PROCESSOR PIC16F84A}
  {$FREQUENCY 20 MHz}
  {$SET DELAY_US_TIME = 100}         // TIEMPO DE ESPERA EN MICROSEGUNDOS.
{$ENDIF}

{$IFNDEF DELAY_US_TIME}
  {$SET DELAY_US_TIME = 100}
{$ENDIF}

{$IF DELAY_US_TIME > 999}
  {$ERROR 'Para tiempos de espera superiores a 999 microsegundos, utilice la función de PicPas delay_ms().'}
{$ENDIF}

{$SET TIME_US_CICLO_MAQUINA = 4/PIC_FREQUEN*1000000}
{$MSGBOX "TIME_CICLO_MAQUINA = " + TIME_US_CICLO_MAQUINA}
{$SET CICLOS_DELAY_US = DELAY_US_TIME/TIME_US_CICLO_MAQUINA}
{$SET CICLOS_DELAY_1_US = 1/TIME_US_CICLO_MAQUINA}
{$MSGBOX "CICLOS_DELAY_US = " + CICLOS_DELAY_US}

// 2 ciclos de llamada a función delay.
// 2 ciclos de cargar de valores inciales de cuenta.
// 3*(CICLOS_DELAY_LOOP-1))+2 ciclos del bucle contador.
// 2 ciclos de retorno de función.
// Por lo tanto: CICLOS_DELAY = 2 + 2 + 3*(CICLOS_DELAY_LOOP-1))+2 + 2 = 8+3*(CICLOS_DELAY_LOOP-1)
//	  movlw	     CICLOS_DELAY_1
//	  movwf	     d1
//  Delay_0:               
//	  decfsz     d1, f
//	  goto       Delay_0
{$SET CICLOS_DELAY_US_LOOP = ROUND((((CICLOS_DELAY_US) - 8 ) / 3) + 1)}
{$MSGBOX "CICLOS_DELAY_US_LOOP = " + CICLOS_DELAY_US_LOOP}


// 2 ciclos de llamada a función delay.
// 4 ciclos de cargar de valores inciales de cuenta.
// Primer ciclo LOOP (5*(CICLOS_DELAY_1-1)) // después de este ciclo d1 se desborda y tras primer decfsz vale 0xFF en cada loop de d2.
// Ciclos posteriores LOOP ((CICLOS_DELAY_2-1)*(5*256))
// 4 del último ciclo en que d1 y d2 son cero.
// 2 ciclos de retorno de función.
// Por lo tanto: CICLOS_DELAY = 2 + 4 + 5*(CICLOS_DELAY_1-1) + (CICLOS_DELAY_2-1)*(5*256) + 4 + 2 = 12+5*(CICLOS_DELAY_1-1)+1280*(CICLOS_DELAY_2-1)
//	  movlw	     CICLOS_DELAY_1
//	  movwf	     d1
//    movlw      CICLOS_DELAY_2
//    movwf      d2
//  Delay_0:               
//	  decfsz     d1, f
//    goto       $+2
//    decfsz     d2, f
//	  goto       Delay_0
{$SET CICLOS_DELAY_2_US_LOOP = TRUNC((((CICLOS_DELAY_US) - 12 ) / 1280) + 1)}
{$SET CICLOS_DELAY_1_US_LOOP = ROUND((((CICLOS_DELAY_US-12)-(1280*(CICLOS_DELAY_2_US_LOOP-1)))/5))}
{$MSGBOX "CICLOS_DELAY_2_US_LOOP = " + CICLOS_DELAY_2_US_LOOP + "\nCICLOS_DELAY_1_US_LOOP = " + CICLOS_DELAY_1_US_LOOP}

// ******* SELECCION DE TIPO DE LOOP A INSERTAR ***********************
{$IF CICLOS_DELAY_US_LOOP > 255}
  {$SET DELAY_US = '__delay_ms_2(' + CICLOS_DELAY_1_US_LOOP + ',' + CICLOS_DELAY_2_US_LOOP + ')'}
{$ENDIF}
{$IF CICLOS_DELAY_US_LOOP < 9}
  {$SET DELAY_US = "ASM\n  nop\nEND\n"}
{$ENDIF}
{$IFNDEF DELAY_US}
//  {$SET DELAY_US = '__delay_ms_1(' + CICLOS_DELAY_US_LOOP + ')'}
{$SET CONTADOR_CICLOS_DELAY = 8 + (CICLOS_DELAY_US_LOOP-1)*3}
  {$SET DELAY_US ="ASM\n  movlw " + CICLOS_DELAY_US_LOOP + " \n  movwf d1\n  Delay_0:\n  decfsz d1, f\n  goto Delay_0\nEND\n"}
{$ENDIF}
// **********************************************************************

// ******* BLOQUES ASM DE ESPERA **************
{$IF CICLOS_DELAY_US_LOOP > 255}
  {$SET CONTADOR_CICLOS_DELAY = 12+5*(CICLOS_DELAY_1_US_LOOP-1)+1280*(CICLOS_DELAY_2_US_LOOP-1)}
  {$SET DELAY_US = ""}
  {$SET DELAY_US = DELAY_US + " ASM                                        \n\r"} 
  {$SET DELAY_US = DELAY_US + "   movlw      " + CICLOS_DELAY_1_US_LOOP + "\n\r"}
  {$SET DELAY_US = DELAY_US + "   movwf      d1                            \n\r"}
  {$SET DELAY_US = DELAY_US + "   movlw      " + CICLOS_DELAY_2_US_LOOP + "\n\r"}
  {$SET DELAY_US = DELAY_US + "   movwf      d2                            \n\r"}
  {$SET DELAY_US = DELAY_US + " Delay_0:                                   \n\r"}
  {$SET DELAY_US = DELAY_US + "   decfsz     d1, f                         \n\r"}
  {$SET DELAY_US = DELAY_US + "   goto       $+2                           \n\r"}
  {$SET DELAY_US = DELAY_US + "   decfsz     d2, f                         \n\r"}
  {$SET DELAY_US = DELAY_US + "   goto       Delay_0                       \n\r"}
  {$SET DELAY_US = DELAY_US + " END                                        \n\r"}
{$ENDIF}

{$IF CICLOS_DELAY_US_LOOP < 9}
  {$SET DELAY_US = ""}
  {$SET DELAY_US = DELAY_US + "ASM   \n\r"}
  {$SET DELAY_US = DELAY_US + "  nop \n\r"}  // PONER LOS nop O goto $+1 NECESARIOS PARA TODOS LOS VALORES MENORES DE 9
  {$SET DELAY_US = DELAY_US + "END   \n\r"}
  {$SET CICLOS_DELAY_US_LOOP = 256}   // PARA SALTE EL CODIGO DEL $IF SIGUIENTE.
{$ENDIF}

{$IF CICLOS_DELAY_US_LOOP < 256}
  {$SET CONTADOR_CICLOS_DELAY = 8 + (CICLOS_DELAY_US_LOOP-1)*3}
  {$SET DELAY_US = ""}
  {$SET DELAY_US = DELAY_US + "  ASM                                      \n\r"}   
  {$SET DELAY_US = DELAY_US + "    movlw      " + CICLOS_DELAY_US_LOOP + "\n\r"}
  {$SET DELAY_US = DELAY_US + "    movwf      d1                          \n\r"}
  {$SET DELAY_US = DELAY_US + "  Delay_0:                                 \n\r"}      
  {$SET DELAY_US = DELAY_US + "    decfsz     d1, f                       \n\r"}
  {$SET DELAY_US = DELAY_US + "    goto       Delay_0                     \n\r"}
  {$SET DELAY_US = DELAY_US + "  END                                      \n\r"}
{$ENDIF}

{$MSGBOX "DELAY_US = " + DELAY_US}

