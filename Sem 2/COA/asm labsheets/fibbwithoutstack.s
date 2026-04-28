.data
    result_msg: .asciiz "Fibonacci result: "
.text

print_int:
    li $v0, 1
    syscall
    jr $ra

main:
    li $t0, 10
    li $t1, 0
    li $t2, 1

    li $t3, 2

fibonacci_loop:
    beq $t3, $t0, print_result

    add $t4, $t1, $t2
    move $t1, $t2
    move $t2, $t4

    addi $t3, $t3, 1
    j fibonacci_loop

print_result:
    la $a0, result_msg
    li $v0, 4
    syscall

    move $a0, $t2
    jal print_int

    li $v0, 10
    syscall

