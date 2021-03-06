%macro ISR_NOERRCODE 1  ; define a macro, taking one parameter
  global isr%1        ; %1 accesses the first parameter.
  isr%1:
    cli
    push byte 0
    push byte %1
    jmp isr_common_stub
%endmacro

%macro ISR_ERRCODE 1
  global isr%1
  isr%1:
    cli
    push byte %1
    jmp isr_common_stub
%endmacro

ISR_NOERRCODE 0
ISR_NOERRCODE 1
ISR_NOERRCODE 2
ISR_NOERRCODE 3
ISR_NOERRCODE 4
ISR_NOERRCODE 5
ISR_NOERRCODE 6
ISR_NOERRCODE 7
ISR_ERRCODE 8
ISR_NOERRCODE 9
ISR_ERRCODE 10
ISR_ERRCODE 11
ISR_ERRCODE 12
ISR_ERRCODE 13
ISR_ERRCODE 14
ISR_NOERRCODE 15
ISR_NOERRCODE 16
ISR_NOERRCODE 17
ISR_NOERRCODE 18
ISR_NOERRCODE 19
ISR_NOERRCODE 20
ISR_NOERRCODE 21
ISR_NOERRCODE 22
ISR_NOERRCODE 23
ISR_NOERRCODE 24
ISR_NOERRCODE 25
ISR_NOERRCODE 26
ISR_NOERRCODE 27
ISR_NOERRCODE 28
ISR_NOERRCODE 29
ISR_NOERRCODE 30
ISR_NOERRCODE 31

extern isr_handler

isr_common_stub:
	pusha
	push ds
	push es
	push fs
	push gs
	mov ax, 0x10   ; Load the Kernel Data Segment descriptor!
	mov ds, ax
	mov es, ax
	mov fs, ax
	mov gs, ax
	mov eax, esp   ; Push us the stack
	push eax
	mov eax, isr_handler
	call eax       ; A special call, preserves the 'eip' register
	pop eax
	pop gs
	pop fs
	pop es
	pop ds
	popa
	add esp, 8     ; Cleans up the pushed error code and pushed ISR number
	iret           ; pops 5 things at once: CS, EIP, EFLAGS, SS, and ESP!

%macro IRQ_NOERRCODE 2  ; define a macro, taking two parameters
  global irq%1        ; %1 accesses the first parameter.
  irq%1:
    cli
    push byte 0
    push byte %2
    jmp irq_common_stub
%endmacro

%macro IRQ_ERRCODE 2
  global irq%1
  irq%1:
    cli
    push byte %2
    jmp irq_common_stub
%endmacro      

IRQ_NOERRCODE 0, 32
IRQ_NOERRCODE 1, 33
IRQ_NOERRCODE 2, 34
IRQ_NOERRCODE 3, 35
IRQ_NOERRCODE 4, 36
IRQ_NOERRCODE 5, 37
IRQ_NOERRCODE 6, 38
IRQ_NOERRCODE 7, 39
IRQ_NOERRCODE 8, 40
IRQ_NOERRCODE 9, 41
IRQ_NOERRCODE 10, 42
IRQ_NOERRCODE 11, 43
IRQ_NOERRCODE 12, 44
IRQ_NOERRCODE 13, 45
IRQ_NOERRCODE 14, 46
IRQ_NOERRCODE 15, 47

extern irq_handler

irq_common_stub:
	pusha
	push ds
	push es
	push fs
	push gs
	mov ax, 0x10
	mov ds, ax
	mov es, ax
	mov fs, ax
	mov gs, ax
	mov eax, esp
	push eax
	mov eax, irq_handler
	call eax
	pop eax
	pop gs
	pop fs
	pop es
	pop ds
	popa
	add esp, 8
	iret

