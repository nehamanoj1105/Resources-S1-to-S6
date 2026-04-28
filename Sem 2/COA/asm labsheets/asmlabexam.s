.data
x: ,asciiz "x "
y: ,asciiz "y "
swapped: .asciiz "swapped values "

.text
main:
	li $v0,4
	la $a0,x
	syscall
	
	li $v0,5
	syscall
	move $t0,$v0 
	
	li $v0,4
	la $a0,y
	syscall
	
	li $v0,5
	syscall
	move $t1,$v0 
	
	j swap
	
	move $t2,$t0
	move $t1,$t2
	move $t0,$t1
	
	li $v0,4
	la $a0,swapped
	syscall
	
	li $v0,1
	move $a0,$t0
	syscall
	j end

end:
	li $v0,10
	syscall

