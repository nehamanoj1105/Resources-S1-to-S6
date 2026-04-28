.data
prompt: .asciiz "enter no: "
shift_prompt: .asciiz "enter shift: "
result_msg: .asciiz "Result: "

.text
main:
    li $v0, 4
    la $a0, prompt
    syscall
    
    li $v0, 5
    syscall
    move $t0, $v0
    
    li $v0, 4
    la $a0, shift_prompt
    syscall
    
    li $v0, 5
    syscall
    move $t1, $v0
    
    sll $t2, $t0, $t1
    
    li $v0, 4
    la $a0, result_msg
    syscall
    
    li $v0, 1
    move $a0, $t2
    syscall
    
    li $v0, 10
    syscall

