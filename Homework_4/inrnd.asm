; file.asm - использование файлов в NASM
extern printf
extern rand

extern FISH
extern BIRD
extern BEAST

global Random
Random:
section .data
    .i20     dq      20
    .rndNumFmt       db "Random number = %d",10,0
section .text
push rbp
mov rbp, rsp

    xor     rax, rax    ;
    call    rand        ; запуск генератора случайных чисел
    xor     rdx, rdx    ; обнуление перед делением
    idiv    qword[.i20]       ; (/%) -> остаток в rdx
    mov     rax, rdx
    inc     rax         ; должно сформироваться случайное число

leave
ret

global RandomWeight
RandomWeight:
section .data
    .i1000     dq      1000
    .rndNumFmt       db "Random number = %d",10,0
section .text
push rbp
mov rbp, rsp

    xor     rax, rax    ;
    call    rand        ; запуск генератора случайных чисел
    xor     rdx, rdx    ; обнуление перед делением
    idiv    qword[.i1000]       ; (/%) -> остаток в rdx
    mov     rax, rdx
    inc     rax         ; должно сформироваться случайное число

leave
ret

global RandomTwo
RandomTwo:
section .data
    .i2     dq      2
    .rndNumFmt       db "Random number = %d",10,0
section .text
push rbp
mov rbp, rsp

    xor     rax, rax    ;
    call    rand        ; запуск генератора случайных чисел
    xor     rdx, rdx    ; обнуление перед делением
    idiv    qword[.i2]       ; (/%) -> остаток в rdx
    mov     rax, rdx
    inc     rax         ; должно сформироваться случайное число

leave
ret

global RandomThree
RandomTwo:
section .data
    .i3     dq      3
    .rndNumFmt       db "Random number = %d",10,0
section .text
push rbp
mov rbp, rsp

    xor     rax, rax    ;
    call    rand        ; запуск генератора случайных чисел
    xor     rdx, rdx    ; обнуление перед делением
    idiv    qword[.i3]       ; (/%) -> остаток в rdx
    mov     rax, rdx
    inc     rax         ; должно сформироваться случайное число

leave
ret

global RandomFour
RandomTwo:
section .data
    .i4     dq      4
    .rndNumFmt       db "Random number = %d",10,0
section .text
push rbp
mov rbp, rsp

    xor     rax, rax    ;
    call    rand        ; запуск генератора случайных чисел
    xor     rdx, rdx    ; обнуление перед делением
    idiv    qword[.i4]       ; (/%) -> остаток в rdx
    mov     rax, rdx
    inc     rax         ; должно сформироваться случайное число

leave
ret

global InRndFish
InRndFish:
section .bss
    .pfish  resq 1   ; адрес рыбы
section .text
push rbp
mov rbp, rsp

    ; В rdi адрес рыбы
    mov     [.pfish], rdi
    ; Генерация параметров рыбы
    call    Random
    mov     rbx, [.pfish]
    mov     [rbx], eax
    call    Random
    mov     rbx, [.pfish]
    mov     [rbx+4], eax
.repeat:
    call    RandomFour
    mov     rbx, [.ptrian]
    mov     [rbx+8], eax    
leave
ret

global InRndFish
InRndFish:
section .bss
    .pfish  resq 1   ; адрес рыбы
section .text
push rbp
mov rbp, rsp

    ; В rdi адрес рыбы
    mov     [.pfish], rdi
    ; Генерация параметров рыбы
    call    Random
    mov     rbx, [.pfish]
    mov     [rbx], eax
    call    Random
    mov     rbx, [.pfish]
    mov     [rbx+4], eax
.repeat:
    call    Random
    mov     rbx, [.ptrian]
    mov     [rbx+8], eax    
leave
ret