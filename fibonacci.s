.global main
main:
	mov r0,#2
	ldr r1, =fib_series
	mov r2,#0
	mov r3,#1
	mov r5,#10
	str r2,[r1],#4
	str r3,[r1],#4
fibonacci:
	add r4,r2,r3
	str r4,[r1],#4
	mov r2,r3
	mov r3,r4
	add r0,#1
	cmp r0,r5
	blt fibonacci
end:
	b end
	
.data
fib_series:
	
	