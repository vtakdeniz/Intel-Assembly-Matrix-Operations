#!/bin/bash

# The flags -fno-stack-protector -z execstack -no-pie -g are used to make debugging process in gdb easier.
# Flags -fno-stack-protector and -z execstack removes stack canary and makes stack executable.
# Flags -no-pie and -g deactivates position independent code and compiles the binary unstripped.

nasm -f elf32 add.asm -o add.o && nasm -f elf32 sum.asm -o sum.o  && gcc -c -m32 main.c -o main.o && gcc -m32 add.o main.o sum.o -fno-stack-protector -z execstack -no-pie -g -o main && ./main matrix1.txt matrix2.txt


