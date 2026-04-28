.data
prompt: .asciiz "enter number : "

.text
main:
    li $v0, 4
    la $a0, prompt
    syscall
    
read_loop:
    li $v0, 5
    syscall
    move $t0, $v0
    
    beq $t0, $zero, exit
    
    li $t1, 8
    
print_loop:
    srl $t2, $t0, 7
    andi $t2, $t2, 1
    li $v0, 1
    move $a0, $t2
    syscall
    
    sll $t0, $t0, 1
    addi $t1, $t1, -1
    bnez $t1, print_loop

    
    li $v0, 4
    la $a0, newline
    syscall
    
    j read_loop

exit:
    li $v0, 10
    syscall

.data
newline: .asciiz "\n"

