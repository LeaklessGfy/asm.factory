; Auteurs : Rasquier Vincent
; Date de creation : 10/10 
; Objectif : [TP2] Exercice 6 - All divisible

%include "asm_io.inc"

;;;;;;;;;;;;;;;;;;;;;;;;;; DATA ;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .data
	prompt: db "Entrez un nombre: ", 0

;;;;;;;;;;;;;;;;;;;;;;;;;; BSS ;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .bss
	input: resd 1

;;;;;;;;;;;;;;;;;;;;;;;;;; CODE ;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .text
init:
	mov eax, prompt
	call print_string
	call read_int
	mov [input], eax
	ret

divide:
	mov edx, 0
	mov eax, [input] ;Set divise
	cdq

	idiv ecx
	ret

global main
main:
	call init
	mov ebx, 0 ;Compteur
	mov ecx, eax ;Set diviseur

process:
	call divide

	cmp edx, 0
	je is_divisible

process_2:
	sub ecx, 1
	cmp ecx, 0
	je result

	jmp process

is_divisible:
	push ecx
	add ebx, 1
	jmp process_2

result:
	cmp ebx, 0
	je clean

	pop eax
	call print_int
	call print_espace

	sub ebx, 1
	jmp result

clean:
	call print_nl

exit:
	mov ebx, 0
	mov eax, 1
	int 0x80
