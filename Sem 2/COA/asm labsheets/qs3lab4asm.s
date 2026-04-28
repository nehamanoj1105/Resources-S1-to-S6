.data
	prompt1: .asciiz "enter a "
	prompt2: .asciiz "enter b "
	msg1: .asciiz "multiples"
	msg2: .asciiz "aren't multiples"
	
.text
main:
	li $v0, 4
        la $a0, prompt1
        syscall
        
        li $v0, 5
        syscall
        move $t0, $v0
        
	li $v0, 4
        la $a0, prompt2
        syscall
        
        li $v0, 5
        syscall
        move $t1, $v0
        
        beq $t0,$0,end
        beq $t1,$0,end
        
        div $t1,$t0
        mfhi $t0
        
        beq $s0,$t0,multiples
        
        li $v0, 4
        la $a0, msg2
        syscall
        j end
        
multiples:
    	li $v0, 4
        la $a0, msg1
        syscall
    
end:
    	li $v0,10
        syscall
        
          
        
        
			
