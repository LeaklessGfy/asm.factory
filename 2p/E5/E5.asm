; Auteurs : Rasquier Vincent
; Date de creation : 10/10
; Objectif : [TP2] Exercice 5 - is divisible ?

%include "asm_io.inc"

;;;;;;;;;;;;;;;;;;;;;;;;;; DATA ;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .data
	prompt1: db "Entrez un nombre: ", 0
	prompt2: db "Un autre nombre: ", 0
	yes: db "Oui", 0
	no: db "Non", 0

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

divide:
	mov edx, 0
	mov eax, [input1]
	mov ecx, [input2]

	div ecx
	ret

global main
main:
	call init
	call divide

	;Compare rest and 0
	cmp edx, 0

	jne is_not_divisible

is_divisible:
	mov eax, yes
	call print_string
	jmp clean

is_not_divisible:
	mov eax, no
	call print_string
	call print_espace

	mov eax, edx
	call print_int

clean:
	call print_nl

exit:
	mov ebx, 0
	mov eax, 1
	int 0x80
