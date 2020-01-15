.global _start
_start:
    ldr r0, =X
    ldr r1, =Y
    mov r2, #7
    mov r3, #6
func:
    sub sp,sp, #36
    str lr, [sp,#0]    //Link Register
    str r0, [sp,#4]    //char *X
    str r1, [sp,#8]    //char *Y
    str r2, [sp,#12]   //int m
    str r3, [sp,#16]   //int n
    str r4, [sp,#20]   //Garbage -> int a
    str r5, [sp,#24]   //Garbage -> int b
    str r6, [sp,#28]   //Garbage
    str r7, [sp,#32]   //Garbage

    b IF1
returnzero:
    mov r0, #0
    b return
return:
    ldr lr, [sp,#0]    //Restore Link Register
    ldr r1, [sp,#8]    //Restore char *Y
    ldr r2, [sp,#12]   //Restore int m
    ldr r3, [sp,#16]   //Restore int n
    ldr r4, [sp,#20]   //Restore Garbage <- int a
    ldr r5, [sp,#24]   //Restore Garbage <- int b
    ldr r6, [sp,#28]   //Restore Garbage
    ldr r7, [sp,#32]   //Restore Garbage
    add sp, sp, #36
    bx lr
IF1:
    mov r6, #0
    cmp r2, r6
    BEQ returnzero
    cmp r3, r6
    BEQ returnzero
IF2:
    sub r4, r2, #1
    sub r5, r3, #1
    add r4, r0, r4
    add r5, r1, r5
    mov r4, r4, lsl #2
    mov r5, r5, lsl #2
    ldr r4, [r4]
    ldr r5, [r5]
    cmp r4, r5
    bne IF3
    sub r4, r2, #1
    sub r5, r3, #1
    mov r2, r4
    mov r3, r5
    bl func
    add r0, r0, #1
    b return
IF3:
    sub r5, r3, #1
    mov r3, r5
    bl func
    ldr r3, [sp,#16]
    mov r6, r0
    str r0, [sp,#4]
    sub r4, r2, #1
    mov r2, r4
    bl func
    ldr r2, [sp,#12]
    mov r7, r0
    ldr r0, [sp,#4]
    cmp r6,r7
    bgt returna
    mov r0, r7
    b return
returna:
    mov r0, r6
    b return
X:
    .asciz "ABCBDAB"
Y:
    .asciz "BDCABA"