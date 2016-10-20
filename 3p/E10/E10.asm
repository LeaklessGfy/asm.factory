; Auteurs : Rasquier Vincent
; Date de creation : 17/10
; Objectif : [TP3] Exercice 10 - print_string2

%include "asm_io.inc"

;;;;;;;;;;;;;;;;;;;;;;;;;; DATA ;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .data
chaine: db "abc", 0

;;;;;;;;;;;;;;;;;;;;;;;;;; BSS ;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .bss

;;;;;;;;;;;;;;;;;;;;;;;;;; CODE ;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .text
print_string2:
	;Save ebp
	push ebp
	mov ebp, esp
	
	;Save Register
	push eax
	push ebx
	push ecx
	push edx

	;Put in ebx, ebp + 8 == arg1
	mov ebx, [ebp + 8]

loop:
	cmp byte [ebx], 0
	je end

	push ebx
	
	;write
	mov edx, 1 ;Length
	mov ecx, ebx ;Begining
	mov ebx, 1 ;Output
	mov eax, 4 ;System call
	int 0x80

	pop ebx

	add ebx, 1
	jmp loop

end:
	pop edx
	pop ecx
	pop ebx
	pop eax

	pop ebp
	ret

global main
main:
	push chaine
	call print_string2
	add esp, 4
	call print_nl

exit:
    	mov ebx, 0
    	mov eax, 1
	int 0x80
