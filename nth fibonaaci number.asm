BITS 32

extern printf
extern scanf

extern printf

section .data
	fmt: db "%d",0
	msg1 db 'Enter a value n',10,0
	len1 equ $ - msg1
	output: db 'nth fibonacci Number is %d',10,0

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
	mov eax,0
	mov edx,1
	mov ecx,3

	L1:
	cmp ebx,1
	je C1

	cmp ebx,2
	je C2

	add eax,edx

	cmp ecx,ebx
	je C3

	inc ecx
	xchg eax,edx
	jmp L1

	end:

	C1:
	mov dword [ebp-0x8],0
	push dword [ebp-0x8]
	push output
	call printf
	jmp exit

	C2:
	mov dword [ebp-0x8], 1
	push dword [ebp-0x8]
	push output
	call printf
	jmp exit

	C3:
	mov dword [ebp-0x8], eax
	push dword [ebp-0x8]
	push output
	call printf

exit:
	leave
	ret
