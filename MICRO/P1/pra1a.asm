;**************************************************************************
; SBM 2023. ESTRUCTURA BÁSICA DE UN PROGRAMA EN ENSAMBLADOR
;**************************************************************************
; DEFINICION DEL SEGMENTO DE DATOS
DATOS SEGMENT
;-- rellenar con los datos solicitados
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
MOV AX, 4BB4H
MOV BH, 0CFH
MOV DX, 3412H
MOV BL, -23D
MOV AX, 11001011B
MOV ES, AX
MOV [BX] + 15, DX
MOV AX, 5122H
MOV ES, AX
MOV DH, ES:2
MOV DL, ES:3
MOV AX, 7000H
MOV ES, AX
MOV ES:7, DH
MOV AX, [SI]
MOV BX, [BP] + 10
; FIN DEL PROGRAMA
MOV AX, 4C00H
INT 21H
INICIO ENDP
; FIN DEL SEGMENTO DE CODIGO
CODE ENDS
; FIN DEL PROGRAMA INDICANDO DONDE COMIENZA LA EJECUCION
END INICIO