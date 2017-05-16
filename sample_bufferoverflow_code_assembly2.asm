entry_point():
        push    rbp
        mov     rbp, rsp
        leave
        ret
.LC0:
        .string "LIBC_HOOK_CMDLINE_FILTER"
libc_hook_in_process_allowed():
        push    rbp
        mov     rbp, rsp
        sub     rsp, 4144
        mov     edi, OFFSET FLAT:.LC0
        call    getenv
        mov     QWORD PTR [rbp-16], rax
        cmp     QWORD PTR [rbp-16], 0
        jne     .L4
        mov     eax, 1
        jmp     .L5
.L4:
        mov     DWORD PTR [rbp-48], 1
        mov     DWORD PTR [rbp-44], 2
        mov     DWORD PTR [rbp-40], 3
        mov     DWORD PTR [rbp-36], 4
        mov     DWORD PTR [rbp-32], 5
        mov     eax, DWORD PTR [rbp-32]
        cdqe
        mov     edx, 4096
        mov     rcx, rdx
        sub     rcx, rax
        mov     rax, rcx
        mov     BYTE PTR [rbp-4144+rax], 0
        lea     rax, [rbp-4144]
        mov     rdi, rax
        call    strlen
        lea     rdx, [rbp-4144]
        lea     rax, [rdx+rax]
        mov     QWORD PTR [rbp-8], rax
        jmp     .L6
.L9:
        sub     QWORD PTR [rbp-8], 1
.L6:
        mov     rax, QWORD PTR [rbp-8]
        movzx   eax, BYTE PTR [rax]
        cmp     al, 47
        je      .L7
        lea     rax, [rbp-4144]
        cmp     QWORD PTR [rbp-8], rax
        je      .L7
        mov     eax, 1
        jmp     .L8
.L7:
        mov     eax, 0
.L8:
        test    al, al
        jne     .L9
        mov     rax, QWORD PTR [rbp-8]
        movzx   eax, BYTE PTR [rax]
        cmp     al, 47
        jne     .L10
        add     QWORD PTR [rbp-8], 1
.L10:
        mov     rdx, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    strcmp
        test    eax, eax
        sete    al
        movzx   eax, al
.L5:
        leave
        ret