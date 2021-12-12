; file.asm - использование файлов в NASM
extern printf
extern fscanf

extern FISH
extern BIRD
extern BEAST

global InFish
InFish:
section .data
    .infmt db "%s%d%d",0
section .bss
    .FILE   resq    1   ; временное хранение указателя на файл
    .pfish  resq    1   ; адрес рыбы
section .text
push rbp
mov rbp, rsp

    ; Сохранение принятых аргументов
    mov     [.pfish], rdi          ; сохраняется адрес рыбы
    mov     [.FILE], rsi          ; сохраняется указатель на файл

    ; Ввод рыбы из файла
    mov     rdi, [.FILE]
    mov     rsi, .infmt         ; Формат - 1-й аргумент
    mov     rdx, [.pfish]      
    mov     rcx, [.pfish]
    add     rcx, 4  
    mov     r8, [.pfish]
    add     r8, 8                 
    mov     rax, 0              ; нет чисел с плавающей точкой
    call    fscanf

leave
ret

global InBird
InBird:
section .data
    .infmt db "%s%d%d",0
section .bss
    .FILE   resq    1   ; временное хранение указателя на файл
    .pbird  resq    1   ; адрес рыбы
section .text
push rbp
mov rbp, rsp

    ; Сохранение принятых аргументов
    mov     [.pbird], rdi          ; сохраняется адрес рыбы
    mov     [.FILE], rsi          ; сохраняется указатель на файл

    ; Ввод рыбы из файла
    mov     rdi, [.FILE]
    mov     rsi, .infmt         ; Формат - 1-й аргумент
    mov     rdx, [.pbird]      
    mov     rcx, [.pbird]
    add     rcx, 4  
    mov     r8, [.pbird]
    add     r8, 8                 
    mov     rax, 0              ; нет чисел с плавающей точкой
    call    fscanf

leave
ret

global InBeast
InBeast:
section .data
    .infmt db "%s%d%d",0
section .bss
    .FILE   resq    1   ; временное хранение указателя на файл
    .pbeast  resq    1   ; адрес рыбы
section .text
push rbp
mov rbp, rsp

    ; Сохранение принятых аргументов
    mov     [.pbeast], rdi          ; сохраняется адрес рыбы
    mov     [.FILE], rsi          ; сохраняется указатель на файл

    ; Ввод рыбы из файла
    mov     rdi, [.FILE]
    mov     rsi, .infmt         ; Формат - 1-й аргумент
    mov     rdx, [.pbeast]      
    mov     rcx, [.pbeast]
    add     rcx, 4  
    mov     r8, [.pbeast]
    add     r8, 8                 
    mov     rax, 0              ; нет чисел с плавающей точкой
    call    fscanf

leave
ret

global InAnimal
InAnimal:
section .data
    .tagFormat   db      "%d",0
    .tagOutFmt   db     "Tag is: %d",10,0
section .bss
    .FILE       resq    1   ; временное хранение указателя на файл
    .panimal     resq    1   ; адрес животного
    .animalTag   resd    1   ; признак животного
section .text
push rbp
mov rbp, rsp

    ; Сохранение принятых аргументов
    mov     [.panimal], rdi          ; сохраняется адрес животного
    mov     [.FILE], rsi            ; сохраняется указатель на файл

    ; чтение признака животного и его обработка
    mov     rdi, [.FILE]
    mov     rsi, .tagFormat
    mov     rdx, [.panimal]      ; адрес начала животного (ее признак)
    xor     rax, rax            ; нет чисел с плавающей точкой
    call    fscanf
    
    mov rcx, [.panimal]          ; загрузка адреса начала животного
    mov eax, [rcx]              ; и получение прочитанного признака
    cmp eax, [FISH]
    je .fishIn
    cmp eax, [BIRD]
    je .birdIn
    cmp eax, [BEAST]
    je .beastIn
    xor eax, eax    ; Некорректный признак - обнуление кода возврата
    jmp     .return
.fishIn:
    ; Ввод рыбы
    mov     rdi, [.panimal]
    add     rdi, 4
    mov     rsi, [.FILE]
    call    InFish
    mov     rax, 1  ; Код возврата - true
    jmp     .return
.birdIn:
    ; Ввод птицы
    mov     rdi, [.panimal]
    add     rdi, 4
    mov     rsi, [.FILE]
    call    InBird
    mov     rax, 1  ; Код возврата - true
.beastIn:
    ; Ввод зверя
    mov     rdi, [.panimal]
    add     rdi, 4
    mov     rsi, [.FILE]
    call    InBeast
    mov     rax, 1  ; Код возврата - true
.return:

leave
ret

global InContainer
InContainer:
section .bss
    .pcont  resq    1   ; адрес контейнера
    .plen   resq    1   ; адрес для сохранения числа введенных элементов
    .FILE   resq    1   ; указатель на файл
section .text
push rbp
mov rbp, rsp

    mov [.pcont], rdi   ; сохраняется указатель на контейнер
    mov [.plen], rsi    ; сохраняется указатель на длину
    mov [.FILE], rdx    ; сохраняется указатель на файл
    ; В rdi адрес начала контейнера
    xor rbx, rbx        ; число животных = 0
    mov rsi, rdx        ; перенос указателя на файл
.loop:
    ; сохранение рабочих регистров
    push rdi
    push rbx

    mov     rsi, [.FILE]
    mov     rax, 0      ; нет чисел с плавающей точкой
    call    InAnimal     ; ввод животного
    cmp rax, 0          ; проверка успешности ввода
    jle  .return        ; выход, если признак меньше или равен 0

    pop rbx
    inc rbx

    pop rdi
    add rdi, 16             ; адрес следующего животного

    jmp .loop
.return:
    mov rax, [.plen]    ; перенос указателя на длину
    mov [rax], ebx      ; занесение длины
leave
ret