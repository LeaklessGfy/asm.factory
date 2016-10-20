; Auteurs : Rasquier Vincent
; Date de creation : 17/10
; Objectif : [TP3] Exercice 15 - longueur

%include "asm_io.inc"

;;;;;;;;;;;;;;;;;;;;;;;;;; DATA ;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .data
chaine: db "abcdefg", 0

;;;;;;;;;;;;;;;;;;;;;;;;;; BSS ;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .bss

;;;;;;;;;;;;;;;;;;;;;;;;;; CODE ;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .text
rec_longueur:
	push ebp
	mov ebp, esp

	push ebx
	push ecx

	mov ebx, [ebp + 8]

	cmp byte [ebx], 0
	je end_rec

	add eax, 1

	mov ecx, ebx 
	add ecx, 1

	push ecx
	call rec_longueur
	add esp, 4

end_rec:
	pop ecx
	pop ebx

	pop ebp
	ret

longueur:
	;Save ebp
	push ebp
	mov ebp, esp
	
	;Save Register
	push ebx

	;Init ebx with parameter 1 and eax counter
	mov ebx, [ebp + 8]
	mov eax, 0

loop:
	cmp byte [ebx], 0
	je end

	add eax, 1
	add ebx, 1

	jmp loop

end:
	pop ebx
	pop ebp

	ret

global main
main:
	mov eax, 0

	push chaine
	call longueur
	add esp, 4

	call print_int
	call print_nl
	
	mov eax, 0

	push chaine
	call rec_longueur
	add esp, 4

	call print_int
	call print_nl

exit:
    	mov ebx, 0
    	mov eax, 1
	int 0x80
