.data
prompt: .asciiz "enter no: "
div_msg: .asciiz "divisible by 5"
not_div_msg: .asciiz "not divisible by 5"

.text
div_by_5:
	addi $sp,$sp,-8
	sw $ra, 4($sp)
	sw $a0, 0($sp)
	
	li $t0,5
	div $a0,$t0
	mfhi $t1
	beq $t1,$zero,divisible_1
	
	li $v0,0
	j end_divisible_2

divisible_1:
	li $v0,1
	
end_divisible_2:
	lw $ra, 4($sp)
	lw $a0, 0($sp)
	addi $sp,$sp,8
	jr $ra

main:
	li $v0,4
	la $a0,prompt
	syscall
	
	li $v0,5
	syscall
	
	move $a0,$v0
	jal div_by_5
	
	beq $v0,$0,not_div
	li $v0,4
	la $a0,div_msg
	syscall
	j end
	
not_div:
	li $v0,4
	la $a0,not_div_msg
	syscall

end:
	li $v0,10
	syscall
