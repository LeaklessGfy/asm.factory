; Auteurs : Rasquier Vincent
; Date de creation : 10/10
; Objectif : [TP2] Exercice 11 - sort number not in list without .bss

%include "asm_io.inc"
%define LENGTH 33

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

get_puissance:
	mov eax, 2

	cmp ebx, 0
	je p_0

	cmp ebx, 1
	je p_return

p_process:
	;If ebx == 1, it's over
	cmp ebx, 1
	je p_return

	add eax, eax
	sub ebx, 1
	jmp p_process

p_return:
	ret

p_0:
	mov eax, 1
	ret

global main
main:
	mov ecx, 0 ;Counter
	mov edx, 0 ;Register that containt inputs

process:
	call get_input

	;If input == -1 proceed result	
	cmp eax, -1
	je result

	;Save input in ebx, init eax to 2 (for puissance)
	mov ebx, eax
	mov eax, 2

	;If input == 1
	cmp ebx, 1
	je process_add

	;Calculate puissance
	call get_puissance

process_add:
	add edx, eax
	add ecx, 1

	;If ecx == max length, get result
	cmp ecx, LENGTH
	je result

	jmp process

result:
	mov ecx, -1

result_loop:
	add ecx, 1
	cmp ecx, LENGTH
	je clean

	mov ebx, ecx

	call get_puissance
	
	mov ebx, eax
	and eax, edx
	
	cmp eax, ebx
	je result_loop
	
	mov eax, ecx
	call print_int
	call print_espace
	
	jmp result_loop

clean:
	call print_nl

exit:
	mov ebx, 0
	mov eax, 1
	int 0x80
