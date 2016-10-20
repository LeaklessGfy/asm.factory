; Auteurs : Rasquier Vincent
; Date de creation : 17/10
; Objectif : [TP3] Exercice 13 - occurence

%include "asm_io.inc"

;;;;;;;;;;;;;;;;;;;;;;;;;; DATA ;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .data

;;;;;;;;;;;;;;;;;;;;;;;;;; BSS ;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .bss

;;;;;;;;;;;;;;;;;;;;;;;;;; CODE ;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .text
occurence:
	push ebp
	mov ebp, esp

	push ebx
	push ecx
	push edx

	mov ecx, 0

get_suite:
	call read_int
	
	cmp eax, -1
	je get_a

	add ecx, 1
	push eax
	jmp get_suite

get_a:
	call read_int

compare:
	cmp ecx, 0
	je end

	sub ecx, 1
	
	pop ebx
	cmp eax, ebx
	jne compare

add_one:
	add edx, 1
	jmp compare

end:
	mov eax, edx
	pop edx
	pop ecx
	pop ebx

	pop ebp
	ret

global main
main:
	call occurence
	call print_int
	call print_nl	

exit:
    	mov ebx, 0
    	mov eax, 1
	int 0x80
