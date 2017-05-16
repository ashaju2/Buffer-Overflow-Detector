.LC0:
        .string "\n Enter the password : "
.LC1:
        .string "thegeekstuff"
.LC2:
        .string "\n Wrong Password "
.LC3:
        .string "\n Correct Password "
.LC4:
        .string "\n Root privileges given to the user "
main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 80
        mov     QWORD PTR [rbp-80], 0
        mov     QWORD PTR [rbp-72], 0
        mov     QWORD PTR [rbp-64], 0
        mov     QWORD PTR [rbp-56], 0
        mov     QWORD PTR [rbp-48], 0
        mov     DWORD PTR [rbp-80], 134256611
        mov     DWORD PTR [rbp-8], 0
        mov     DWORD PTR [rbp-4], 134256611
        mov     edi, OFFSET FLAT:.LC0
        call    puts
        mov     eax, DWORD PTR [rbp-4]
        movsx   rdx, eax
        lea     rax, [rbp-32]
        add     rax, rdx
        mov     rdi, rax
        call    gets
        lea     rax, [rbp-32]
        mov     esi, OFFSET FLAT:.LC1
        mov     rdi, rax
        call    strcmp
        test    eax, eax
        je      .L2
        mov     edi, OFFSET FLAT:.LC2
        call    puts
        jmp     .L3
.L2:
        mov     edi, OFFSET FLAT:.LC3
        call    puts
        mov     DWORD PTR [rbp-8], 1
.L3:
        cmp     DWORD PTR [rbp-8], 0
        je      .L4
        mov     edi, OFFSET FLAT:.LC4
        call    puts
.L4:
        mov     eax, 0
        leave
        ret