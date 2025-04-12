bits 32
global _start

section .data
str_orginal: db "hello world", 0xA, 0x0

section .bss
str_reversed: resb 64 ; reserving 64 bytes of memory filled with 0s

section .text
_start:
	mov esi, str_orginal ; Load the address of the original string into ESI
	xor ecx, ecx ; Clear ECX to use it as a counter

length_loop:
	mov al, [esi + ecx] ; Load the byte at ESI + ECX into AL 
	cmp al, 0 ; Check if we reached the null terminator
	je got_length ; If yes, jump to got_length
	inc ecx ; Increment the counter
	jmp length_loop ; Repeat the loop

got_length:
	; ECX now contains the length of the string
	mov ebx, ecx ; Copy the length to EBX for later use
	; - ESI points to the start of the original string	
	; - ECX contains the length of the string
	; - EDI points to the start of the reversed string
	mov esi, str_orginal ; Reset ESI to the start of the original string
	add esi, ebx ; Move ESI to the end of the original string
	dec esi ; Move back to the last character (before null terminator)
	mov edi, str_reversed ; Load the address of the reversed string into EDI

reverse_loop:
	cmp ebx, 0 ; Check if we have processed all characters
	je done_reverse ; If yes, jump to done_reverse
	mov al, [esi] ; Load the byte at ESI into AL from the end of the original string
	mov [edi], al ; Store the byte in the reversed string
	dec esi
	inc edi
	dec ebx
	jmp reverse_loop 

done_reverse:
	mov byte [edi], 0xA ; Add a newline character at the end of the reversed string
	inc edi 

	mov edx, ecx
	inc edx

	mov eax, 0x04 ; sys_write
	mov ebx, 0x01 ; stdout
	mov ecx, str_reversed ; Pointer to the reversed string
	int 0x80 ; Call kernel

	mov eax, 0x01 ; sys_exit
	xor ebx, ebx ; Return code 0
	int 0x80 ; Call kernel



