#fibb using stack
.data
msg: .asciiz "\nEnter number of terms: "
result: .asciiz "The sequence is: "
newline: .asciiz "\n"

.text
main:
	li $v0,4
	la $a0,msg
	syscall
	
	li $v0,5
	syscall
	move $t0,$v0
	
	li $t1,0
	li $t2,1
	li $t3,2
	
	li $v0,1
	move $a0,$t1
	syscall
	
	li $v0,1
	move $a0,$t2
	syscall
	
	addi $sp,$sp,-8
	sw $t1,4($sp)
	sw $t2,0($sp)
	
fibb:
	add $t3,$t3,1
	lw $t1,4($sp)
	lw $t2,0($sp)
	add $t4,$t1,$t2
	
	li $v0,1
	move $a0,$t4
	syscall
	
	addi $sp,$sp,4
	sw $t2,0($sp)
	sw $t4,4($sp)
	
	bne $t3,$0,fibb
	
	li $v0,1
	la $a0,newline
	syscall
	
	li $v0,10
	syscall
	
	
	
	
	
	
