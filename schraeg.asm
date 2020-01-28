;bits 32

%define SYS_WRITE	4
%define SYS_EXIT	1
%define STDOUT		1

section .data
section .bss
section .text
	global _start
_start:
;pop Anzahl der Argumente inklusive Programmname
	pop edi
;pop Programmname
	pop esi

check_arguments:
xor esi, esi
;ist Anzahl der Argumente gleich 1
	cmp edi, 1
;wenn nicht groesser als 1 beende programm
	jle end_program
	pop ebx


print_letter:
	push eax 
	push ebx
	push ecx
	push edx
	
	inc esi
	mov edx, 1		;;edx 1, 1 Buchstabe
	mov ecx, ebx		;;mov ecx buchstabe, was du schreiben willst, +1 für kommende
	mov ebx, STDOUT
	mov eax, SYS_WRITE

	int 80h
	mov eax, SYS_WRITE       
    	mov ebx, STDOUT          
    	mov ecx, newline         
    	mov edx, 1
	
	dec edi

	pop edx
	pop ecx
	pop ebx 
	pop eax

end_program:
	mov eax, SYS_EXIT	;ende
	mov ebx, 0		;ende
	int 80h			;Kernel



