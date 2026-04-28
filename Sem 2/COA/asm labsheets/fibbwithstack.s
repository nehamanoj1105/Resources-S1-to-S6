.data
msg: .asciiz "Enter number of terms:\n"
result: .asciiz "The Fibonacci series is:\n"
newline: .asciiz "\n"

.text
main:
    li $sp, 0x7FFFFC00

    li $v0, 4           
    la $a0, msg
    syscall
    li $v0, 5           
    syscall
    move $t0, $v0       

    li $t1, 0           
    li $t2, 1           

    li $v0, 4           
    la $a0, result
    syscall
    
    move $a0, $t1
    li $v0, 1           
    syscall

    move $a0, $t2
    li $v0, 1          
    syscall
    
    addi $sp, $sp, -8   
    sw $t2, 0($sp)     
    sw $t1, 4($sp)      

    li $t3, 2           
loop:
    addi $t3, $t3, 1    

    lw $t1, 4($sp)    
    lw $t2, 0($sp)      

    add $t4, $t1, $t2   

    move $a0, $t4       
    li $v0, 1           
    syscall

    addi $sp, $sp, -4  
    sw $t4, 0($sp)      

    bne $t3, $t0, loop  

    li $v0, 4         
    la $a0, newline
    syscall

    li $v0, 10        
    syscall
