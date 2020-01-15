.global _start
_start:
	mov r0, #11
	ldr r1, =a
	mov r2, #50
	bl func
end:
	b end
func:
    sub sp,sp, #36
    str lr, [sp,#0]
    str r0, [sp,#4]
    str r1, [sp,#8]
    str r2, [sp,#12]
    str r3, [sp,#16]
    str r4, [sp,#20]
    str r5, [sp,#24]
    str r6, [sp,#28]
    str r7, [sp,#32]
    //initialize variables
    mov r5, #10
    sub r3, r0, r5
    ldr r5,[r1,#0]
    mov r6, #1
    add r4, r5, r6
    str r4, [r1,#0]
    b IF1
    //return code here
return:
    mov r0, r3
    ldr lr, [sp,#0]
    ldr r1, [sp,#8]
    ldr r2, [sp,#12]
    ldr r3, [sp,#16]
    ldr r4, [sp,#20]
    ldr r5, [sp,#24]
    ldr r6, [sp,#28]
    ldr r7, [sp,#32]
    add sp,sp, #36
    bx lr
IF1:
    mov r5, #100
    cmp r0,r5
    BGT IF2
    mov r6, #11
    add r0, r0, r6
    bl func
    mov r5, r0
    bl func
    mov r3, r0
    ldr r0, [sp,#4]
IF2:
    cmp r4, r2
    bge return
    add r6, r1, r4, LSL #2
    str r3, [r6]
	b return

    
    


a:
	.word 0
	.word 3
	.word 4
	.word 5
	