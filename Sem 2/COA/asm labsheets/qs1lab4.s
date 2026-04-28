.data
result: .asciiz "f: "

.text
main:
	li $s3,5
	li $s4,1
	li $s1,2
	li $s2,4
	
	
	
	
	bne $s3, $s4 ,L1
	add $s0,$s1,$s2
	j done
L1:	sub $s0,$s0,$s3
done:
	 li $v0, 4
         la $a0, result
         syscall

         li $v0, 1
         move $a0, $s0
         syscall

         li $v0, 10
         syscall
