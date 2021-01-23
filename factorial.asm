BITS 32

extern printf
extern scanf

extern printf

section .data
	fmt: db "%d",0
	msg1 db 'Enter a number whose factorial is to be calculated',10,0
	len1 equ $ - msg1
	output: db 'Factorial of given number is %d',10,0
	num dw 1

section .text 

	global main
	
	main:

	push ebp
	mov ebp, esp
	sub esp, 0x10

	push msg1
	call printf

	lea ecx, [ebp-0x4]
	push ecx
	push fmt
	call scanf

	mov ebx,dword [ebp-0x4]
	mov eax,ebx

	L1:

	sub ebx, 1
	mul ebx
	cmp ebx,1
	jg L1

	end:

	mov dword [ebp-0x8], eax
	push dword [ebp-0x8]
	push output
	call printf
	
	leave
	ret
