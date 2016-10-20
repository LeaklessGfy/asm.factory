; Auteurs : Rasquier Vincent
; Date de creation : 17/10
; Objectif : [TP3] Exercice 12 - Différence

%include "asm_io.inc"

;;;;;;;;;;;;;;;;;;;;;;;;;; DATA ;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .data

;;;;;;;;;;;;;;;;;;;;;;;;;; BSS ;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .bss

;;;;;;;;;;;;;;;;;;;;;;;;;; CODE ;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .text
difference:
	push ebp,
	mov ebp, esp

	mov eax, [ebp + 8]
	sub eax, [ebp + 12]

	pop ebp
	ret

global main
main:
	push 10
	push 20
	call difference
	add esp, 8

	call print_int

exit:
    	mov ebx, 0
    	mov eax, 1
	int 0x80
