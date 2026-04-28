.data

.text
main:
    li $s1, 1      
    li $s2, 2      
    li $s3, 3    
    li $s4, 4       

    add $s1, $s1, $s2  
    add $s1, $s1, $s3   
    sub $s1, $s1, $s4  

    li $v0, 1            
    move $a0, $s1       
    syscall             

    li $v0, 10          
    syscall

