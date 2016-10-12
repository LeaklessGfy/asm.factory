; Auteurs : Rasquier Vincent
; Date de creation : 10/10
; Objectif : [TP2] Exercice 11 - sort number not in list without .bss

%include "asm_io.inc"
%define LENGTH 32

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

get_power_2:
	mov eax, 1
	shl eax, cl
	ret

global main
main:
	mov ebx, 0
	mov edx, 0

process:
	call get_input

	cmp eax, -1
	je result

	mov ecx, eax
	call get_power_2

	or edx, eax

	add ebx, 1
	cmp ebx, LENGTH
	jne process

result:
	mov ebx, -1

result_loop:
	add ebx, 1
	cmp ebx, LENGTH
	je clean

	mov ecx, ebx
	call get_power_2
	mov ecx, eax

	and eax, edx
	cmp eax, ecx
	je result_loop

print:
	mov eax, ebx
	call print_int
	call print_espace
	jmp result_loop

clean:
	call print_nl

exit:
	mov ebx, 0
	mov eax, 1
	int 0x80
