; Auteurs : Rasquier Vincent
; Date de creation : 10/10
; Objectif : [TP2] Exercice 3 - Show utmost

%include "asm_io.inc"

;;;;;;;;;;;;;;;;;;;;;;;;;; DATA ;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .data

;;;;;;;;;;;;;;;;;;;;;;;;;; BSS ;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .bss
	input: resd 1

;;;;;;;;;;;;;;;;;;;;;;;;;; CODE ;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .text
global main
main:
	;Read first int and put it in #input
	call read_int
	mov [input], eax

	;Read second int
	call read_int

	;Compare eax(second int) to #input (first int)
	cmp eax, [input]
	
	;If eax > #input skip to writer. 
	;Else put #input in eax
	jg write
	mov eax, [input]
	
	write:
	   	call print_int
		call print_nl

	exit:
    		mov ebx, 0
    		mov eax, 1
    		int 0x80
