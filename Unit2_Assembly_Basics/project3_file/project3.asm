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

segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha

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

        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret