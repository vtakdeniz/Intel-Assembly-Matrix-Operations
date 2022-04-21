segment .data

segment .bss

segment .text

global add

add:
    push ebp
    mov ebp, esp

    sub esp, 20

    mov ebx, [ebp + 8]
    mov [esp-4],ebx ; pointer to first array

    mov ebx, [ebp + 12] 
    mov [esp-8],ebx ; pointer to second array

    mov ebx, [ebp + 16] 
    mov [esp-12],ebx ; pointer to result array

    mov ebx, [ebp + 20] ; size of array
    mov [esp-16],ebx

    mov esi, 0; row index
    mov ebx,0 ; sum

    loop1:      
        cmp esi,[esp-16] ; cmp index with size
        mov ecx,0 ;ecx=column index
        jne loop2
        jmp end

    loop2:
        mov ebx,0

        mov edi,[esp-4]
        mov edi,[edi+esi]
        mov edi,[edi+ecx*4]
        add ebx,edi

        mov edi,[esp-8]
        mov edi,[edi+esi]
        mov edi,[edi+ecx*4]
        add ebx,edi

        mov edi,[esp-12]
        mov edi,[edi+esi]
        mov eax,ecx
        mov edx,4
        mul edx
        add edi,eax
        mov [edi],ebx

        cmp [esp-16],ecx
        add ecx,1
        jne loop2
        add esi,1
        jmp loop1
        
end:
    
    mov esp, ebp
    pop ebp
    ret

