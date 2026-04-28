.data
    result_msg: .asciiz "Fibonacci series: "
    
.text
    print_int:
        li $v0, 1
        syscall
        jr $ra
    
main:
    li $t0, 0
    li $t1, 1
    li $t2, 10
    
    la $a0, result_msg
    li $v0, 4
    syscall
    
    print_loop:
        move $a0, $t0
        jal print_int
        
        add $t3, $t0, $t1
        move $t0, $t1
        move $t1, $t3
        
        addi $t2, $t2, -1
        
        bgtz $t2, print_loop
    
    li $v0, 10
    syscall

