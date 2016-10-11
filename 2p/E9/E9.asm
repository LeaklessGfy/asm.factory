; Auteurs : Rasquier Vincent
; Date de creation : 10/10
; Objectif : [TP2] Exercice 9 - binary dump number of one (improve)

%include "asm_io.inc"

;;;;;;;;;;;;;;;;;;;;;;;;;; DATA ;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .data
	prompt: db "Entrez un nombre: ", 0

;;;;;;;;;;;;;;;;;;;;;;;;;; BSS ;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .bss

;;;;;;;;;;;;;;;;;;;;;;;;;; CODE ;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .text
init:
	mov eax, prompt
	call print_string
	call read_int
	ret

global main
main:
	call init
	mov ecx, 0

process:
	mov ebx, eax

	cmp eax, 0
	je result

	add ecx, 1
	sub ebx, 1
	and eax, ebx

	jmp process

result:
	mov eax, ecx
	call print_int

clean:
	call print_nl

exit:
	mov ebx, 0
	mov eax, 1
	int 0x80
