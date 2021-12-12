; file.asm - использование файлов в NASM
extern printf
extern fprintf

extern PerimeterRectangle
extern PerimeterTriangle

extern FISH
extern BIRD
extern BEAST

global OutFish
OutFish:
section .data
    .outfmt db "It is Fish: name = %s, weight = %d, hdbit = %d. ",10,0
section .bss
    .ptrian  resq  1
    .FILE   resq  1       ; временное хранение указателя на файл
    .p      resq  1       ; вычисленный периметр треугольника
section .text
push rbp
mov rbp, rsp

    ; Сохранени принятых аргументов
    mov     [.ptrian], rdi        ; сохраняется адрес рыбы
    mov     [.FILE], rsi          ; сохраняется указатель на файл

    ; Вычисление периметра треугольника (адрес уже в rdi)
    ;call    PerimeterTriangle
    ;movsd   [.p], xmm0          ; сохранение (может лишнее) периметра

    ; Вывод информации о рыбе в файл
    mov     rdi, [.FILE]
    mov     rsi, .outfmt        ; Формат - 2-й аргумент
    mov     rax, [.ptrian]      ; адрес рыбы
    mov     edx, [rax]          
    mov     ecx, [rax+4]        
    mov      r8, [rax+8]        
    movsd   xmm0, [.p]
    mov     rax, 1              ; есть числа с плавающей точкой
    call    fprintf

leave
ret

global OutBird
OutBird:
section .data
    .outfmt db "It is Bird: name = %s, weight = %d, migratory = %d. ",10,0
section .bss
    .ptrian  resq  1
    .FILE   resq  1       ; временное хранение указателя на файл
    .p      resq  1       ; вычисленный периметр треугольника
section .text
push rbp
mov rbp, rsp

    ; Сохранени принятых аргументов
    mov     [.ptrian], rdi        ; сохраняется адрес рыбы
    mov     [.FILE], rsi          ; сохраняется указатель на файл

    ; Вычисление периметра треугольника (адрес уже в rdi)
    ;call    PerimeterTriangle
    ;movsd   [.p], xmm0          ; сохранение (может лишнее) периметра

    ; Вывод информации о птице в файл
    mov     rdi, [.FILE]
    mov     rsi, .outfmt        ; Формат - 2-й аргумент
    mov     rax, [.ptrian]      ; адрес рыбы
    mov     edx, [rax]          
    mov     ecx, [rax+4]        
    mov      r8, [rax+8]        
    movsd   xmm0, [.p]
    mov     rax, 1              ; есть числа с плавающей точкой
    call    fprintf

leave
ret

global OutBeast
OutBeast:
section .data
    .outfmt db "It is Beast: name = %s, weight = %d, type = %d. ",10,0
section .bss
    .ptrian  resq  1
    .FILE   resq  1       ; временное хранение указателя на файл
    .p      resq  1       ; вычисленный периметр треугольника
section .text
push rbp
mov rbp, rsp

    ; Сохранени принятых аргументов
    mov     [.ptrian], rdi        ; сохраняется адрес рыбы
    mov     [.FILE], rsi          ; сохраняется указатель на файл

    ; Вычисление периметра треугольника (адрес уже в rdi)
    ;call    PerimeterTriangle
    ;movsd   [.p], xmm0          ; сохранение (может лишнее) периметра

    ; Вывод информации о звере в файл
    mov     rdi, [.FILE]
    mov     rsi, .outfmt        ; Формат - 2-й аргумент
    mov     rax, [.ptrian]      ; адрес рыбы
    mov     edx, [rax]          
    mov     ecx, [rax+4]        
    mov      r8, [rax+8]        
    movsd   xmm0, [.p]
    mov     rax, 1              ; есть числа с плавающей точкой
    call    fprintf

leave
ret

global OutAnimal
OutAnimal:
section .data
    .erAnimal db "Incorrect animal!",10,0
section .text
push rbp
mov rbp, rsp

    ; В rdi адрес фигуры
    mov eax, [rdi]
    cmp eax, [FISH]
    je fishOut
    cmp eax, [BIRD]
    je birdOut
    cmp eax, [BEAST]
    je beastOut
    mov rdi, .erAnimal
    mov rax, 0
    call fprintf
    jmp     return
fishOut:
    ; Вывод рыбы
    add     rdi, 4
    call    OutFish
    jmp     return
trianOut:
    ; Вывод птицы
    add     rdi, 4
    call    OutBird
beastOut:
    ; Вывод зверя
    add     rdi, 4
    call    OutBeast
return:
leave
ret

;----------------------------------------------
; // Вывод содержимого контейнера в файл
; void OutContainer(void *c, int len, FILE *ofst) {
;     void *tmp = c;
;     fprintf(ofst, "Container contains %d elements.\n", len);
;     for(int i = 0; i < len; i++) {
;         fprintf(ofst, "%d: ", i);
;         OutShape(tmp, ofst);
;         tmp = tmp + shapeSize;
;     }
; }
global OutContainer
OutContainer:
section .data
    numFmt  db  "%d: ",0
section .bss
    .pcont  resq    1   ; адрес контейнера
    .len    resd    1   ; адрес для сохранения числа введенных элементов
    .FILE   resq    1   ; указатель на файл
section .text
push rbp
mov rbp, rsp

    mov [.pcont], rdi   ; сохраняется указатель на контейнер
    mov [.len],   esi     ; сохраняется число элементов
    mov [.FILE],  rdx    ; сохраняется указатель на файл

    ; В rdi адрес начала контейнера
    mov rbx, rsi            ; число животных
    xor ecx, ecx            ; счетчик животных = 0
    mov rsi, rdx            ; перенос указателя на файл
.loop:
    cmp ecx, ebx            ; проверка на окончание цикла
    jge .return             ; Перебрали всех животных

    push rbx
    push rcx

    ; Вывод номера животного
    mov     rdi, [.FILE]    ; текущий указатель на файл
    mov     rsi, numFmt     ; формат для вывода животного
    mov     edx, ecx        ; индекс текущего животного
    xor     rax, rax,       ; только целочисленные регистры
    call fprintf

    ; Вывод текущего животного
    mov     rdi, [.pcont]
    mov     rsi, [.FILE]
    call OutAnimal     

    pop rcx
    pop rbx
    inc ecx                 ; индекс следующей фигуры

    mov     rax, [.pcont]
    add     rax, 16         ; адрес следующей фигуры
    mov     [.pcont], rax
    jmp .loop
.return:
leave
ret

