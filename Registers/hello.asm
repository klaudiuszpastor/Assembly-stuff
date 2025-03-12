bits 32
global _start

section .text
_start:
	mov eax, 1 
	mov ebx, 5
	int 0x80
	
	; exit(5);
section .data

str: 	  db "Hello, World!", 0x0a, 0x00
