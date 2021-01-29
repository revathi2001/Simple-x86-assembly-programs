BITS 32

extern printf
extern scanf

section .data
	fmt: db "%d", 0
	output1: db "sum is %d",10,0
	output2: db "Difference is %d",10,0
	output3: db "Multiplication is %d",10,0
	output4: db "Quotient on dividing is %d",10,0
	msg1 db 'Enter a input value',0xa
	len1 equ $ - msg1
	msg2 db 'Enter other input value',0xa
	len2 equ $ - msg2

section .bss
	num1 resb 5
	num2 resb 5

section .text
	global main

	main:

	push ebp
	mov ebp, esp
	sub esp, 0x10

	mov	edx,len1     
   	mov	ecx,msg1     
   	mov	ebx,1       
   	mov	eax,4       
   	int	0x80

	lea eax, [ebp-0x4]
	push eax
	push fmt
	call scanf

	mov	edx,len2     
   	mov	ecx,msg2     
   	mov	ebx,1       
   	mov	eax,4       
   	int	0x80

	lea ebx, [ebp-0x8]
	push ebx
	push fmt
	call scanf

	mov ebx, dword [ebp-0x4]
	mov eax, dword [ebp-0x8]

	mov [num1], eax
	mov [num2],ebx

	mov ecx,ebx
	mov edx,eax

	add eax, ebx

	mov dword [ebp-0x8], eax
	push dword [ebp-0x8]
	push output1
	call printf

	xor eax,eax
	xor ebx,ebx

	mov ebx,[num1]
	mov eax,[num2]

	sub eax,ebx

	mov dword [ebp-0x8], eax
	push dword [ebp-0x8]
	push output2
	call printf

	xor eax,eax
	xor ebx,ebx

	mov ebx,[num1]
	mov eax,[num2]

	mul ebx

	mov dword [ebp-0x8], eax
	push dword [ebp-0x8]
	push output3
	call printf

	xor eax,eax
	xor ebx,ebx

	mov ebx,[num1]
	mov eax,[num2]
	
	xor edx,edx
	div ebx

	mov dword [ebp-0x8], eax
	push dword [ebp-0x8]
	push output4
	call printf

	leave
	ret
