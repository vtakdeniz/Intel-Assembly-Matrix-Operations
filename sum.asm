segment .data

segment .bss

segment .text

global sum

sum:
    push ebp
    mov ebp, esp
    
    sub esp, 20

    mov ebx, [ebp + 8]
    mov [esp-4],ebx ; pointer to first array

    mov ebx, [ebp + 12] 
    mov [esp-8],ebx ; pointer to size array

    mov esi, 0; row index
    mov ebx,0 ; sum

    loop1:      
        mov ecx,0 ; ecx=column index
        cmp esi,[esp-8] ; cmp index with size
        jne loop2
        jmp end

    loop2:
        mov edi,[esp-4]
        mov edi,[edi+esi*4]
        mov edi,[edi+ecx*4]
        add ebx,edi

        mov edx,[esp-8]
        cmp edx,ecx
        jne jumptoloop2
        jmp jumptoloop1
    jumptoloop2:
        add ecx,1
        jmp loop2
    jumptoloop1:
        inc esi
        jmp loop1
        
end:
    mov eax,ebx
    mov esp, ebp
    pop ebp
    
    ret

