main:
    li $a0, 5         # Set $a0 to the value for which factorial is calculated (5)
    jal fact          # Call factorial subroutine

    move $a0, $v0     # Move the result from $v0 to $a0 for printing
    li $v0, 1         # Load syscall code for printing an integer
    syscall           # Print the result (factorial of 5)

    li $v0, 10        # Load syscall code for exit
    syscall           # Exit the program

fact:
    # Base case: if $a0 is 0 or 1, return 1
    li $v0, 1         # Load 1 into $v0 (base case result)
    bgt $a0, 1, L1    # Branch if $a0 > 1 (skip if $a0 is 0 or 1)
    jr $ra            # Jump back to caller (return 1 for base case)

L1:
    addi $a0, $a0, -1   # Decrement $a0 by 1
    jal fact            # Recursive call to factorial subroutine
    mul $v0, $a0, $v0   # Multiply the result from recursive call by current $a0 value
    jr $ra              # Return to the caller

