.data
result: .asciiz "x= "

.text
main:
	
	
	
	
	
	addi $s0,$0,1
	add $s1,$0,0
	addi $t0,$0,128
while: beq $s0,$t0,done
	sll $s0,$s0,1
	addi $s1,$s1,1
	j while
	
done:

	 li $v0, 4
         la $a0, result
         syscall

         li $v0, 1
         move $a0, $s1
         syscall

         li $v0, 10
         syscall
