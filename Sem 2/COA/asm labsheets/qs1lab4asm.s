.data
newline: .asciiz "\n"

.text
main:
    li $t0, 15

loop:
    move $a0, $t0
    li $v0, 1
    syscall

    addi $t0, $t0, -1
    bgt $t0, $zero, loop//bgt branch greater than if t0>zero jump to loop

    la $a0, newline
    li $v0, 4
    syscall

    li $v0, 10
    syscall

