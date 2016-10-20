; Auteurs : Rasquier Vincent
; Date de creation : 17/10
; Objectif : [TP3] Exercice 16 - print fibonacci

%include "asm_io.inc"

;;;;;;;;;;;;;;;;;;;;;;;;;; DATA ;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .data

;;;;;;;;;;;;;;;;;;;;;;;;;; BSS ;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .bss

;;;;;;;;;;;;;;;;;;;;;;;;;; CODE ;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .text
fibonacci:
	;Init
	push ebp
	mov ebp, esp

	;Save register
	push ebx
	push ecx
	push edx

	;Take first argument in ebx
	mov ebx, [ebp + 8]

	;If ebx = 0 or 1
	cmp ebx, 1
	jle over

	;Fn-1
	mov ecx, ebx
	sub ecx, 1

	push ecx
	call fibonacci
	add esp, 4

	push eax

	;Fn-2
	mov ecx, ebx
	sub ecx, 2

	push ecx
	call fibonacci
	add esp, 4

	pop ebx
	add eax, ebx
	
	jmp end

over:
	mov eax, ebx

end:
	pop edx
	pop ecx
	pop ebx

	pop ebp
	ret

global main
main:
	call read_int
	
	push eax
	call fibonacci
	add esp, 4

	call print_int
	call print_nl

exit:
    	mov ebx, 0
    	mov eax, 1
	int 0x80
