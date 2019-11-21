#INCLUDE <P16F628A.INC>		;ARQUIVO PADR�O MICROCHIP PARA 16F628A
RADIX DEC
__CONFIG H'3F10'

	CBLOCK	0x20	;ENDERE�O INICIAL DA MEM�RIA DE USU�RIO
	CONTADOR1
	CONTADOR2
	CONTADOR3
	ENDC			;FIM DO BLOCO DE MEM�RIA		

#DEFINE	BOTAO	PORTA,2	;PORTA DO BOT�O
					; 0 -> PRESSIONADO
					; 1 -> LIBERADO

#DEFINE	LED1	PORTB,0	;PORTA DO LED 0 -> APAGADO 1 -> ACESO
#DEFINE	LED2	PORTB,1	;PORTA DO LED 0 -> APAGADO 1 -> ACESO
#DEFINE	LED3	PORTB,2	;PORTA DO LED 0 -> APAGADO 1 -> ACESO
#DEFINE	LED4	PORTB,3	;PORTA DO LED 0 -> APAGADO 1 -> ACESO
#DEFINE	LED5	PORTB,4	;PORTA DO LED 0 -> APAGADO 1 -> ACESO
#DEFINE	LED6	PORTB,5 ;PORTA DO LED 0 -> APAGADO 1 -> ACESO

	ORG	0x00		;ENDERE�O INICIAL DE PROCESSAMENTO
	GOTO	INICIO
	
INICIO
	CLRF	PORTA		;LIMPA O PORTA
	CLRF	PORTB		;LIMPA O PORTB
	BSF STATUS, RP0			;ALTERA PARA O BANCO 1
	MOVLW	B'00000100'
	MOVWF	TRISA		;DEFINE RA2 COMO ENTRADA E DEMAIS COMO SA�DAS
	CLRF	TRISB		;DEFINE TODO O PORTB COMO SA�DA
	CLRF	INTCON		;TODAS AS INTERRUP��ES DESLIGADAS	
	BCF STATUS, RP0 ;RETORNA PARA O BANCO 0
	MOVLW	B'00000111'
	MOVWF	CMCON		;DEFINE O MODO DO COMPARADOR ANAL�GICO

MAIN
	CALL PISCALED
	GOTO MAIN
	
	TIMEOUT
		
		MOVLW 6
		MOVWF CONTADOR1

		BTFSC BOTAO
		CALL BUTTONTIMEOUT
		
		ATRASO1
			MOVLW 250
			MOVWF CONTADOR2
				
				ATRASO2
					MOVLW 221
					MOVWF CONTADOR3
						
					ATRASO3
						DECFSZ CONTADOR3
						GOTO ATRASO3
				
				DECFSZ CONTADOR2
				GOTO ATRASO2
		
		DECFSZ CONTADOR1
		GOTO ATRASO1

	RETURN 
	

	PISCALED
		CALL ONLED
		CALL TIMEOUT
	RETURN
	
	ONLED
		BSF LED1
		BSF LED2
		BSF LED3
		BSF LED4
		BSF LED5
		BSF LED6
	RETURN

	OFFLED
		BCF LED1
		BCF LED2
		BCF LED3
		BCF LED4
		BCF LED5
		BCF LED6
	RETURN

	BUTTONTIMEOUT
		NOP
	RETURN

	END			;OBRIGAT�RIO


