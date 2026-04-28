.data
    result_msg: .asciiz "fact"
.text

print_int:
    li $v0, 1
    syscall
    jr $ra

main:
    li $a0, 5
    li $t0, 1
    li $t1, 1

factorial_loop:
    bgt $t1, $a0, print_result

    mul $t0, $t0, $t1
    addi $t1, $t1, 1
    j factorial_loop

print_result:
    la $a0, result_msg
    li $v0, 4
    syscall

    move $a0, $t0
    jal print_int

    li $v0, 10
    syscall

