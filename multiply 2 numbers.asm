BITS 32

extern printf
extern scanf

section .data
	fmt: db "%d", 0
	output: db "Multiplication of 2 numbers gives %d",10,0
	msg1 db 'Enter a input value',0xa
	len1 equ $ - msg1
	msg2 db 'Enter other input value',0xa
	len2 equ $ - msg2

section .text
	global main

	main:
	mov	edx,len1     
   	mov	ecx,msg1     
   	mov	ebx,1       
   	mov	eax,4       
   	int	0x80

	push ebp
	mov ebp, esp
	sub esp, 0x10

	lea eax, [ebp-0x4]
	push eax
	push fmt
	call scanf

	mov	edx,len2     
   	mov	ecx,msg2     
   	mov	ebx,1       
   	mov	eax,4       
   	int	0x80

	lea edx, [ebp-0x8]
	push edx
	push fmt
	call scanf

	mov ebx, dword [ebp-0x4]
	mov eax, dword [ebp-0x8]
	mul ebx
	mov dword [ebp-0x8], eax

	push dword [ebp-0x8]
	push output
	call printf

	leave
	ret
