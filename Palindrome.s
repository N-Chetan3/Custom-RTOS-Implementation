.global main
main:
    ldr     r0, =12321  @ INPUT NO. (USING ldr pseudo instruction to be able to input upto 32 bit values. MOV only allows upto 16 bit)
    mov     r3, r0          @ copy of input for calculations
    mov     r2, #0          @ reversed number
    mov     r4, #10         @ the divisor 10

reverse_loop:
    cmp     r3, #0
    beq     check_palindrome

 @ DIVISION BY REPEATED SUBTRACTION METHOD as UDIV is not supported here
	
    mov     r6, #0          @ stores quotient
    mov     r9, r3          @ stores remainder

sub_loop:
    cmp     r9, r4
    blt     div_done

    sub     r9, r9, r4      @ Subtracting 10 each time
    add     r6, r6, #1      @ increment quotient by 1 for each iteration
    b       sub_loop

div_done:
    mul     r7, r2, r4
    add     r2, r7, r9      @ reversed_num = previous*10 + remainder
    mov     r3, r6          @ now quotient is the next dividend
    b       reverse_loop


check_palindrome:
    cmp     r0, r2          @ Comparing original number with reversed
    moveq   r1, #1
    movne   r1, #0

end:
    b end
