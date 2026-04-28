.data
result: .asciiz "sum= "

.text
main:
	
	
	
	
	
	addi $s1,$0,0
	add $s0,$0,1
	addi $t0,$0,101
loop:   slt $t1,$s0,$t0
	beq $t1,$0,done
	nop
	add $s1,$s1,$s0
	sll $s0,$s0,1
	j loop
	
done:

	 li $v0, 4
         la $a0, result
         syscall

         li $v0, 1
         move $a0, $s1
         syscall

         li $v0, 10
         syscall
