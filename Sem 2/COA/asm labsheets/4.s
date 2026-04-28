.data 
	p1: .asciiz "$t9 = "
	p2: .asciiz "$t8 = "
	p3: .asciiz "$t1 = "
	p4: .asciiz "$t2 = "
	space: .asciiz ", "
	
.text
main:
	li $v0,4
	la $a0,p1
	syscall
	
	li $v0,5
	syscall
	move $t9,$v0
	
	
	li $v0,4
	la $a0,p2
	syscall
	
	li $v0,5
	syscall
	move $t8,$v0
	
	li $v0,4
	la $a0,p3
	syscall
	
	li $v0,5
	syscall
	move $t1,$v0
	
	
	li $v0,4
	la $a0,p4
	syscall
	
	li $v0,5
	syscall
	move $t2,$v0

	slt $t5,$t9,$0
	beq $t5,1,if
	j else 
		
if:
	sub $s0,$0,$t8
	addi $t1,$t1,2

	li $v0,1
	move $a0,$s0
	syscall
	
	li $v0,4
	la $a0,space
	syscall

	li $v0,1
	move $a0,$t1
	syscall
	j exit

else:
	add $s0,$t8,$0
	addi $t2,$t2,1
	
	li $v0,1
	move $a0,$s0
	syscall
	
	li $v0,4
	la $a0,space
	syscall

	li $v0,1
	move $a0,$t2
	syscall
	j exit

exit: 
	li $v0,10
	syscall
