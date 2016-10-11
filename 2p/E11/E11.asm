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

;puissance case 0
p_0:
	mov eax, 1
	ret

global main
main:
	mov ecx, 0 ;Init counter
	mov edx, 0 ;Register that containt user's inputs

process:
	;Get one input (int)
	call get_input

	;#If input == -1 : Proceed result
	cmp eax, -1
	je result

	;#Else : Save input in ebx, init eax to 2 (for puissance)
	mov ebx, eax

	;Calculate puissance
	call get_puissance

process_add:
	;Add result of puissance to edx
	add edx, eax

	;Add 1 to counter
	add ecx, 1

	;#If ecx == max length : Proceed result
	cmp ecx, LENGTH
	je result

	;#Else = Return in loop
	jmp process

result:
	mov ecx, -1 ;Init counter

result_loop:
	;Increment counter
	add ecx, 1

	;#If counter == max length : End of program
	cmp ecx, LENGTH
	je clean

	;Put in ebx value of counter
	mov ebx, ecx

	;Get puissance (2 ^ ebx)
	call get_puissance

	;Mov result in ebx
	mov ebx, eax

	;Proceed 'and'
	and eax, edx

	;#If 'and' result == puissance : Don't show the number
	cmp eax, ebx
	je result_loop

	;#Else: Print the number on screen
	mov eax, ecx
	call print_int
	call print_espace

	;Loop
	jmp result_loop

clean:
	call print_nl

exit:
	mov ebx, 0
	mov eax, 1
	int 0x80
