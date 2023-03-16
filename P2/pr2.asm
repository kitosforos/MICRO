;**************************************************************************
; SBM 2023. ESTRUCTURA BÁSICA DE UN PROGRAMA EN ENSAMBLADOR
;**************************************************************************
; DEFINICION DEL SEGMENTO DE DATOS
DATOS SEGMENT

vector DB 1, 2, 2, 4
vector2 DB 4, 2, 5, 1
vector3 DB 3, 2, 4, 1
repeticion DB "-> No valido. Repeticion", 13, 10, '$'
valido DB "-> Correcto.", 13, 10, '$'
rango DB "-> No valido. Numeros diferentes 1-4", 13, 10, '$'

DATOS ENDS
;**************************************************************************
; DEFINICION DEL SEGMENTO DE PILA
PILA SEGMENT STACK "STACK"
DB 40H DUP (0) ;ejemplo de inicialización, 64 bytes inicializados a 0
PILA ENDS
;**************************************************************************
; DEFINICION DEL SEGMENTO EXTRA
EXTRA SEGMENT
RESULT DW 0,0 ;ejemplo de inicialización. 2 PALABRAS (4 BYTES)
EXTRA ENDS
;**************************************************************************
; DEFINICION DEL SEGMENTO DE CODIGO
CODE SEGMENT
ASSUME CS: CODE, DS: DATOS, ES: EXTRA, SS: PILA
; COMIENZO DEL PROCEDIMIENTO PRINCIPAL
INICIO PROC
; INICIALIZA LOS REGISTROS DE SEGMENTO CON SU VALOR
MOV AX, DATOS
MOV DS, AX
MOV AX, PILA
MOV SS, AX
MOV AX, EXTRA
MOV ES, AX
MOV SP, 64 ; CARGA EL PUNTERO DE PILA CON EL VALOR MAS ALTO
; FIN DE LAS INICIALIZACIONES
; COMIENZO DEL PROGRAMA


MOV SI, OFFSET vector
MOV CX, 4
LOOP_START:
	MOV AL, [SI]
	CMP AL, 1
	JL NO_ESTA_EN_RANGO
	CMP AL, 4
	JG NO_ESTA_EN_RANGO
	
	MOV DI, SI
	INC DI
	MOV BX, CX
	DEC BX
	INNER_LOOP_START:
		CMP AL, [DI]
		JE NUMEROS_IGUALES
		INC DI
		LOOP INNER_LOOP_START
	LOOP LOOP_START

NUMEROS_IGUALES:
	MOV AH, 2
	MOV DL, '['
	INT 21h
	MOV SI, OFFSET vector
	MOV DL, [SI]
	ADD DL, 30h
	INT 21h
	MOV DL, 20h
	INT 21h
	INC SI
	MOV DL, [SI]
	ADD DL, 30h
	INT 21h
	MOV DL, 20h
	INT 21h
	INC SI
	MOV DL, [SI]
	ADD DL, 30h
	INT 21h
	MOV DL, 20h
	INT 21h
	INC SI
	MOV DL, [SI]
	ADD DL, 30h
	INT 21h
	MOV DL, ']'
	INT 21h
	MOV DL, 20h
	INT 21h
	MOV DX, OFFSET repeticion
	MOV AH, 9
	INT 21h

NO_ESTA_EN_RANGO:
	MOV AH, 2
	MOV DL, '['
	INT 21h
	MOV SI, OFFSET vector2
	MOV DL, [SI]
	ADD DL, 30h
	INT 21h
	MOV DL, 20h
	INT 21h
	INC SI
	MOV DL, [SI]
	ADD DL, 30h
	INT 21h
	MOV DL, 20h
	INT 21h
	INC SI
	MOV DL, [SI]
	ADD DL, 30h
	INT 21h
	MOV DL, 20h
	INT 21h
	INC SI
	MOV DL, [SI]
	ADD DL, 30h
	INT 21h
	MOV DL, ']'
	INT 21h
	MOV DL, 20h
	INT 21h
	MOV DX, OFFSET rango
	MOV AH, 9
	INT 21h

MOV AH, 2
MOV DL, '['
INT 21h
MOV SI, OFFSET vector3
MOV DL, [SI]
ADD DL, 30h
INT 21h
MOV DL, 20h
INT 21h
INC SI
MOV DL, [SI]
ADD DL, 30h
INT 21h
MOV DL, 20h
INT 21h
INC SI
MOV DL, [SI]
ADD DL, 30h
INT 21h
MOV DL, 20h
INT 21h
INC SI
MOV DL, [SI]
ADD DL, 30h
INT 21h
MOV DL, ']'
INT 21h
MOV DL, 20h
INT 21h
MOV AH, 9
MOV DX, OFFSET valido
MOV AH, 9
INT 21h


MOV AX, 4C00H
INT 21H
INICIO ENDP
; FIN DEL SEGMENTO DE CODIGO
CODE ENDS
; FIN DEL PROGRAMA INDICANDO DONDE COMIENZA LA EJECUCION
END INICIO