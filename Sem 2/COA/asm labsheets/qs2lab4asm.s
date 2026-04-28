.data
    prompt: .asciiz "n="
    newline: .asciiz "\n"
.text
main:
	li $v0, 4
        la $a0, prompt
        syscall
        
        li $v0, 5
        syscall
        move $t0, $v0
        
        li $t1, 1
loop:
	mul $t2,$t0,$t1	
	
	li $v0,1
        move $a0,$t2
        syscall
        
        li $v0,4
        la $a0,newline
        syscall
        
        addi $t1,$t1,1
        bne $t1,11,loop
        
        li $v0,10
        syscall
