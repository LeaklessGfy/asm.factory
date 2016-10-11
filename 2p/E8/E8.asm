; Auteurs : Rasquier Vincent
; Date de creation : 10/10
; Objectif : [TP2] Exercice 7 - binary dump

%include "asm_io.inc"
%define LENGTH 32

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

global main
main:
	call init
	mov ebx, [input]
	mov ecx, LENGTH
	mov edx, 0 ;Number of one

process_1:
	shr ebx, 1

	;If flag CF is 0 skip add one
	jnc process_2

add_one:
	add edx, 1

process_2:
	sub ecx, 1
	cmp ecx, 0
	jne process_1

	mov eax, edx
	call print_int

clean:
	call print_nl

exit:
	mov ebx, 0
	mov eax, 1
	int 0x80
