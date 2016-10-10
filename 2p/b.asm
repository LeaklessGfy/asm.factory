; Auteurs : Rasquier Vincent
; Date de creation : 
; Objectif : 

%include "asm_io.inc"

;;;;;;;;;;;;;;;;;;;;;;;;;; DATA ;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .data

;;;;;;;;;;;;;;;;;;;;;;;;;; BSS ;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .bss

;;;;;;;;;;;;;;;;;;;;;;;;;; CODE ;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .text
global main
main:
	exit:
    		mov ebx, 0
    		mov eax, 1
    		int 0x80
