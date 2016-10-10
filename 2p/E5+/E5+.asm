; Auteurs : Rasquier Vincent
; Date de creation : 10/10
; Objectif : [TP2] Exercice 5+ - is divisible plus ?

%include "asm_io.inc"

;;;;;;;;;;;;;;;;;;;;;;;;;; DATA ;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .data
yes: db "Oui", 0
no: db "Non", 0

;;;;;;;;;;;;;;;;;;;;;;;;;; BSS ;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .bss
a: resd 1
b: resd 1

;;;;;;;;;;;;;;;;;;;;;;;;;; CODE ;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .text
global main
main:
	call read_int
	mov [a], eax

	call read_int
	mov [b], eax

	;Init div
	mov edx, 0
	mov eax, [a]
	mov ecx, [b]
	cdq

	idiv ecx

	cmp edx, 0
	je is_divisible

	;Is not divisible
	mov eax, no
	call print_string
	call print_espace

	mov eax, edx
	call print_int
	jmp clean

	is_divisible:
		mov eax, yes
		call print_string
	clean:
		call print_nl
	exit:
    		mov ebx, 0
    		mov eax, 1
    		int 0x80
