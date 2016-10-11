; Auteurs : Rasquier Vincent
; Date de creation : 10/10
; Objectif : [TP2] Exercice 3 - Show utmost

%include "asm_io.inc"

;;;;;;;;;;;;;;;;;;;;;;;;;; DATA ;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .data
	prompt1: db "Entrez un nombre: ", 0
	prompt2: db "Un autre nombre: ", 0
	result: db "Le nombre le plus grand est: ", 0 

;;;;;;;;;;;;;;;;;;;;;;;;;; BSS ;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .bss
	input1: resd 1
	input2: resd 1

;;;;;;;;;;;;;;;;;;;;;;;;;; CODE ;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .text
init:
	mov eax, prompt1
	call print_string
	call read_int
	mov [input1], eax

	mov eax, prompt2
	call print_string
	call read_int
	mov [input2], eax
	ret

global main
main:
	call init
	mov ecx, [input2]

	;Compare #input2 to #input1
	cmp eax, [input1]

	jg write
	mov ecx, [input1]

write:
	mov eax, result
	call print_string

	mov eax, ecx
	call print_int
	call print_nl

exit:
	mov ebx, 0
	mov eax, 1
	int 0x80
