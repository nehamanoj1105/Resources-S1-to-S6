.data
prompt: .asciiz "Enter a number: "
divisible_msg: .asciiz "The number is divisible by 5."
not_divisible_msg: .asciiz "The number is not divisible by 5."

.text
.globl main

# Function to check if a number is divisible by 5
divisible_by_5:
    # Save registers and set up stack frame
    addi $sp, $sp, -8
    sw $ra, 4($sp)
    sw $a0, 0($sp)

    # Check if the number is divisible by 5
    li $t0, 5
    div $a0, $t0
    mfhi $t1
    beq $t1, $zero, divisible # If remainder is 0, the number is divisible

    # If not divisible by 5, return 0
    li $v0, 0
    j end_divisible_by_5

divisible:
    # If divisible by 5, return 1
    li $v0, 1

end_divisible_by_5:
    # Restore registers and stack frame
    lw $ra, 4($sp)
    lw $a0, 0($sp)
    addi $sp, $sp, 8
    jr $ra

# Main program
main:
    # Display prompt and read the number
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall

    # Call the function to check if divisible by 5
    move $a0, $v0
    jal divisible_by_5

    # Display the result based on return value
    beq $v0, $zero, not_divisible
    li $v0, 4
    la $a0, divisible_msg
    syscall
    j end_program

not_divisible:
    li $v0, 4
    la $a0, not_divisible_msg
    syscall

end_program:
    li $v0, 10
    syscall

