;ROSELLO, MA. JAZMINE P.
;2021-09665

global	_start

section	.data
	SYS_EXIT equ 60
	a db 0
	b db 15
    c db 255
	largestNum db 0 
    largestInput db "N"

	
section	.text
_start:
    ;move a b c sa register
    mov al, byte[b]
    mov cl, byte[a]
    mov bl, byte[c]

    mov byte[largestNum], cl ;ilagay si cl which is si a sa largest sum
    cmp byte[largestNum], al ;compare largestsum sa al which is b 
    ja check1 ;check if it is greater than doon kapgf oo then punta sa check 1
    
    ;if mas greater si b kay a then mov lang si al sa largestNum tapos jump na sa check 2
    ; mov byte[largestNum], al 
    jmp check2


    
;compare a sa c tapos kapag below si a punta sa check 2 para icompare na si c sa b kung greater than naman si a kay c then procees lang na ilagay sa largestInput ay si A
check1:
    
    cmp byte[largestNum], bl 
    jb check2
    mov byte[largestInput], "A"
    jmp exit_here

;compare si c kay b tapos if below is c then punta sa check3 para istore na sa largestSum and laregest input ay si B and value nito
check2:
    mov byte[largestNum], bl
    cmp byte[largestNum], al
    jb check3
    mov byte[largestInput], "C"
    jmp exit_here

;store value of al which is b sa largestNum adn si B sa largestInput
check3:
    mov byte[largestNum], al
    mov byte[largestInput], "B"

exit_here:
    mov rax, SYS_EXIT
    xor rdi, rdi
    syscall