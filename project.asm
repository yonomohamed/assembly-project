.model small
.DATA
                 ;MAIN OPERATIONS
 A    DB       10,  "Enter Your Password" ,"$" 
WELCOME DB    10,  " Welcome to Your Account" ,"$" 
INQUIRY DB    10,  "1- Balance Inquiry" ,"$" 
Withdraw DB    10,   "2- Money Withdraw" ,"$" 
EXIT DB       10,  "3- Exit $"

BCK DB       10,   "1- Back$" 
QUIT db       10,   "2- QUIT", "$"
      ;ERROR MASSAGE
      B DB 10,"Invalid Password$","$"

      ;ACCOUNT PASSWORD
      PASSWORD DB "mohamed","$" 
      PASS Dw 7

INVALID DB  10,"Invalid Input" ,"$"

c DB "$"

MONEY DB   10, "YOUR VALID MONEY is:-  15000 LE $" 

;MONEY WANTED
FIRSTCASE DB 10, "1- 1000 LE " ,"$" 
SECONDCACE DB  10, "2- 2000 LE " ,"$"
THIRDCASE DB 10, "3- 5000 LE" ,"$"
FORTHCASE  DB 10, "4- 10,000 LE" ,"$"


   ;BALANCE INFORMATION
C1 DB 10, "YOYR VALID MONEY is:14,000 LE " ,"$" 
C2 DB 10,"YOYR VALID MONEY is: 13,000 LE " ,"$" 
C3 DB 10, "YOYR VALID MONEY is: 10,000 LE " ,"$" 
C4 DB 10, "YOYR VALID MONEY is: 5000 LE " ,"$" 


;Amount of money
AMOUNT DB 10, "ENTER MONEY WANTED" ,"$" 
SUCCESS DB  10, "Successfull operation get your money and card...","$" 


.code
main proc far
.STARTUP 
  
    ;CHECK PASSWORD
    mov cx,PASS
    mov bx,offset PASSWORD
                                
    mov dx, OFFSET A
    CALL PRINT_STRING             
    
    cheekpass:
    mov ah,8
    int 21h
    cmp al,[bx] 
    jne worng
    mov ah,2
    mov dl,42
    int 21h
    inc bx
    loop cheekpass
    ;[--CHECK PASSWORD END--] 
    
    jmp new_operation
    
    
    worng:
                         
    mov dx, offset B                   
    mov ah,9
    int 21h
    mov ah,4ch
    int 21h
    
    
    new_operation:
    ;[--MAIN interface--]
    
                                       
    mov dx, offset WELCOME 
    CALL PRINT_STRING                    
    
    
    mov dx , offset INQUIRY
    CALL PRINT_STRING                   
    
                                        
    mov dx, offset Withdraw
    CALL PRINT_STRING                   
    
                                        
    mov dx , offset EXIT
    CALL PRINT_STRING                 
    
    mov dx, OFFSET c 
    CALL PRINT_STRING
    
    ;[--read Selection from user--]
    mov ah,1
    int 21h
    mov bl,al
    ;[--------------------------] 
     
    ;Input Cheek 
    cheek:
    cmp bl,49 
    je blance
    cmp bl,50 
    je wdraw
    cmp bl,51 
    jmp ex
    
;----------------------------------------------------------------------
          ;[----option 1 in main interface------]     
    blance:
                                 
    lea dx,MONEY
    CALL PRINT_STRING             
    
    mov ah,9
    jmp option
;{++++++
    ;[---Fixed in all interface---]
    option: 
   mov dx,offset c ;[--C--]
    CALL PRINT_STRING 
    
    lea dx,BCK
    CALL PRINT_STRING              
                                     
    lea dx,QUIT
    CALL PRINT_STRING                
                                     
    mov dx,offset c 
    CALL PRINT_STRING
    
    ;[--read Selection from user--]
    mov ah,1
    int 21h
    ;[--------------------------]
    cmp al,49
    jmp back
    cmp al,50
    jmp ex
    jmp error     ;++++++}
;---------------------------------------------------------------------
             ;[-----option 2 in main interface------] 
    wdraw:
    
    mov dx,offset c 
    CALL PRINT_STRING 
             
    lea dx,AMOUNT
    CALL PRINT_STRING                     
    
    ;Money wanted Options 
                                         
    lea dx,FIRSTCASE
    CALL PRINT_STRING                   
    
                                       
    lea dx,SECONDCACE
    CALL PRINT_STRING                     
    
                                           
    lea dx,THIRDCASE
    CALL PRINT_STRING                    
    
                                        
    lea dx,FORTHCASE
    CALL PRINT_STRING                   
     
     mov dx,offset c 
    CALL PRINT_STRING
    
    ;[--read Selection from user--]
    mov ah,1
    int 21h   ; tap
    ;[--------------------------]
    mov bl,al 
    
    ;Input Condition Cheek
    cmp bl,49 
    je pross1 
    
    cmp bl,50 
    je pross2
    
    cmp bl,51 
    jmp pross3
    
    cmp bl,52
    jmp pross4  
    jmp error
    
    pross1:
 
    lea dx,SUCCESS
    CALL PRINT_STRING                      
  
     mov dx,offset c 
    CALL PRINT_STRING
    
    lea dx,C1
    CALL PRINT_STRING                         
  
                                          
      mov dx,offset c 
    CALL PRINT_STRING                       
    
    jmp option
    
   
    pross2:
                                   
    
    lea dx,SUCCESS
    CALL PRINT_STRING                 
    
    mov dx,offset c 
    CALL PRINT_STRING
    
    lea dx,C2
    CALL PRINT_STRING               
    
     mov dx,offset c 
    CALL PRINT_STRING
  
    jmp option
    
    pross3:
    lea dx,SUCCESS
    CALL PRINT_STRING                  
    
    mov dx,offset c 
    CALL PRINT_STRING
    
    lea dx,C3
    CALL PRINT_STRING                    
    
     mov dx,offset c 
    CALL PRINT_STRING
    
    jmp option
    
    pross4:
    lea dx,SUCCESS
    CALL PRINT_STRING    
   
     mov dx,offset c 
    CALL PRINT_STRING
   
    lea dx,C4
    CALL PRINT_STRING
    
    mov dx,offset c 
    CALL PRINT_STRING   
    jmp option
    ;[-----------------]    
    back:
     call  new_operation
    ;[-----------------]
      error:
    lea dx,B
    CALL PRINT_STRING 
     
     mov dx,offset c 
    CALL PRINT_STRING  
    call new_operation
  
    ex:
    .exit
    main endp
    
    ;[----%---]
    PRINT_STRING proc near
    MOV AH, 09H
        INT 21H
        RET
    PRINT_STRING ENDP
        
end main 
      
    
     
    
    
    

