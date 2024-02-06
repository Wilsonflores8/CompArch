<<<<<<< HEAD
; Base Author: Megan Avery Spring 2024
; Exercise Author: [YOUR NAME HERE]
; 
; Purpose - to learn about the following:
;	-  directives (dx, resx, & times)
;	- printing ints and characters
;	- dumping memory
;	- printing strings
;	- reading chars and ints

%include "asm_io.inc"

age equ 30 ; Symbol
; %define fav_number 14 ; Macro

; initialized data
segment .data

; fav_color db "purple", 0 ; string
; least_fav_color db "yellow", 0
hw db "hello", 0

; char_prompt db "Enter a charecter: ", 0
; int_prompt db "Enter an integer: ", 0

number dd 116 ; Integer
; letter db "A", 0 ; Charecter

; num dd 87

; many_number times 15 dd 34

; characters times 5 db "Z"

segment .bss
; fav_number resd 1
=======
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
>>>>>>> a230cfd (test 2/5)

segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
<<<<<<< HEAD

        mov eax, [hw] ; eax = 116
        call print_int
        call print_nl
        mov eax, hw
        call print_int

        call print_nl

        mov eax, number
        call print_int
        call print_nl
        mov eax, [number]
        call print_int
        ; mov dword [number], 32 ; makes umber 32, not eax

        ; mov eax, hw
        ; call print_string

        ; call print_int
        ; call print_char

        ; mov eax, [num]

        ; call print_int
        ; call print_nl
        ; call print_char

        ; dump_mem 1, fav_color, 0

        ; mov eax, fav_color + 3
        ; call print_string

        ; mov eax, hw

        ; call print_string
        ; call print_nl
        ; dump_mem 1, hw, 0

        ; mov eax, char_prompt
        ; call print_string
        ; call read_char

        ; mov eax, int_prompt
        ; call print_string
        ; call read_int

        ; dump_mem 1, characters, 0
        ; call print_nl
        ; dump_mem 2, characters + 3, 0
=======
        
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
>>>>>>> a230cfd (test 2/5)

        popa
        mov     eax, 0            ; return back to C
        leave                     
<<<<<<< HEAD
        ret
=======
        ret
>>>>>>> a230cfd (test 2/5)
