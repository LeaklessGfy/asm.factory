; Auteurs : Rasquier Vincent
; Date de creation : 17/10
; Objectif : [TP3] Exercice 4 - inversion de nombre

%include "asm_io.inc"

;;;;;;;;;;;;;;;;;;;;;;;;;; DATA ;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .data
	prompt: db "Entrez un nombre: ", 0

;;;;;;;;;;;;;;;;;;;;;;;;;; BSS ;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .bss

;;;;;;;;;;;;;;;;;;;;;;;;;; CODE ;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .text
get_input:
	mov eax, prompt
	call print_string
	mov eax, 0
	call read_int
	ret

global main
main:
	mov ecx, 0
	mov ebp, esp

process:
	call get_input
	
	cmp eax, -1
	je result

	push eax

	jmp process

result:
	cmp esp, ebp
	je clean

	pop eax
	call print_int
	call print_espace
	
	jmp result

clean:
	call print_nl

exit:
	mov ebx, 0
	mov eax, 1
	int 0x80
