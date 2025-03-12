bits 32
global _start

section .data


section .text
	_start:
		mov ebx, 0x12345
		mov eax, 0x54
		cmp eax, 0x55
		je _true

	_exit:
		mov ebx, 0x00

	_true:
		mov eax, 0x01
		int 0x80

