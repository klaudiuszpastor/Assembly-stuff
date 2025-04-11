bits 32
global _start

section .data

str: 	db "hello world",0x0a,0x00
size:	dd $ - str - 1
; payload:
	; db "string",0x00
	; dw 0xa91b
	; times 32 0x00 -- marco 

section .bss ; section for uninitialized data

payload: resb 32 ; reserving 32 bytes of memory filled with 0s

section .text
	
_start:
	mov eax,str
	push eax ; eax on the stack
	mov esi,esp

	mov ecx,[esi]
	; pop ecx
	xor eax,eax
	mov eax,0x04 ; sys_write
	mov ebx,0x01 ; stdout
	; mov ecx,str ; pointer to the string 
	mov edx,[size] ; reference to size actual val using square brackets
	int 0x80

	mov eax,0x01 ; sys_exit
	mov ebx,0x00
	int 0x80	
	
