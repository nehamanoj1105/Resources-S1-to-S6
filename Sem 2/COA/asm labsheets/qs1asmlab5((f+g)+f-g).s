.data
G: .asciiz "\nenter g: "
H: .asciiz "\nenter h: "
I: .asciiz "\nenter i: "
J: .asciiz "\nenter j: "
Result: .asciiz"\n the result is "

.text
main:
    
    li $v0, 4          
    la $a0, G          
    syscall

    li $v0, 5          
    syscall
    move $s0, $v0      

    li $v0, 4
    la $a0, H
    syscall

    li $v0, 5
    syscall
    move $a1, $v0


    li $v0, 4
    la $a0, I
    syscall

    li $v0, 5
    syscall
    move $a2, $v0


    li $v0, 4
    la $a0, J
    syscall

    li $v0, 5
    syscall
    move $a3, $v0
 
    move $a0,$s0
   jal leaf_example

     
  
    li $v0,10
    syscall

     

leaf_example:
    addi $sp, $sp, -4
    sw $ra, 0($sp)

    
    add $t0, $a0, $a1     

    add $t1, $a2, $a3   
   
    sub $s0, $t0, $t1 
    
    li $v0,4
    la $a0,Result
    syscall
   
    li $v0,1
    move $a0,$s0
    syscall

    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra
