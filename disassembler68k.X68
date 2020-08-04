*-----------------------------------------------------------
* Title      :  I/O
* Written by :  Sesario Imanputra, Zachary Liong, Micha Rice, Marci Ma
* Date       :  
* Description: Starts at 4000. For testing purposes, theres a bunch of ML codes to disassemble at 4000. Currently, the first ML code at 4000 is NOP.
* afterwards, it will include ML of whatever we wrote after NOP.
* current I/O should be able to detext values exceeding the 32 bit unsigned range (FFFFFFFF) and recognize invalid input.
* if you input a lower case letter, it will automatically convert into uppercase. 
*-----------------------------------------------------------    
        ORG    $4000   
****************************************************        
pro              
                 NOP
                 
                 ;OPCODEGROUP8 TEST
                 ;MOVE.B  D2,D3          
                 ;MOVEA #$00000047,A0 ;should be data
                 
                 ;OPCODEGROUP1.1 TEST
                 ;MOVEM.W D3,-(A5)   
                 ;JMP    pa      ;should be data (not wokring)
                 
                 ;OPCODEGROUP6 TEST
                 ;ADD.B   D2,D3 
                 ;ADDX   -(A2),-(A3)    ;should be data (not working)
                 ;ADDA   D3,A3          ;should be data
                 
                 ;OPCODEGROUP4 TEST
                 ;SUB.B    D2,D3 
                 ;SUBX   -(A2),-(A3)    ;should be data (not working)
                 ;SUBA   D3,A3          ;should be data
                 
                 ;OPCODEGROUP5 TEST
                 ;MULS  D2,D3 
                 ;MULU  D2,D3           ;should be data (not working)
                 
                 ;OPCODEGROUP3 TEST
                 ;DIVU  D2,D3 
                 ;DIVS  D2,D3           ;should be data
                 
                 ;OPCODEGROUP1.5 TEST
                 ;LEA   $2000,A2  
                 
                 ;OPCODEGROUP5 TEST
                 ;AND   #3,D3            
                 ;EXG   D2,D3           ;should be data (not working)
                 
                 ;OPCODEGROUP1.3 TEST
                 NOT.B   D3
                 NOT.W   (A3)+
                 NOT.L   -(A3)
                 NOT.W   $1234
                 NOT.L   $12345678
                 ;MOVE  D3,SR           ;should be data (not working)

                 
                 ;OPCODEGROUP7.2 TEST
                 ;LSL   #2,D3 
                 
                 ;OPCODEGROUP7.1 TEST
                 ;ASL   #2,D3 
                 
                 ;OPCODEGROUP7.3.2 TEST
                 ;LSL   (A0)+ 
                 
                 ;OPCODEGROUP7.3.1 TEST                 
                 ;ASL   (A0)+ 
                 
                ;OPCODEGROUP2.3 TEST
                 BGT   pa
                
pa              ;OPCODEGROUP2.4 TEST
                 BLE   pi
                
pi              ;OPCODEGROUP2.2 TEST
                 BEQ   pu
                
pu              ;OPCODEGROUP2.1 TEST
                 BRA.W    po 
     
po
                 RTS

pe               ;OPCODEGROUP1.4 TEST
;                JSR   po   

                
                
****************************************************   
        ORG    $1000   
START:                  ; first instruction of program   

;inputs for testing are  here:    
                LEA     WELMSG,A1   ;Display intro message
                MOVE.B  #14,D0 
                TRAP    #15
                

INPUT1                                   
                LEA     MSGINPUT ,A1     ;Ask for first input
                MOVE.B  #14,D0          
                TRAP    #15       
                
                LEA     $9000,A1
                
                MOVE.W  #2,D0           ;had to specify or it wont work properly
                TRAP    #15    
                BRA     FOR_LOOP 
                
INPUT2          LEA     MSGINPUT2,A1    ;Ask for second input
                MOVE.B  #14,D0
                TRAP    #15
                
                LEA     $9000,A1
                
                MOVE.W  #2,D0
                TRAP    #15
                BRA     FOR_LOOP
                              
FOR_LOOP        CMP.B   D1,D3
                BEQ     CHECKNEG
                CLR.W   D6               
                ADD.B  (A1)+,D6
                CMP.B   #$30,D6
                BLT     BADINPUT
                CMP.B   #$39,D6
                BGT     CHECKINPUTAGAIN 
CONTLOOP
                JSR     AtoH
                CMPI.B  #0,D3
                BNE     OTHERVAL
                CMPI.B  #0,D7   
                BLT     SUBSTRACTVAL                 
                ADD.B   D6,D4 ;first value
RETLOOP                
                ADD.W   #1,D3
                BRA     FOR_LOOP
                
RETLOOPNEG                
                ;ADD.W   #1,D3
                ;ADD.W   #1,D7
                BRA     FOR_LOOP


SUBSTRACTVAL                 
                SUB.W   D6,D4
                BRA     RETLOOP
                
CHECKINPUTAGAIN 
                CMP.B   #$46,D6
                BGT     LOWERCASE
                CMP.B   #$41,D6
                BLT     BADINPUT
                BRA     CONTLOOP
                
LOWERCASE
                CMP.B   #$61,D6
                BLT     BADINPUT
                CMP.B   #$66,D6
                BGT     BADINPUT
                SUBI.B  #$20,D6
                BRA     CONTLOOP

                
OTHERVAL
                ASL.L   #4,D4 ;u r overflowing, this is the last digit u can add
                BVS     OVERFLOWINPUTCHECK ;u r overflowing, this is the last digit u can add
                CMPI.B  #0,D7
                BNE     OVERFLOWINPUT
                ADD.W   D6,D4           
                ADD.W   #1,D3
                BRA     FOR_LOOP
                
SUBSTRACTVALOTHER
                SUB.W   D6,D4
                BPL     OVERFLOWDETECT  
                ADD.W   #1,D3
                BRA     FOR_LOOP
  
OVERFLOWDETECT
                MOVE.L  #1,A5    
                ADD.W   #1,D3
                BRA     FOR_LOOP

OVERFLOWINPUTCHECK
                CMPI.B  #0,D7
                BNE     OVERFLOWINPUT
                ADDI.B  #1,D7
                ADD.W   D6,D4                
                ADD.W   #1,D3
                BRA     FOR_LOOP

OVERFLOWINPUT                
                LEA     BADVALUE,A1     
                MOVE.W  #13,D0          
                TRAP    #15 
                CLR.L   D7
                CLR.L   D6
                CLR.L   D5
                CLR.L   D4
                CLR.L   D3
                CLR.L   D2
                CLR.L   D1
                CLR.L   D0
                CMP.L   #$0,A2
                BEQ     INPUT1 
                BRA     INPUT2    

BADINPUT                
                LEA     BADCHARACTER,A1     
                MOVE.W  #13,D0          
                TRAP    #15 
                CLR.L   D7
                CLR.L   D6
                CLR.L   D5
                CLR.L   D4
                CLR.L   D3
                CLR.L   D2
                CLR.L   D1
                CLR.L   D0
                CMP.L   #$0,A2
                BEQ     INPUT1 
                BRA     INPUT2                                 
            
AtoH
                CMPI.B  #$30,D6
                BLT.B   ERR
                CMP.B   #$39,D6
                BGT.B   ALPHA
                SUBI.B  #$30,D6
                RTS
                
CHECKNEG                
                CMPI.B  #1,D5
                BLT     RESET
                        
RESET
                CLR.W   D6
                CLR.W   D5
                CLR.W   D3
                CLR.W   D7
                
                CMPI    #0,D4
                BEQ     INVALIDLOWVALUE 
                
                ADD.W   #1,D2
                CMPI.B  #0,D2
                CMPI.B  #2,D2
                BEQ     SAVESECOND
                ;MOVE.W  D4,(A4)+
                BRA     SAVESECOND
                
INVALIDLOWVALUE 
                LEA     VALUETOOLOW,A1     
                MOVE.W  #13,D0          
                TRAP    #15 
                CLR.L   D7
                CLR.L   D6
                CLR.L   D5
                CLR.L   D4
                CLR.L   D3
                CLR.L   D2
                CLR.L   D1
                CLR.L   D0
                CMP.L   #$0,A2
                BEQ     INPUT1 
                BRA     INPUT2             
                
                
ERR             
                CMPI.B #$2D,D6
                BEQ    NEGVALUE
                RTS
                
NEGVALUE
                ADD.W   #1,D5
                RTS


                
ALPHA
                CMPI.B #$41,D6
                BLT.B  ERR
                CMPI.B #$46,D6
                BGT.B  ERR
                SUBI.B #$37,D6
                RTS
                
SAVESECOND
                CLR.W   D1
                CLR.W   D3
                MOVE.L  D4,D2
                CLR.L   D4
                CLR.W   D0
                ;CLR.W   D4
                CLR.W   D6
                ;BRA     CHECKODD
                BTST.L  #0,D2
                BEQ     CHECKLOW ;even values will always have their first bit 0. 
                
                ;if not report error to higher ups. 
                LEA     EVENINPUTMSG,A1     
                MOVE.W  #13,D0          
                TRAP    #15 
                CLR.L   D7
                CLR.L   D6
                CLR.L   D5
                CLR.L   D4
                CLR.L   D3
                CLR.L   D2
                CLR.L   D1
                CLR.L   D0
                CMP.L   #$0,A2
                BEQ     INPUT1 
                BRA     INPUT2                
                
CHECKLOW
                CMP.L   #$0,A2
                BNE     FINISHSAVING
                MOVE.L  D2,A2
                BRA     INPUT2 
                
BADADDRESSORDER
                LEA     BADADDRESS,A1     
                MOVE.W  #13,D0          
                TRAP    #15 
                CLR.L   D7
                CLR.L   D6
                CLR.L   D5
                CLR.L   D4
                CLR.L   D3
                CLR.L   D2
                CLR.L   D1
                CLR.L   D0
                MOVE.L  #$0,A2
                MOVE.L  #$0,A3
                BEQ     INPUT1            
                
 
FINISHSAVING
                MOVE.L  D2,A3
                CLR.L   D2
                CMP.L   A3, A2 ;A2 > A3, then an error should appear
                BGT     BADADDRESSORDER
;by this point we have A3 holding destinationa and A2 holding origin. all data registers should be cleared at this point. the following address registers
;are not clear: A1, A2 (src), A3 (dest), A7 (stack pointer), A5 && A4 (output stack), D5 && D4i(page counter), D1 && D3 && D6 address output, D2 original value,
;D1 (temp used),

;send assembly language to D2
FEEDOPCODE                
                LEA         tempresult, A4      ; load the address of variable "tempresult" into A1
                MOVE.B     #$A,(A4)+
                CLR.L       D2
                MOVE.W      (A2)+,D2                                
                ;movem everything except D2, bcs u need it. 
                ADDI.W      #1,D1
                MOVEM.L     D1/D3-D7/A1-A6,-(sp) 
                BRA         OPCODETIME
                
OUTPUTADDRESS                
                ************* printing out address location
                MOVE.L      D1,D4
                MOVE.L      A2,D1
                SUB.L       #$2,D1
                MOVEM.L     D2-D7/A1-A3/A6,-(sp)   
                MOVE.L      #$8,D4 ;10
                JSR         HEXOUTPUT
                MOVEM.L    (sp)+,D2-D7/A1-A3/A6 ;I/O gets his stuff back
                MOVE.L      D4,D1
                CLR.W       D4   
                RTS


                
HEXOUTPUT      ;used D1(value being outpueed), D3 (D1 temp), D6 (char counter), A1(string buffer), A2 (string buffer), D4(0 size).
                CLR.L   D2
                CLR.L   D3
                CLR.L   D5
                CLR.L   D6
                CLR.L   D7
                CLR.L   D6                ; use D6 to count the total number of digits after conversion

                
                    
* your code should start here

CHEAPLOOP       CMP.L      #16,D1
                BLT        DIRECTCONV
                DIVS.W     #16,D1           ;find remainder 17
                MOVE.L     D1,D3            ;set up to isolate remainder
                ASR.L      #8,D3            ;remainder isolated 
                ASR.L      #8,D3            ;NOW
                LSL.L      #8,D1
                LSL.L      #8,D1
                LSR.L      #8,D1
                LSR.L      #8,D1            ;Clunkyway to clear left hand side
                BRA        CONVERTIT                
                   
DIRECTCONV      CMP        #0,D1            ;IF it is zero
                BEQ        DONE             ;we are done
                MOVE.B     D1,D3
                CLR        D1
                BRA        CONVERTIT
  
CONVERTIT       CMP        #9,D3            ;If over 9
                BGT        SPECCASE         ;go to adding 55
                ADD.B      #48,D3           ;otherwise add 48 for ascii 0-9
                ADD.B      #1,D6            ;increment #of characters
                MOVE.B     D3,(A4)+         ;add ascii value
                BRA        CHEAPLOOP              

SPECCASE        ADD.B      #55,D3           ;for ascii A-G
                ADD.B      #1,D6           ;increment #of characters
                MOVE.B     D3,(A4)+        ;add ascii value
                BRA        CHEAPLOOP
DONE  
                MOVE.B     D6,D5
*                MOVE.W     #$8,D6
                SUB.W      D4,D5
                CMPI.W     #0,D5
                BEQ        TOREVERSEIT
                MULS.W     #-1,D5
                AND.W      #$000F,D5
                
*ZeroLoop           
*                MOVE.B     #$0,(A5)+
*                SUBI.W     #1,D5
*                CMPI.B     #0,D5              
*                BNE        ZeroLoop
TOREVERSEIT  
                CMPI.W      #0,D4           ;if its zero or less skip (D4 <= 0)
                BLE         SKIPZEROLOOP
                CMPI.B      #0,D5 
                BEQ         SKIPZEROLOOP
                
ZEROLOOP        CLR.L       D1
                MOVE.B     #$30,(A4)+
                SUBI.W     #1,D5
                CMPI.B     #0,D5 
                BNE        ZEROLOOP    
                   
                
SKIPZEROLOOP
                RTS             
 

;OPCODE, with output shoved in A5
******************************************************************************************************************

OPCODETIME      MOVE.W      D2,D3                 ;this wasnt here. had to add it other wise there will be nothing in D3
                *^unclear what this does, it just clears D3 - Rio
                
                CMPI.W      #$4E71,D2        ;SPECIAL CASE FOR NOOP
                BEQ         NOOPBRANCH
                CMPI.W      #$4E75,D2        ;SPECIAL CASE FOR RTS
                BEQ         RTSBRANCH
                
                ;then we use D3 to get the first four hex values
                LSR.W       #8,D3
                LSR.W       #4,D3       ;AAAA xxxx xxxx xxxx
                
                ;OPCODE GENERAL GROUP
                CMPI.W      #%0100,D3
                BEQ         OPCODEGROUP1
                CMPI.W      #%0110,D3
                BEQ         OPCODEGROUP2
                CMPI.W      #%1000,D3
                BEQ         OPCODEGROUP3
                CMPI.W      #%1001,D3
                BEQ         OPCODEGROUP4
                CMPI.W      #%1100,D3
                BEQ         OPCODEGROUP5
                CMPI.W      #%1101,D3
                BEQ         OPCODEGROUP6
                CMPI.W      #%1110,D3
                BEQ         OPCODEGROUP7
                CMPI.W      #3,D3
                BLE         OPCODEGROUP8
                BRA         INVALIDBRANCH
                
OPCODEGROUP1    JSR         NEXTFOURHEX
                CMPI.W      #%1000,D3
                BEQ         MOVEMBRANCH 
                CMPI.W      #%1100,D3
                BEQ         MOVEMBRANCH 
                CMPI.W      #%0110,D3
                BEQ         NOTBRANCH   
                CMPI.W      #%1110,D3
                BEQ         JSRMBRANCH  ;got to double check for this branch. too much unncertainty
                BTST.L      #0,D3 ;OOGABOOGA
                BNE         LEABRANCH       ;z == 0 if bit is 1 AND got to double check for this branch. too much unncertainty
                BRA         INVALIDBRANCH
                
MOVEMBRANCH     CLR.L   D3
                JSR     getSizeFormat2
                MOVE.B  D3,(A4)+
                MOVE.B  #'.',(A4)+
                MOVE.B  #'M',(A4)+
                MOVE.B  #'E',(A4)+
                MOVE.B  #'V',(A4)+
                MOVE.B  #'O',(A4)+
                MOVE.B  #'M',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                JSR     OUTPUTADDRESS
                JSR     EAOUTPUT 
                BRA     NEXTIO
                                
NOTBRANCH       ;check 7 and 8 and make sure they are  not 11 from 7 and 8
                CLR.L   D3
                MOVE.W  D2,D3
                LSL     #6,D3
                CMPI.W  #%0100011011,D3
                BEQ     INVALIDBRANCH
                CLR.L   D3 ;this is now going to hold size branch value
                ;should also check size bits
*                LEA     NOTMSG,A1
*                MOVE.B  #14,D0
*                TRAP    #15
                MOVEM.L D2,-(SP)
                JSR     EAGROUP9
                MOVEM.L (SP)+,D2
                ;check if A4 is empty
                ;if so, then an invalid mustve occured. thus go directly to NEXTIO
                CMP.B   #$FF,(tempresult)
                BEQ     NEXTIO
                JSR     getSizeFormat1
                ;compare size value here if needed
                MOVE.B  D3,(A4)+
                MOVE.B  #'.',(A4)+
                MOVE.B  #'T',(A4)+
                MOVE.B  #'O',(A4)+
                MOVE.B  #'N',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                JSR     OUTPUTADDRESS
                ;get size
                JSR     EAOUTPUT
                BRA     NEXTIO
                
getSizeFormat1
                CLR.L   D3  
                MOVE.L  D2,D3
                LSR.L   #6,D3
                AND.L   #%0000000011,D3 ;saves last two digits
                CMP.B   #2,D3
                BEQ     PRINTLONGSIZE
                CMP.B   #1,D3
                BEQ     PRINTWORDSIZE
*                LEA     BYTESIZE,A1
*                MOVE.B  #14,D0
*                TRAP    #15
                CLR.L    D3
                MOVE.B   #'B',D3
                ;MOVE.B  #'B',(A4)+
                RTS
                
getSizeFormat2  ;MOVEM
                CLR.L   D3  
                MOVE.L  D2,D3
                LSR.L   #6,D3
                AND.L   #%0000000001,D3 ;saves last two digits
                CMP.B   #0,D3
                BEQ     PRINTWORDSIZE
*                LEA     BYTESIZE,A1
*                MOVE.B  #14,D0
*                TRAP    #15
                CLR.L    D3
                MOVE.B   #'L',D3
                ;MOVE.B  #'W',(A4)+
                RTS   

getSizeFormat3  ;MOVE
                CLR.L   D3  
                MOVE.L  D2,D3
                LSR.L   #8,D3
                LSR.L   #4,D3
                AND.L   #%0011,D3 ;saves last two digits
                CMP.B   #2,D3
                BEQ     PRINTLONGSIZE
                CMP.B   #3,D3
                BEQ     PRINTWORDSIZE
*                LEA     BYTESIZE,A1
*                MOVE.B  #14,D0
*                TRAP    #15
                CLR.L    D3
                MOVE.B   #'B',D3
                ;MOVE.B  #'B',(A4)+
                RTS             
    
PRINTLONGSIZE
*                LEA     WORDSIZE,A1
*                MOVE.B  #14,D0
*                TRAP    #15
                CLR.L    D3
                MOVE.B   #'L',D3
                ;MOVE.B  #'L',(A4)+
                RTS  

PRINTWORDSIZE
*                LEA     LONGSIZE,A1
*                MOVE.B  #14,D0
*                TRAP    #15
                CLR.L    D3
                MOVE.B   #'W',D3
                ;MOVE.B  #'W',(A4)+
                RTS
                
JSRMBRANCH      ;check 7 and 8 and make sure they are  not 11 from 7 and 8
                CLR.L   D3
                MOVE.W  D2,D3
                LSL     #6,D3
                CMPI.W  #%0100111010,D3
                BEQ     INVALIDBRANCH
                MOVE.B  #'R',(A4)+
                MOVE.B  #'S',(A4)+
                MOVE.B  #'J',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                JSR     OUTPUTADDRESS
                JSR     EAOUTPUT 
                BRA     NEXTIO

LEABRANCH      ;check 7 and make sure its set to 1
                BTST.L  #7,D2
                BEQ     INVALIDBRANCH   ;z == 1 if bit is 0
                MOVE.B  #'A',(A4)+
                MOVE.B  #'E',(A4)+
                MOVE.B  #'L',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                JSR     OUTPUTADDRESS
                JSR     EAOUTPUT 
                BRA     NEXTIO
                
OPCODEGROUP2    JSR         NEXTFOURHEX  
                CMPI.W      #%0000,D3
                BEQ         BRABRANCH   
                CMPI.W      #%0111,D3
                BEQ         BEQBRANCH   
                CMPI.W      #%1110,D3
                BEQ         BGTBRANCH
                CMPI.W      #%1111,D3
                BEQ         BLEBRANCH
                BRA         INVALIDBRANCH
                
BRABRANCH      ;check 9 and make sure its set to 0
                BTST.L  #9,D2
                BNE     INVALIDBRANCH   ;z == 0 if bit is 1
*                LEA     BRAMSG,A1
*                MOVE.B  #14,D0
*                TRAP    #15
                JSR     EAGROUP5
                MOVE.B  #'A',(A4)+
                MOVE.B  #'R',(A4)+
                MOVE.B  #'B',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                JSR     OUTPUTADDRESS
                JSR     EAOUTPUT
                BRA     NEXTIO
                
BEQBRANCH
*                LEA     BEQMSG,A1
*                MOVE.B  #14,D0
*                TRAP    #15
                JSR     EAGROUP5
                MOVE.B  #'E',(A4)+
                MOVE.B  #'Q',(A4)+
                MOVE.B  #'B',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                JSR     OUTPUTADDRESS
                JSR     EAOUTPUT
                BRA     NEXTIO
                
BGTBRANCH
*                LEA     BGTMSG,A1
*                MOVE.B  #14,D0
*                TRAP    #15
                JSR     EAGROUP5
                MOVE.B  #'T',(A4)+
                MOVE.B  #'G',(A4)+
                MOVE.B  #'B',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                JSR     OUTPUTADDRESS
                JSR     EAOUTPUT
                BRA     NEXTIO
BLEBRANCH
*                LEA     BLEMSG,A1
*                MOVE.B  #14,D0
*                TRAP    #15
                JSR     EAGROUP5
                MOVE.B  #'E',(A4)+
                MOVE.B  #'L',(A4)+
                MOVE.B  #'B',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                JSR     OUTPUTADDRESS
                JSR     EAOUTPUT
                BRA     NEXTIO
                
OPCODEGROUP3    
                CLR.L   D3
                MOVE.W  D2,D3
                LSR.W   #6,D3
                AND.W   #%0000000111,D3
                CMPI.W  #7,D3
                BEQ     INVALIDBRANCH
                MOVE.B  #'U',(A4)+
                MOVE.B  #'V',(A4)+
                MOVE.B  #'I',(A4)+
                MOVE.B  #'D',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                JSR     OUTPUTADDRESS
                JSR     EAOUTPUT 
                
                BRA     NEXTIO
                
OPCODEGROUP4    ;check 7 to 8 (size) cannot be 11 AND if direction is 1 (8th bit), then 4th and 5th bit cannot be 0
                CLR.L   D3
                BTST    #6,D2 ;if set to 1, not sub
                BNE     TESTSUBBRANCH   ;z == 0 if bit is 1
                BTST    #8,D2
                BNE     TESTSUBBRANCH   
                BRA     TESTSUBBRANCH2  
   
TESTSUBBRANCH
                BTST    #7,D2 ;if set to 1, not sub
                BNE     INVALIDBRANCH   ;z == 0 if bit is 1
                BRA     TESTSUBBRANCH2  

             
TESTSUBBRANCH2  ;check if 5th and 4th bit is equal to zero. if so, it is invalid
                BTST    #5,D2 ;if set to 1, not sub
                BNE     SUBBRANCH3 ;z == 0 if bit is 1
                BRA     SUBBRANCH
                
SUBBRANCH3 
                BTST    #4,D2 ;if set to 1, not sub
                BEQ     INVALIDBRANCH   ;z == 1 if bit is 0 
                BRA     SUBBRANCH

SUBBRANCH       JSR     getSizeFormat1
                MOVE.B  D3,(A4)+
                MOVE.B  #'.',(A4)+
                MOVE.B  #'B',(A4)+
                MOVE.B  #'U',(A4)+
                MOVE.B  #'S',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                JSR     OUTPUTADDRESS
                JSR     EAOUTPUT 
                BRA     NEXTIO

OPCODEGROUP5    JSR     NEXTFOURHEX
                ;JSR     NEXTNEXTFOURHEX 
                
                CLR.L   D3  
                MOVE.W  D2,D3  
                AND.W   #%0000000111111111,D3  
                LSR.W   #6,D3  
                
                CMPI.W  #7,D3          
                BEQ     MULSTEST      ;got to double check for this branch. too much unncertainty. MAKE SURE ITS NOT ABCD AND EXG.6,7,8 must be 111
                BRA     ANDBRANCH       ;MUST CHECK (S cannot be 11) AND IF(D is one, must be Dn. MAKE SURE ITS NOT MULU

MULSTEST      
                CLR.L   D3
                MOVE.W  D2,D3
                LSR.W   #6,D3
MULSLOOP
                CMPI.B  #3,D4
                BEQ     MULSBRANCH
                LSL     #1,D3
                BTST    #0,D3
                BNE     INVALIDBRANCH   ;z == 1 if bit is 0. if bit is 0, then it cnnot be MULS. 
                ADDI    #1,D4
                BRA     MULSLOOP
                
MULSBRANCH      MOVE.B  #'S',(A4)+
                MOVE.B  #'L',(A4)+
                MOVE.B  #'U',(A4)+
                MOVE.B  #'M',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                JSR     OUTPUTADDRESS
                JSR     EAOUTPUT 
                BRA     NEXTIO

ANDBRANCH                 
                ;8,7,6 cannot be 011
                CLR.L   D3
                MOVE.W  D2,D3
                LSR.W   #6,D3
                AND.W   #$0000000111,D3
                CMP.W   #%111,D3
                BEQ     INVALIDBRANCH
                JSR     getSizeFormat1
                MOVE.B  D3,(A4)+
                MOVE.B  #'.',(A4)+
                MOVE.B  #'D',(A4)+
                MOVE.B  #'N',(A4)+
                MOVE.B  #'A',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                JSR     OUTPUTADDRESS
                JSR     EAOUTPUT 
                BRA     NEXTIO 
                

OPCODEGROUP6    ;first check size
                CLR.W   D3
                MOVE.W  D2,D3
                LSR.W   #6,D3
                AND.W   #%0000000011,D3
                CMP.W   #3,D3
                BEQ     INVALIDBRANCH
                CLR.W   D3
                MOVE.W  D2,D3                ;then check direction. if 1, check 4th and 5th bit. if they are both 0, its invalid
                BTST    #8,D3
                
PRINTADD
                BEQ     TESTADD   ;z == 0 if bit is 1. if bit is 1, then may be invalid    
                JSR     getSizeFormat1 
                MOVE.B  D3,(A4)+           
                MOVE.B  #'.',(A4)+
                MOVE.B  #'D',(A4)+
                MOVE.B  #'D',(A4)+
                MOVE.B  #'A',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                JSR     OUTPUTADDRESS
                JSR     EAOUTPUT 
                BRA     NEXTIO
                
TESTADD         LSL.W   #4,D3
                AND.W   #%00000000000110000,D3
                CMP.W   #0,D3
                BEQ     INVALIDBRANCH
                BRA     PRINTADD
                


OPCODEGROUP7    JSR     NEXTFOURHEX
                ;by this point we cleared D3 and have have the next four hex value in D3 
                CMPI.W  #1,D3
                BLE     ASLMEMBRANCH
                CMPI.W  #3,D3
                BLE     LSLMEMBRANCH
                CLR.L   D3
                MOVE.W  D2,D3
                BTST    #3,D3
                BEQ     ASLREGBRANCH            ;z == 1 if bit is 0
                BNE     LSLREGBRANCH            ;z == 0 if bit is 1 
                BRA     INVALIDBRANCH
                
ASLMEMBRANCH
                MOVE.B  #'L',(A4)+
                MOVE.B  #'S',(A4)+
                MOVE.B  #'A',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                JSR     OUTPUTADDRESS
                JSR     EAOUTPUT 
                BRA     NEXTIO                

LSLMEMBRANCH
                MOVE.B  #'L',(A4)+
                MOVE.B  #'S',(A4)+
                MOVE.B  #'L',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                JSR     OUTPUTADDRESS
                JSR     EAOUTPUT 
                BRA     NEXTIO 

ASLREGBRANCH    ;have to check size
                LSL.W   #6,D3
                AND.W   #$0000000011,D3
                CMPI.W  #3,D3
                BEQ     INVALIDBRANCH
                JSR     getSizeFormat1 
                MOVE.B  D3,(A4)+ 
                MOVE.B  #'.',(A4)+
                MOVE.B  #'L',(A4)+
                MOVE.B  #'S',(A4)+
                MOVE.B  #'A',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                JSR     OUTPUTADDRESS
                JSR     EAOUTPUT 
                BRA     NEXTIO 

LSLREGBRANCH    ;have to check size
                LSL.W   #6,D3
                AND.W   #$0000000011,D3
                CMPI.W  #3,D3
                BEQ     INVALIDBRANCH
                JSR     getSizeFormat1 
                MOVE.B  D3,(A4)+ 
                MOVE.B  #'.',(A4)+
                MOVE.B  #'L',(A4)+
                MOVE.B  #'S',(A4)+
                MOVE.B  #'L',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                JSR     OUTPUTADDRESS
                JSR     EAOUTPUT 
                BRA     NEXTIO      

OPCODEGROUP8    ;check dest mode does not equal to 001
                CLR.L   D3
                MOVE.W  D2,D3
                LSR.W   #6,D3
                AND.W   #$00F,D3
                AND.B   #%0111,D3
                CMP.W   #%001,D3
                BEQ     INVALIDBRANCH
                JSR     getSizeFormat3
                MOVE.B  D3,(A4)+
                MOVE.B  #'.',(A4)+
                MOVE.B  #'E',(A4)+
                MOVE.B  #'V',(A4)+
                MOVE.B  #'O',(A4)+
                MOVE.B  #'M',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+                
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+ 
                JSR     OUTPUTADDRESS
                JSR     EAOUTPUT 
                BRA     NEXTIO                

NOOPBRANCH
                MOVE.B  #'P',(A4)+
                MOVE.B  #'O',(A4)+
                MOVE.B  #'N',(A4)+
                MOVE.B  #' ',(A4)+ 
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                JSR     OUTPUTADDRESS
                JSR     EAOUTPUT                
                BRA     NEXTIO

RTSBRANCH
                MOVE.B  #'S',(A4)+
                MOVE.B  #'T',(A4)+
                MOVE.B  #'R',(A4)+
                MOVE.B  #' ',(A4)+ 
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                JSR     OUTPUTADDRESS
                JSR     EAOUTPUT                
                BRA     NEXTIO
                
INVALIDBRANCH   *LEA     INVALIDMSG,A1
*                MOVE.B  #14,D0
*                TRAP    #15
                JSR     EAGROUPINVALID
                MOVE.B  #'A',(A4)+
                MOVE.B  #'T',(A4)+
                MOVE.B  #'A',(A4)+
                MOVE.B  #'D',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                JSR     OUTPUTADDRESS
                JSR     EAOUTPUT
                BRA     NEXTIO
                
NEXTFOURHEX     CLR.L   D3
                MOVE.W  D2,D3
                LSR.W   #8,D3
                AND.W   #%00001111,D3 ;0000 AAAA [XXXX XXXX]
                RTS    

NEXTNEXTFOURHEX CLR.L   D3  
                MOVE.W  D2,D3  
                AND.W   #$00F0,D3  
                LSR.W   #4,D3   ;0000 0000 AAAA [XXXX]
                RTS      

;EA                
******************************************************************************************************************
EAGROUPINVALID
*                MOVE.B      #$23,D1
*                MOVE.L      #6,D0
*                TRAP        #15
*                MOVE.B      #$24,D1
*                MOVE.L      #6,D0
*                TRAP        #15
                MOVE.L      D2,D1
                MOVE.L      #-1,D4
                MOVEM.L     D2-D7/A1-A3/A6,-(sp)   
                MOVE.L      #$4,D4
                JSR         HEXOUTPUT
                MOVEM.L  (sp)+,D2-D7/A1-A3/A6
                MOVE.B      #'$',(A4)+
                MOVE.B      #'#',(A4)+
                MOVE.B      #' ',(A4)+
                MOVE.B      #' ',(A4)+
                MOVE.B      #' ',(A4)+
                MOVE.B      #' ',(A4)+
                RTS
                



EAGROUP5
;d1 stores address and d2 holds displacement value. 
                    
                    CMP.W       #$6000,D2 
                    BEQ         EAGROUP5_SIZEW  
                    
                    ;byte size instruction
                    MOVE.L  A2,D1
*                    SUBI.L  #2,D1
                    AND.W   #$00FF,D2
                    BTST    #$7,D2
                    BEQ     EAGROUP5_ADD      ;z == 0 if bit is 1 AND got to double check for this branch. too much unncertainty   
                    MULS.W  #-1,D2
                    AND.W   #$00FF,D2
                    SUB.W   D2,D1
                    MOVE.L  #8,D4
                    MOVEM.L D2-D7/A1-A3/A6,-(sp)
                    MOVE.L  #8,D4
                    JSR     HEXOUTPUT
                    MOVEM.L  (sp)+,D2-D7/A1-A3/A6
                    MOVE.B      #'$',(A4)+
*                    MOVE.L      #6,D0
*                    TRAP        #15

                
                    MOVE.B      #' ',(A4)+
*                    MOVE.L      #6,D0
*                    TRAP        #15
                    
                    MOVE.B      #' ',(A4)+
*                    MOVE.L      #6,D0
*                    TRAP        #15

                    MOVE.B      #'B',(A4)+
*                    MOVE.L      #6,D0
*                    TRAP        #15
                    
                                                            
                    MOVE.B      #'.',(A4)+
*                    MOVE.L      #6,D0
*                    TRAP        #15
                    
                    RTS
EAGROUP5_ADD
                    ADD.W   D2,D1
                    MOVEM.L D2-D7/A1-A3/A6,-(sp)
                    MOVE.L  #8,D4
                    JSR     HEXOUTPUT
                    MOVEM.L  (sp)+,D2-D7/A1-A3/A6
                    MOVE.B      #'$',(A4)+
*                    MOVE.L      #6,D0
*                    TRAP        #15

                
                    MOVE.B      #' ',(A4)+
*                    MOVE.L      #6,D0
*                    TRAP        #15
                    
                    MOVE.B      #' ',(A4)+
*                    MOVE.L      #6,D0
*                    TRAP        #15

                    MOVE.B      #'B',(A4)+
*                    MOVE.L      #6,D0
*                    TRAP        #15
                    
                                                            
                    MOVE.B      #'.',(A4)+
*                    MOVE.L      #6,D0
*                    TRAP        #15
                    
                    RTS

EAGROUP5_ADDWORD
                    ADD.W   D2,D1
                    MOVEM.L D2-D7/A1-A3/A6,-(sp)
                    MOVE.L  #8,D4
                    JSR     HEXOUTPUT
                    MOVEM.L  (sp)+,D2-D7/A1-A3/A6
                    MOVE.B      #'$',(A4)+
*                    MOVE.L      #6,D0
*                    TRAP        #15

                
                    MOVE.B      #' ',(A4)+
*                    MOVE.L      #6,D0
*                    TRAP        #15
                    
                    MOVE.B      #' ',(A4)+
*                    MOVE.L      #6,D0
*                    TRAP        #15

                    MOVE.B      #'W',(A4)+
*                    MOVE.L      #6,D0
*                    TRAP        #15
                    
                                                            
                    MOVE.B      #'.',(A4)+
*                    MOVE.L      #6,D0
*                    TRAP        #15
                    
                    RTS
      
EAGROUP5_SIZEW
                    
                    CLR.W    D2
                    MOVE.L   A2,D1
*                   SUBI.L  #2,D1
                    MOVE.W  (A2)+,D2
                    BTST    #$15,D2
                    BTST.L  #0,D3          ;z == 0 if bit is 1 AND got to double check for this branch. too much unncertainty  
                    BEQ     EAGROUP5_ADDWORD
                    MULS.W  #-1,D2
                    SUB.W   D2,D1
                    MOVEM.L D2-D7/A1-A3/A6,-(sp)
                    MOVE.L  #8,D4
                    JSR     HEXOUTPUT
                    MOVEM.L  (sp)+,D2-D7/A1-A3/A6
                    MOVE.B      #'$',(A4)+
*                    MOVE.L      #6,D0
*                    TRAP        #15

                
                    MOVE.B      #' ',(A4)+
*                    MOVE.L      #6,D0
*                    TRAP        #15
                    
                    MOVE.B      #' ',(A4)+
*                    MOVE.L      #6,D0
*                    TRAP        #15

                    MOVE.B      #'W',(A4)+
*                    MOVE.L      #6,D0
*                    TRAP        #15
                    
                                                            
                    MOVE.B      #'.',(A4)+
*                    MOVE.L      #6,D0
*                    TRAP        #15
                    
                    RTS
                    
EAGROUP9
                    CLR.L   D1
                    JSR     EALASTVALUE
                    RTS
                    
EALASTVALUE
                    *check if mode respects register value
                    *if not branch out to immediate data
                    MOVE.L  D2,D1
                    LSR.L   #3,D1
                    AND.L   #%0000000000111,D1
                    CMP.L   #7,D1
                    BEQ     IMMEDIATEDATA
                    CMP.L   #4,D1
                    BEQ     ADDRESSDECREMENT
                    BGT     INVALIDEAMODE
                    CMP.L   #3,D1
                    BEQ     ADDRESSINCREMENT
                    CMP.L   #2,D1
                    BEQ     INDIRECTADDRESS
                    CMP.L   #1,D1
                    BEQ     DIRECTADDRESS
                    ;data reg

                    
                    CLR.L   D1
                    MOVE.L  D2,D1
                    AND.L   #%0000000000000111,D1
                    
                    ADDI.B  #$30,D1
                    
                    MOVE.B  D1,(A4)+
*                    MOVE.L  #6,D0
*                    TRAP    #15

                    MOVE.B  #'D',(A4)+
*                    MOVE.L  #6,D0
*                    TRAP    #15
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                    RTS
                    
INDIRECTADDRESS  

*                    MOVE.L  #6,D0
*                    TRAP    #15
                    
                    MOVE.B  #')',(A4)+
*                    MOVE.L  #6,D0
*                    TRAP    #15

                    MOVE.L  D2,D1
                    AND.L   #%0000000000000111,D1
                    ADDI.B  #$30,D1
                    MOVE.B  D1,(A4)+

                    MOVE.B  #'(',(A4)+
*                    MOVE.L  #6,D0
*                    TRAP    #15
                    
                    MOVE.B  #' ',(A4)+
                    MOVE.B  #' ',(A4)+
                    MOVE.B  #' ',(A4)+                    
                    RTS                  
      
DIRECTADDRESS
                    CLR.L   D1
                    MOVE.L  D2,D1
                    
                    AND.L   #%0000000000000111,D1
                    
                    ADDI.B  #$30,D1
                    MOVE.B  D1,(A4)+
*                    MOVE.L  #6,D0
*                    TRAP    #15
                    
                    MOVE.B  #'A',(A4)+
*                    MOVE.L  #6,D0
*                    TRAP    #15

                    MOVE.B  #' ',(A4)+
                    MOVE.B  #' ',(A4)+
                    MOVE.B  #' ',(A4)+  
                    RTS

              
IMMEDIATEDATA
                    ;need to decide whether print long, word, or byte sized. 
                    ;decide size of output, 0(word), 1(long), 4(immediate)
*                    MOVE.L      #$23,D1
*                    MOVE.L      #6,D0
*                    TRAP        #15
                    
                    CLR.L   D1
                    MOVE.L  D2,D1
                    AND.L   #%0000000000000111,D2
                    ;let d1 have the next value
                    CLR.L   D1
                    CMPI.L  #0,D2
                    BEQ     PRINTWORDDATA
                    CMPI.L  #1,D2
                    BEQ     PRINTLONGDATA
                    CMPI.L  #4,D2
                    BEQ     PRINTIMMEDIATEDATA
                    BRA     INVALIDEAMODE
                    ;RTS         ;it should never reach here
                    
INVALIDMODE
                    
                        
PRINTWORDDATA
                    MOVE.W  (A2)+,D1
                    MOVEM.L D2-D7/A1-A3/A6,-(sp)
                    MOVE.L  #$4,D4
                    JSR     HEXOUTPUT
                    MOVEM.L  (sp)+,D2-D7/A1-A3/A6
                    MOVE.B  #'$',(A4)+
                    MOVE.B  #'#',(A4)+
                    MOVE.B  #' ',(A4)+
                    MOVE.B  #' ',(A4)+  
                    MOVE.B  #' ',(A4)+
                    MOVE.B  #' ',(A4)+
                    MOVE.B  #' ',(A4)+  
                    RTS

PRINTLONGDATA
                    MOVE.W  (A2)+,D1     
                    CLR.L   D6
                    MOVE.W  D1,D6
                    MOVE.W  (A2)+,D1     
               
                    MOVEM.L D2-D7/A1-A3/A6,-(sp)
                    MOVE.L   #$4,D4
                    JSR      HEXOUTPUT
                    MOVEM.L  (sp)+,D2-D7/A1-A3/A6
                    
                    
                    MOVE.W  D6,D1
                    CLR.L   D6
                    
                    MOVEM.L D2-D7/A1-A3/A6,-(sp)
                    MOVE.L   #$4,D4
                    JSR      HEXOUTPUT
                    MOVEM.L  (sp)+,D2-D7/A1-A3/A6
                    
                    MOVE.B  #'$',(A4)+
                    MOVE.B  #'#',(A4)+
                    MOVE.B  #' ',(A4)+
                    MOVE.B  #' ',(A4)+  
                    MOVE.B  #' ',(A4)+
                    MOVE.B  #' ',(A4)+
                    MOVE.B  #' ',(A4)+  
                    RTS
  
PRINTIMMEDIATEDATA
                    MOVE.L  (A2)+,D1
                    MOVEM.L D2-D7/A1-A3/A6,-(sp)
                    MOVE.L  #-1,D4
                    JSR     HEXOUTPUT
                    MOVEM.L  (sp)+,D2-D7/A1-A3/A6
                    MOVE.B  #'#',(A4)+
                    MOVE.B  #' ',(A4)+
                    MOVE.B  #' ',(A4)+  
                    MOVE.B  #' ',(A4)+
                    MOVE.B  #' ',(A4)+
                    MOVE.B  #' ',(A4)+  
                    RTS                  
                        
ADDRESSINCREMENT    
                    MOVE.B  #'+',(A4)+
*                    MOVE.L  #6,D0
*                    TRAP    #15

                    MOVE.B  #')',(A4)+
*                    MOVE.L  #6,D0
*                    TRAP    #15
                    

   
                    MOVE.L  D2,D1
                    AND.L   #%0000000000000111,D1
                    ADDI.B  #$30,D1
                    MOVE.B  D1,(A4)+
*                    MOVE.L  #6,D0
*                    TRAP    #15

                    MOVE.B  #'A',(A4)+             
*                    MOVE.L  #6,D0
*                    TRAP    #15

                    MOVE.B  #'(',(A4)+
*                    MOVE.L  #6,D0
*                    TRAP    #15


                    MOVE.B  #' ',(A4)+
                    MOVE.B  #' ',(A4)+  
                    MOVE.B  #' ',(A4)+
                    MOVE.B  #' ',(A4)+
                    MOVE.B  #' ',(A4)+                      
                    RTS
                    

ADDRESSDECREMENT 
                    MOVE.B  #')',(A4)+
*                    MOVE.L  #6,D0
*                    TRAP    #15
                    
                    MOVE.L  D2,D1
                    AND.L   #%0000000000000111,D1
                    ADDI.B  #$30,D1
                    MOVE.B  D1,(A4)+
*                    MOVE.L  #6,D0
*                    TRAP    #15
                    
                    MOVE.B  #'A',(A4)+
*                    MOVE.L  #6,D0
*                    TRAP    #15
                    
                    MOVE.B  #'(',(A4)+
*                    MOVE.L  #6,D0
*                    TRAP    #15
                    
                    MOVE.B  #'-',(A4)+
*                    MOVE.L  #6,D0
*                    TRAP    #15

                    MOVE.B  #' ',(A4)+
                    MOVE.B  #' ',(A4)+  
                    MOVE.B  #' ',(A4)+
                    MOVE.B  #' ',(A4)+
                    MOVE.B  #' ',(A4)+                      
                    RTS


INVALIDEAMODE
                JSR     EAGROUPINVALID
                MOVE.B  #'A',(A4)+
                MOVE.B  #'T',(A4)+
                MOVE.B  #'A',(A4)+
                MOVE.B  #'D',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                JSR     OUTPUTADDRESS
                JSR     EAOUTPUT
                RTS
                ;we need       one rts. this rts will return to its original branch
                ;so if we go to this branch and print data and hten rts, it will print that opcode as well
                ; need a mechanism which willl till original branch that an invalid has occured
                ; maybe use D4?     we can do this by checking if A4 is empty. in good case, A4 will be filled.
                ; in bad case it will be cleared. this works well since EA is being put into string stack initially.
                ; thus for every branch, we need to check if A4 is empty AFRTER being called 
*FORMAT1         
*FORMAT2
*FORMAT3
*FORMAT4
*FORMAT5
*FORMAT6
*FORMAT7
*FORMAT8
*FORMAT9
*FORMAT10
*FORMAT11
*FORMAT12
*FORMAT13
*FORMAT14
*FORMAT15
*EAGRP1
*EAGRP2
*EAGRP3
*EAGRP4
*EAGRP5
*EAGRP6
*EAGRP7
*EAGRP8
*EAGRP9
*EAGRP10
;I/O         
******************************************************************************************************************
EAOUTPUT
                ;LEA        $900,A5
                LEA        base16value,A5
                CLR.L      D1
                BRA        REVERSEIT


                
REVERSEIT
                MOVE.B     -(A4),D1        ;code to reverse string
                CMP        #$A,D1        
                BEQ        FINAL
                MOVE.B     D1,(A5)+
                ADD.B      #1,D4
                BRA        REVERSEIT   
                
                
FINAL           

                MOVE.B      #0,(A5)+        ;add NULL ASCII CHAR

*                LEA $900, A1 ; display the string stored at "base16value"
                LEA  base16value,A1
                MOVE.L #14,D0       ; task number #13
                TRAP #15            ; call TRAP #15 function        
                
                ;CLEARBUFFER
CLEANIT
                MOVE.B     #$FF,-(A5)
                MOVE.B     #$FF,(A4)+
                CMP        #$0,D4        
                BEQ        FINALRTS               
                ADD.B      #-1,D4
                BRA        CLEANIT
                
FINALRTS               
                RTS
            
NEXTIO          CLR.L     D3
                CLR.L     D4 
                
                LEA     CLR,A1   ;Display intro message
                MOVE.B  #14,D0 
                TRAP    #15
                              
                MOVEM.L  (sp)+,D1/D3-D7/A1-A6 ;I/O gets his stuff back
                CMP.L    A3,A2  ;we dont need more machine language once we have reached the the destination
                BGT      END ;so when equal, we are done
                CMPI.B   #1,D5 ;hard cded page limit for first page
                BEQ      SECONDPAGE
                CMP.L    #1,D1
                BEQ      NEWPAGELOOP
                BNE      FEEDOPCODE

                
SECONDPAGE
                CMP.L    #1,D1       ;hardcoded limit for other pages page. can be and expected to change
                BNE      FEEDOPCODE
                ;check if user wants new page. if no exit. if yes continue to feedopcode.
NEWPAGELOOP
                MOVE.B   #1,D5
                LEA     $9000,A1          ;had to specify or it wont work properly                 
                LEA     NEWPAGEMSG,A1     
                MOVE.W  #14,D0          
                TRAP    #15 
                
                LEA     $9000,A1          ;had to specify or it wont work properly                 
                MOVE.W  #2,D0           ;had to specify or it wont work properly
                TRAP    #15  
                
                MOVE.B  (A1),D3
                
                LEA     $9000,A1          ;had to specify or it wont work properly
                CMP.B   #$59,D3
                BEQ     FEEDOPCODE
                CMP.B   #$79,D3
                BEQ     FEEDOPCODE
                CMP.B   #$0,D3
                BEQ     FEEDOPCODE
                CMP.B   #$4E,D3
                BEQ     END
                CMP.B   #$6E,D3
                BEQ     END
                
                LEA     $9000,A1          ;had to specify or it wont work properly
                LEA     BADCHARACTER,A1     
                MOVE.W  #13,D0          
                TRAP    #15
                
                BRA     NEWPAGELOOP  
                ******************************************************************************************************************
END 
                LEA     CLR,A1     ;Ask for first input
                MOVE.B  #14,D0          
                TRAP    #15 
                LEA     ENDMSG,A1     
                MOVE.W  #13,D0          
                TRAP    #15  
 
                MOVE.W  #9,D0          
                TRAP    #15                             
                SIMHALT             ; halt simulator
    
CR                  EQU     $0A
LF                  EQU     $0D

WELMSG              DC.B    'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',CR,LF
                    DC.B    'X                                                 X',CR,LF
                    DC.B    'X   Welcome to the Disassembler of Motorola 68k   X',CR,LF
                    DC.B    'X                                                 X',CR,LF
                    DC.B    'X           By:    Sesario Imanputra              X',CR,LF
                    DC.B    'X                  Zachary Liong                  X',CR,LF
                    DC.B    'X                  Micah Rice                     X',CR,LF
                    DC.B    'X                                                 X',CR,LF
                    DC.B    'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',CR,LF,CR,LF, 0
LINE_COUNT          DS.B    1

MSGINPUT            DC.B    'Please enter first memory address: $',0
MSGINPUT2           DC.B    'Please enter second memory address: $',0
BADVALUE            DC.L    'INPUT VALUE EXCEEDS 32 BIT RANGE!',CR,LF,0
BADCHARACTER        DC.L    'INPUT HAS ILLEGAL CHARACTER!',CR,LF,0
BADADDRESS          DC.L    'SOURCE ADDRESS CANNOT BE BIGGER THEN DESTINATION ADDRESS!',CR,LF,0
VALUETOOLOW         DC.L    'VALUE TOO LOW!',CR,LF,0
NEWPAGEMSG          DC.L    'ENTER TO CONTINUE... ',CR,LF,0
ENDMSG              DC.B    'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX    END    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',0
PLUSMSG             DC.B    '+',0
NEGMSG              DC.B    '-',0
CLR                 DC.B    CR,LF,0
NOOPMSG             DC.B    ' NOP',0
RTSMSG              DC.B    ' RTS',0

MOVEMMSG            DC.B    ' MOVEM.',0
MOVEMSG             DC.B    ' MOVE.',0
LEAMSG              DC.B    ' LEA.',0
NOTMSG              DC.B    ' NOT.',0
JSRMSG              DC.B    ' JSR.',0
BGTMSG              DC.B    ' BGT.',0
BLEMSG              DC.B    ' BLE.',0
BEQMSG              DC.B    ' BEQ.',0
BRAMSG              DC.B    ' BRA.',0
DIVUMSG             DC.B    ' DIVU.',0
SUBMSG              DC.B    ' SUB.',0
MULSMSG             DC.B    ' MULS.',0
ANDMSG              DC.B    ' AND.',0
ADDMSG              DC.B    ' ADD.',0
LSLMSG              DC.B    ' LSL.',0
ASLMSG              DC.B    ' ASL.',0
INVALIDMSG          DC.B    ' DATA  ',0
EVENINPUTMSG        DC.B    ' INPUT VALUE IS EVEN!',0
SPACEMSG            DC.B    '   ',0
WORDSIZE            DC.B    'W  ',0
BYTESIZE            DC.B    'B  ',0
LONGSIZE            DC.B    'L  ',0
tempresult          DS.L    10      ; variable to save temporary result
base16value         DS.L    10     ; variable to save the final result


* Put variables and constants here

    END    START        ; last line of source








*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
