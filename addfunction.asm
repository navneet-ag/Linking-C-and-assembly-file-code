section .bss
    answerarray resb 2000
    answerarrayPos resb 8
 
 
section .text
    global _start
    global add

printAnswer:
    mov rcx, answerarray
    mov rbx, 10
    mov [rcx], rbx
    inc rcx
    mov [answerarrayPos], rcx
    call printAnswerLoop1
    call printAnswerLoop2

printAnswerLoop1:
    mov rdx, 0
    mov rbx, 10
    div rbx
    push rax
    add rdx, 48
 
    mov rcx, [answerarrayPos]
    mov [rcx], dl
    inc rcx
    mov [answerarrayPos], rcx
   
    pop rax
    cmp rax, 0
    jne printAnswerLoop1
 
printAnswerLoop2:
    mov rcx, [answerarrayPos]
 
    mov rax, 1
    mov rdi, 1
    mov rsi, rcx
    mov rdx, 1
    syscall
 
    mov rcx, [answerarrayPos]
    dec rcx
    mov [answerarrayPos], rcx
 
    cmp rcx, answerarray
    jge printAnswerLoop2
 
    ret

add:
        mov     rax,rdi
        add     rax,rsi
        push    rax
        mov rax, 1        ; system call write 
        mov rdi, 1           
        mov rsi, outputmessage      ;  message is : "The answer is: "
        mov rdx, outputmessagelen   ;  length of the message to be printed
        syscall    
        pop     rax       
        cmp     rax,0
        jl      _negative  
        call printAnswer
        mov rax, 60
        mov rdi, 0
        syscall

_negative:
    push rax    
    mov rax, 1        ; system call write 
    mov rdi, 1           
    mov rsi, negativesign      ;  message is : "-"
    mov rdx, negativesignlen   ;  length of the message to be printed
    syscall           
    pop rax
    mov rbx,-1
    mul rbx
    call printAnswer
    mov rax, 60
    mov rdi, 0
    syscall

section .rodata
  negativesign: db "-", 1
  negativesignlen: equ $ - negativesign
  outputmessage: db "The answer is: ", 15
  outputmessagelen: equ $ - outputmessage