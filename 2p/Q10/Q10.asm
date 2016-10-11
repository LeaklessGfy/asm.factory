; Auteurs : Rasquier Vincent
; Date de creation : 10/10
; Objectif : [TP2] Exercice 10 - sort number not in list

%include "asm_io.inc"
%define LENGTH 51

;;;;;;;;;;;;;;;;;;;;;;;;;; DATA ;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .data
	prompt: db "Entrez un nombre: ", 0

;;;;;;;;;;;;;;;;;;;;;;;;;; BSS ;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .bss
	inputs: resb 51

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
	mov ebx, 0 ;Input counter
	mov ecx, -1 ;Output counter

process:
	call get_input
	
	cmp eax, -1
	je result

	mov byte [inputs + eax], 1

	add ebx, 1
	cmp ebx, LENGTH
	je result

	jmp process

result:
	add ecx, 1
	cmp ecx, LENGTH
	je clean
	
	mov bl, [inputs + ecx]
	
	cmp bl, 1
	je result
	
	mov eax, ecx
	call print_int
	call print_espace
	
	jmp result

clean:
	call print_nl

exit:
	mov ebx, 0
	mov eax, 1
	int 0x80
