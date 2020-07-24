*-----------------------------------------------------------
* Title      :  I/O
* Written by :  Sesario Imanputra, Zachary Liong, Micha Rice
* Date       :  
* Description: Starts at 4000. For testing purposes, theres a bunch of ML codes to disassemble at 4000. Currently, the first ML code at 4000 is NOP.
* afterwards, it will include ML of whatever we wrote after NOP.
* current I/O should be able to detext values exceeding the 32 bit unsigned range (FFFFFFFF) and recognize invalid input.
* if you input a lower case letter, it will automatically convert into uppercase. 
*-----------------------------------------------------------     
        ORG    $4000   
START:                  ; first instruction of program   

;inputs for testing are  here:

****************************************************
                NOP
****************************************************
      
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
                CMP.L   #$0,A2
                BNE     FINISHSAVING
                MOVE.L  D2,A2
                BRA     INPUT2 
                
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
;are not clear: A1, A2 (src), A3 (dest), A7 (stack pointer)

;send assembly language to D2
FEEDOPCODE
                MOVE.W      (A2)+,D2
                ;movem everything except D2, bcs u need it. 
                ADDI.W      #1,D1
                MOVEM.L     D1/D3-D7/A1-A6,-(sp) 
                BRA      OPCODETIME

OPCODETIME

                ;Do opcode and other things related stuff outside the NEXTIO branch. when you want the next machine language, enter the NEXTIO branch
                
                
                ******************************************************************************************************************
NEXTIO                
                MOVEM.L  (sp)+,D1/D3-D7/A1-A6 ;I/O gets his stuff back
                CMP.L    A3,A2  ;we dont need more machine language once we have reached the the destination
                BGT      END ;so when equal, we are done
                CMP.L    #1000,D1       ;hardcoded limit for a page. can be and expected to change
                BNE      FEEDOPCODE
                ;check if user wants new page. if no exit. if yes continue to feedopcode.
NEWPAGELOOP
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
BADVALUE            DC.L    'INPUT VALUE EXCEEDS 32 BIT RANGE',CR,LF,0
BADCHARACTER        DC.L    'INPUT HAS ILLEGAL CHARACTER',CR,LF,0
BADADDRESS          DC.L    'SOURCE ADDRESS CANNOT BE BIGGER THEN DESTINATION ADDRESS',CR,LF,0
VALUETOOLOW         DC.L    'VALUE TOO LOW',CR,LF,0
NEWPAGEMSG          DC.L    'Continue? (Y | N): ',CR,LF,0
ENDMSG              DC.B    'END',0
PLUSMSG             DC.B    '+',0
NEGMSG              DC.B    '-',0
CLR                 DC.B    CR,LF,0  
* Put variables and constants here

    END    START        ; last line of source
