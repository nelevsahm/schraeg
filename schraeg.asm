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
	pop eax
;pop Programmname
	pop esi

check_arguments:
mov esi, 0
;ist Anzahl der Argumente gleich 1
	cmp eax, 1
;wenn nicht groesser als 1 beende programm
	jle end_programm
	pop ebx

	 
end_programm:
	eax sysexit	;ende
	ebx 0		;ende
	int 80h		;Kernel

print_letter:
	push eax 
	push ebx
	push ecx
	push edx
	
	inc esi
;	eax syswrite
;	ebx stdout
;	ecx buchstabe, was du schreiben willst, +1 für kommende
;	edx 1, 1 buchstabe

	

	pop edx
	pop ecx
	pop ebx 
	pop eax


	call write_space                     ; otherwise take care of writing the spaces
    	write_string eax, 1                  
    	write_string newline, 1       
    	inc eax                              
    	inc edx                              ; increment the counter for spaces
    	jmp print_letter                     ; loop

write_string:

