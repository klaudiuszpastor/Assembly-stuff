global _start
bits 32

section .text
_start:
		mov bl,0x05		
		mov eax,0x0a
		mov ebx,0x02
		; add ebx,eax - adding
		; sub ebx,eax - substracting
		; and ebx,eax
		; or ebx,eax
		; xor ebx,eax
		; xor ebx,ebx
		; not bl, 0x05
		; not ebx
		; ebx = 32 bit
		; bx = 16 bit
		; bh / bl = 8 bit
		;multiplication
		; mul ebx
		; division
		div ebx
		mov ebx,eax
		;; in edx reg we will find modulo result
		


exit:
		mov eax,0x01
		int 0x80

