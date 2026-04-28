.data
.text
main:
	li $a0,5
	li $t0,1
	li $t1,1
	
fact:
	mul $t0,$t0,$t1
	addi $t1,$t1,1
	bne $t1,$a0,fact
	
	move $a0,$t0
	li $v0,1
        syscall
        
        li $v0,10
        syscall
