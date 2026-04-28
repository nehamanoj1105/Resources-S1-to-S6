.data
n:  .asciiz"enter the value for n: \n"
result: .asciiz"result: \n "
.text
.globl main
main:
    li $v0, 4
    la $a0,n
    syscall

    li $v0,5
    syscall
    move $t0, $v0

    li $t1, 0
    li $t2, 1

loop:
        
     add $t1, $t1, $t2
     addi $t2, $t2, 1
     ble $t2 , $t0, loop

    
    li $v0 ,4
    la $a0, result
    syscall

    li $v0, 1
    move $a0, $t1
    syscall


exit:
    li $v0, 10
    syscall
