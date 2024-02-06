; 
; Base Author:  Megan Avery Spring 2024
; Exercise Author: [YOUR NAME HERE]
; 
; Purpose - to learn about the following:
; 	- comments
;	- dumping registers
;	- printing empty lines
;	- instructions: mov, add, sub, inc/dec

%include "asm_io.inc"

; initialized data
segment .data

prompt_int db "Enter your favorite number: ", 0 ; message

start_num db "Starting number: ", 0 ; message

t10 db "Number * 10: ", 0 ; message
t72 db "Number * 72: ", 0 ; message
t81 db "Number * 81: ", 0 ; message

; uninitialized data
segment .bss
chosen_num resb 4 ; this will be our number we typed in

segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
        
        mov eax, prompt_int ; eax = "Enter your favorite number: "
        call print_string ; print "Enter your favorite number: "
        call read_int ; eax = int i typed
        mov ebx, eax ; ebx = int i typed
        mov [chosen_num], ebx ; chosen_num = int i typed
        call print_nl ; printing new line
        mov eax, start_num ; eax = "Starting number: "
        call print_string ; prints "Starting number: "
        mov eax, [chosen_num] ; eax = 0
        call print_int ; printing chosen_num
        call print_nl ; new line
        mov eax, t10 ; eax = "Number * 10: "
        call print_string ; prints "Number * 10: "

        mov eax, 0 ; eax resets to 0
        mov ebx, [chosen_num] ; ebx = chosen_num
        add ebx, [chosen_num] ; ebx = chosen_num * 2
        add eax, ebx ; 0 += chosen_num * 2
        add eax, ebx ; chosen_num * 2 +=  chosen_num * 2
        add eax, ebx ; chosen_num * 4 +=  chosen_num * 2
        add eax, ebx ; chosen_num * 6 +=  chosen_num * 2
        add eax, ebx ; chosen_num * 8 +=  chosen_num * 2
        call print_int ; print chosen_num * 10
        call print_nl ; print new line
        ; done printing number * 10


        mov eax, t72 ; eax = "Number * 72: "
        call print_string ; prints "Number * 72: "
        
        mov eax, [chosen_num] ; eax = chosen_num
        add eax, eax ; chosen_num += chosen_num
        add eax, eax ; chosen_num * 2 += chosen_num * 2
        add eax, eax ; chosen_num * 4 += chosen_num * 4
        mov ebx, eax ; ebx = third addition
        add eax, eax ; chosen_num * 8 += chosen_num * 8
        add eax, eax ; chosen_num * 16 += chosen_num * 16
        add eax, eax ; chosen_num * 32 += chosen_num * 32
        add eax, ebx ; chosen_num * 64 += chosen_num * 8
        call print_int ; print chosen_num * 72
        call print_nl ; print_nl
        ; done printing number * 72


        mov eax, t81 ; eax = "Number * 81: "
        call print_string ; prints "Number * 72: "

        mov eax, [chosen_num] ; eax = chosen_num
        add eax, eax ; chosen_num += chosen_num
        add eax, eax ; chosen_num * 2 += chosen_num * 2
        add eax, eax ; chosen_num * 4 += chosen_num * 4
        add eax, eax ; chosen_num * 8 += chosen_num * 8
        mov ebx, eax ; ebx = 4th addition
        add eax, eax ; chosen_num * 16 += chosen_num * 16
        add eax, eax ; chosen_num * 32 += chosen_num * 32
        add eax, ebx ; chosen_num * 64 += chosen_num * 16
        add eax, [chosen_num] ; chosen_num * 64 += chosen_num
        call print_int ; print chosen_num * 81
        call print_nl ; print new line

        



		; TODO: add code

        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
