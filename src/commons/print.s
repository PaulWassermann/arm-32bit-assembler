// Macro that writes a null-terminated string to standard output
//
//      Uses :
//      - r0 to store STDOUT file descriptor
//      - r1 to load the adress of the string
//      - r2 to accumulate the number of characters in the string
//      - r3 to store the current character

.data
newline_str:        .string         "\n"

.text
.macro  print   str:req, newline=0

        ldr     r1, =\str
        mov     r2, #0

1:
        ldrb    r3, [r1, r2]
        cmp     r3, #0
        beq     2f
        add     r2, #1
        b       1b

2:
        mov     r7, #4
        mov     r0, #1
        // r1 and r2 are already set
        svc     0

        .if \newline
                mov     r7, #4
                mov     r0, #1
                ldr     r1, =newline_str
                mov     r2, #1
                svc     0
        .endif
.endm

