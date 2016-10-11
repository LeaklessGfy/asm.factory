; Auteurs : Rasquier Vincent
; Date de creation : 10/10 
; Objectif : [TP2] Exercice 6 - All divisible

%include "asm_io.inc"

;;;;;;;;;;;;;;;;;;;;;;;;;; DATA ;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .data
	prompt: db "Entrez un nombre: ", 0

;;;;;;;;;;;;;;;;;;;;;;;;;; BSS ;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .bss
	input: resd 1
	esp_init_state: resd 1

;;;;;;;;;;;;;;;;;;;;;;;;;; CODE ;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .text
init:
	mov eax, prompt
	call print_string
	call read_int
	mov [input], eax
	ret

divide:
	mov edx, 0
	mov eax, [input] ;Set divise
	cdq

	idiv ecx
	ret

global main
main:
	call init
	mov [esp_init_state], esp
	mov ecx, eax ;Set diviseur (itself at first round)

process:
	call divide

	cmp edx, 0
	je is_divisible

process_2:
	sub ecx, 1 ;Sub diviseur by one
	cmp ecx, 0 ;Check if diviseur == 0 (avoid /0)
	je result

	jmp process

is_divisible:
	push ecx ;Push val of diviseur inside pile
	jmp process_2

result:
	cmp esp, [esp_init_state] ;If esp == his init state, exit
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
