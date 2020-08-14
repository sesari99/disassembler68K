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
NOP
                 ;OPCODEGROUP7.1.1 TEST  REG SHIFT
                 ;LSL.B   #2,D3 
                 LSL.L   D0,D5 
                 
                 ;OPCODEGROUP7.1.2 TEST   REG SHIFT
                 ASL.B   #2,D3 
                 
                 ;OPCODEGROUP7.3.2 TEST     MEM SHIFT
                 LSL   (A0)+ 
                
                 ;OPCODEGROUP7.3.1 TEST       MEM SHIFT           
                 ASL   (A0)+     RTS
                 
    NOP
    RTS
    LEA     (A0),A0
    LEA     (A5),A0
    LEA     (A7),A0
    LEA     (A0),A7
    LEA     (A5),A7
    LEA     (A7),A7
    MOVE.B    D0,D1
    MOVE.B    D0,(A0)
    MOVE.B    D0,(A0)+
    MOVE.B    D0,-(A0)
    MOVE.B    (A0),D0
    MOVE.B    (A0),(A1)
    MOVE.B    (A0),(A1)+
    MOVE.B    (A0),-(A1)
    MOVE.B    (A0)+,D0
    MOVE.B    (A0)+,(A1)
    MOVE.B    (A0)+,(A1)+
    MOVE.B    (A0)+,-(A1)
    MOVE.B    -(A0),D0
    MOVE.B    -(A0),(A1)
    MOVE.B    -(A0),(A1)+
    MOVE.B    -(A0),-(A1)
    MOVE.W    D0,D1
    MOVE.W    D0,(A0)
    MOVE.W    D0,(A0)+
    MOVE.W    D0,-(A0)
    MOVE.W    A0,D0
    MOVE.W    A0,(A1)
    MOVE.W    A0,(A1)+
    MOVE.W    A0,-(A1)
    MOVE.W    (A0),D0
    MOVE.W    (A0),(A1)
    MOVE.W    (A0),(A1)+
    MOVE.W    (A0),-(A1)
    MOVE.W    (A0)+,D0
    MOVE.W    (A0)+,(A1)
    MOVE.W    (A0)+,(A1)+
    MOVE.W    (A0)+,-(A1)
    MOVE.W    -(A0),D0
    MOVE.W    -(A0),(A1)
    MOVE.W    -(A0),(A1)+
    MOVE.W    -(A0),-(A1)
    MOVE.L    D0,D1
    MOVE.L    D0,(A0)
    MOVE.L    D0,(A0)+
    MOVE.L    D0,-(A0)
    MOVE.L    A0,D0
    MOVE.L    A0,(A1)
    MOVE.L    A0,(A1)+
    MOVE.L    A0,-(A1)
    MOVE.L    (A0),D0
    MOVE.L    (A0),(A1)
    MOVE.L    (A0),(A1)+
    MOVE.L    (A0),-(A1)
    MOVE.L    (A0)+,D0
    MOVE.L    (A0)+,(A1)
    MOVE.L    (A0)+,(A1)+
    MOVE.L    (A0)+,-(A1)
    MOVE.L    -(A0),D0
    MOVE.L    -(A0),(A1)
    MOVE.L    -(A0),(A1)+
    MOVE.L    -(A0),-(A1)
    MOVEM.W   A1-A7,-(A1)
    MOVEM.L   D1-D7,-(A1)
    MOVEM.W   A1/D7,-(A1)
    MOVEM.L   A1/D7,-(A1)
    MOVEM.W   A1-A7,(A1)
    MOVEM.L   D1-D7,(A1)
    MOVEM.W   A1/D7,(A1)
    MOVEM.L   A1/D7,(A1)
    MOVEM.W   (A1)+,A1-A7
    MOVEM.L   (A1)+,D1-D7
    MOVEM.W   (A1)+,A1/D7
    MOVEM.L   (A1)+,A1/D7
    MOVEM.W   (A1),A1-A7
    MOVEM.L   (A1),D1-D7
    MOVEM.W   (A1),A1/D7
    MOVEM.L   (A1),A1/D7
    MOVEA.L    D0,A0
    MOVEA.L    A0,A0
    MOVEA.L    (A0),A0
    MOVEA.L    (A0)+,A0
    MOVEA.L    -(A0),A0  
    ADD.B     D1,D2
    ADD.B     D1,(A1)
    ADD.B     D1,(A1)+
    ADD.B     D1,-(A1)
    ADD.B     (A1),D1
    ADD.B     (A1)+,D1
    ADD.B     -(A1),D1
    ADD.W     D1,D2
    ADD.W     D1,(A1)
    ADD.W     D1,(A1)+
    ADD.W     D1,-(A1)
    ADD.W     (A1),D1
    ADD.W     (A1)+,D1
    ADD.W     -(A1),D1
    ADD.L     D1,D2
    ADD.L     D1,(A1)
    ADD.L     D1,(A1)+
    ADD.L     D1,-(A1)
    ADD.L     (A1),D1
    ADD.L     (A1)+,D1
    ADD.L     -(A1),D1
    ADDA.L        (A1)+,A2
    ADDA.L        -(A1),A2
    SUB.B     D1,D2
    SUB.B     D1,(A1)
    SUB.B     D1,(A1)+
    SUB.B     D1,-(A1)
    SUB.B     (A1),D1
    SUB.B     (A1)+,D1
    SUB.B     -(A1),D1
    SUB.W     D1,D2
    SUB.W     D1,A1
    SUB.W     D1,(A1)
    SUB.W     D1,(A1)+
    SUB.W     D1,-(A1)
    SUB.W     A1,D1
    SUB.W     (A1),D1
    SUB.W     (A1)+,D1
    SUB.W     -(A1),D1
    SUB.L     D1,D2
    SUB.L     D1,A1
    SUB.L     D1,(A1)
    SUB.L     D1,(A1)+
    SUB.L     D1,-(A1)
    SUB.L     A1,D1
    SUB.L     (A1),D1
    SUB.L     (A1)+,D1
    SUB.L     -(A1),D1    
    MULS.W    D0,D1
    MULS.W    (A0),D1
    MULS.W    -(A0),D1
    MULS.W    (A0)+,D1
    DIVU.W    D0,D1
    DIVU.W    (A0),D1
    DIVU.W    -(A0),D1
    DIVU.W    (A0)+,D1
    AND.B     D1,D2
    AND.B     D1,(A1)
    AND.B     D1,(A1)+
    AND.B     D1,-(A1)
    AND.B     (A1),D1
    AND.B     (A1)+,D1
    AND.B     -(A1),D1
    AND.W     D1,D2
    AND.W     D1,(A1)
    AND.W     D1,(A1)+
    AND.W     D1,-(A1)
    AND.W     (A1),D1
    AND.W     (A1)+,D1
    AND.W     -(A1),D1
    AND.L     D1,D2
    AND.L     D1,(A1)
    AND.L     D1,(A1)+
    AND.L     D1,-(A1)
    AND.L     (A1),D1
    AND.L     (A1)+,D1
    AND.L     -(A1),D1  
    BGT.B     label1
    BGT.B     label2
    BLE.B     label1
    BLE.B     label2
    BGE.B     label1
    BEQ.B     label2
    BEQ.W     label1
    JSR       (A0)
    JSR       $1234
    JSR       $12345678
    JSR       label1
    JSR       label2
    JSR       label3
    NOP
    RTS
label1
    NOP
    RTS
    LEA       $12,A0
    LEA       $1234,A0
    LEA       $12345678,A0
label2
    LSL.B     D1,D2
    LSL.W     D1,D2
    LSL.W     (A1)
    LSL.W     (A1)+
    LSL.W     -(A1)
    LSL.L     D1,D2
    ASL.B     D1,D2
    ASL.W     D1,D2
    ASL.W     (A1)
    ASL.W     (A1)+
    ASL.W     -(A1)
    ASL.L     D1,D2
label3
    MOVEM.W   A1-A7,$12
    MOVEM.L   D1-D7,$12
    MOVEM.W   A1/D7,$12
    MOVEM.L   A1/D7,$12
    MOVEM.W   A1-A7,$1234
    MOVEM.L   D1-D7,$1234
    MOVEM.W   A1/D7,$1234
    MOVEM.L   A1/D7,$1234
    MOVEM.W   A1-A7,$12345678
    MOVEM.L   D1-D7,$12345678
    MOVEM.W   A1/D7,$12345678
    MOVEM.L   A1/D7,$12345678
    MOVEM.W   $12,A1-A7
    MOVEM.L   $12,D1-D7
    MOVEM.W   $12,A1/D7
    MOVEM.L   $12,A1/D7
    MOVEM.W   $1234,A1-A7
    MOVEM.L   $1234,D1-D7
    MOVEM.W   $1234,A1/D7
    MOVEM.L   $1234,A1/D7
    MOVEM.W   $12345678,A1-A7
    MOVEM.L   $12345678,D1-D7
    MOVEM.W   $12345678,A1/D7
    MOVEM.L   $12345678,A1/D7
    MULS.W    $12,D1
    MULS.W    $1234,D1
    MULS.W    $12345678,D1
    MULS.W    #$1234,D1
    DIVU.W    $12,D1
    DIVU.W    $1234,D1
    DIVU.W    $12345678,D1
    DIVU.W    #$1234,D1
label4
    BGT.B     label4
    BGT.B     label4
    BGT.B     label4
    BLE.W     label1
    BLE.W     label2
    BLE.W     label3
    BEQ.W     label1
    BEQ.W     label2
    BEQ.W     label3
    BRA       label2
    BRA       label3
    JSR       label1
    JSR       label2
    JSR       label3                 


pro              
                NOP
                
                 ;OPCODEGROUP8 TEST
                 MOVE.B  D2,D3      
                 ;MOVEA #$00000047,A0 ;should be data
                 
                 ;OPCODEGROUP1.1 TEST 
                 MOVEM.W D0,-(A5)
                 MOVEM.W D1,-(A5)
                 MOVEM.W D2,-(A5) 
                 MOVEM.W D7,-(A5)
                 
                 MOVEM.W A0,-(A5) 
                 MOVEM.W A1,-(A5) 
                 MOVEM.W A2,-(A5) 
                 MOVEM.W A7,-(A5)
                 MOVEM.W D0-D7/A0-A7,-(A5)    
                 MOVEM.W D1-D4/A2-A5,-(A5) 

                 MOVEM.W (A5)+,D0
                 MOVEM.W (A5)+,D1
                 MOVEM.W (A5)+,D2
                 MOVEM.W (A5)+,D7
                 MOVEM.W (A5)+,A0
                 MOVEM.W (A5)+,A1 
                 MOVEM.W (A5)+,A2
                 MOVEM.W (A5)+,A7  
                 MOVEM.W (A5)+,D0-D7/A0-A7 ;D7 not printing
                 MOVEM.W (A5)+,D1-D4/A2-A5

                 
                 ;JMP    pa      ;should be data (not wokring)
                 
                 ;OPCODEGROUP6 TEST
                 ADD.B   D2,D3 
                 ADD.B   D0,$00001012
                 ;ADDX   -(A2),-(A3)    ;should be data (not working)
                 ;ADDA   D3,A3          ;should be data
                 
                 ;OPCODEGROUP4 TEST
                 SUB.B    D2,D3 
                 SUB.B   D0,$00001012
                 ;SUBX   -(A2),-(A3)    ;should be data (not working)
                 ;SUBA   D3,A3          ;should be data
                 
                 ;OPCODEGROUP5 TEST
                 MULS  D2,D3 
                 ;MULU  D2,D3           ;should be data (not working)
                 
                 ;OPCODEGROUP3 TEST
                 DIVU  D2,D3 
                 ;DIVS  D2,D3           ;should be data
                 
                 ;OPCODEGROUP1.5 TEST
                 LEA   $2000,A2  
                 
                 ;OPCODEGROUP5 TEST
                 AND.B   #3,D3 
                 AND.B   D0,$00001012           
                 ;EXG   D2,D3           ;should be data (not working)
                 
                 ;OPCODEGROUP1.3 TEST
                 NOT.B   D3
                 NOT.W   (A3)+
                 NOT.L   -(A3)
                 NOT.W   $1234
                 NOT.L   $12345678
                 ;MOVE  D3,SR           ;should be data (not working)

                 
                 ;OPCODEGROUP7.1.1 TEST  REG SHIFT
                 ;LSL.B   #2,D3 
                 LSL.L   D0,D5 
                 
                 ;OPCODEGROUP7.1.2 TEST   REG SHIFT
                 ASL.B   #2,D3 
                 
                 ;OPCODEGROUP7.3.2 TEST     MEM SHIFT
                 LSL   (A0)+ 
                
                 ;OPCODEGROUP7.3.1 TEST       MEM SHIFT           
                 ASL   (A0)+ 
                 
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
                JSR   (A1)

                
                
****************************************************   
        ORG    $1000   
START:                  ; first instruction of program   

;inputs for testing are  here:    

                LEA     WELMSG,A1   ;Display intro message
                MOVE.B  #14,D0 
                TRAP    #15
                
STARTMENU
                MOVEM.L     D0-D7/A1-A6,-(sp)   

INPUT1                                   
                LEA     MSGINPUT ,A1     ;Ask for first input
                MOVE.B  #14,D0          
                TRAP    #15       
                
                LEA     IOVariable,A1
                
                MOVE.W  #2,D0           ;had to specify or it wont work properly
                TRAP    #15
                BRA     FOR_LOOP 
                
INPUT2          LEA     MSGINPUT2,A1    ;Ask for second input
                MOVE.B  #14,D0
                TRAP    #15
                LEA     IOVariable,A1
                
                MOVE.W  #2,D0
                TRAP    #15
                BRA     FOR_LOOP
                
                              
FOR_LOOP        CMP.B   D1,D3
                BEQ     CHECKNEG
                CLR.W   D6               
                ADD.B  (A1)+,D6
                CMP.B   #$51,D6
                BEQ     ENDPROGRAM
                CMP.B   #$71,D6
                BEQ     ENDPROGRAM
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
                ;now do the first half
                MOVE.L      D1,D4
                MOVE.L      A2,D1
                SUB.L       #$2,D1
                AND.L       #$0000FFFF,D1
                MOVEM.L     D2-D7/A1-A3/A6,-(sp)   
                MOVE.L      #$4,D4 ;10
                JSR         HEXOUTPUT
                MOVEM.L    (sp)+,D2-D7/A1-A3/A6 ;I/O gets his stuff back
                
                CLR.L       D1
                MOVE.L      A2,D1
                SUB.L       #$2,D1
                CLR.W       D1
                SWAP        D1
                MOVEM.L     D2-D7/A1-A3/A6,-(sp)   
                MOVE.L      #$4,D4 ;10
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
                MOVEM.L D0-D7/A0-A3,-(SP)
                JSR     EAGROUP7
                MOVEM.L (SP)+, D0-D7/A0-A3
                MOVE.B  #' ',(A4)+
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
                JSR     EAGROUP9
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
                JSR     EAGROUP4LEA
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
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
                MOVE.B  #'Q',(A4)+
                MOVE.B  #'E',(A4)+
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
                JSR     EAGROUP4ALL
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
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
                BRA     SUBBRANCH 
   
TESTSUBBRANCH
                BTST    #7,D2 ;if set to 1, not sub
                BNE     INVALIDBRANCH   ;z == 0 if bit is 1
                BRA     SUBBRANCH 

             
*TESTSUBBRANCH2  ;check if 5th and 4th bit is equal to zero. if so, it is invalid
*                BTST    #5,D2 ;if set to 1, not sub
*                BNE     SUBBRANCH3 ;z == 0 if bit is 1
*                BRA     SUBBRANCH
*                
*SUBBRANCH3 
*                BTST    #4,D2 ;if set to 1, not sub
*                BEQ     INVALIDBRANCH   ;z == 1 if bit is 0 
*                BRA     SUBBRANCH

GROUP1_1
                MOVEM.L D2,-(SP)
                JSR     EAGROUP1_1
                MOVEM.L (SP)+,D2
                BRA     CONTSUBBRANCH
                
GROUP1_2
                MOVEM.L D2,-(SP)
                JSR     EAGROUP1_2
                MOVEM.L (SP)+,D2
                BRA     CONTSUBBRANCH
SUBBRANCH       
                ;opmode check
                BTST    #8,D2   ;z == 0 if bit is 1
                BNE     GROUP1_2  ;z == 0 if bit is 1. not normal
                BEQ     GROUP1_1

CONTSUBBRANCH                
                CLR.L   D3
                JSR     getSizeFormat1
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
                
MULSBRANCH      JSR     EAGROUP4ALL
                MOVE.B  #' ',(A4)+
                MOVE.B  #' ',(A4)+
                MOVE.B  #'S',(A4)+
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
                
                
GROUP1_1AND
                MOVEM.L D2,-(SP)
                JSR     EAGROUP1_1
                MOVEM.L (SP)+,D2
                BRA     CONTANDBRANCH
                
GROUP1_2AND
                MOVEM.L D2,-(SP)
                JSR     EAGROUP1_2
                MOVEM.L (SP)+,D2
                BRA     CONTANDBRANCH

ANDBRANCH                 
                ;8,7,6 cannot be 011
                CLR.L   D3
                MOVE.W  D2,D3
                LSR.W   #6,D3
                AND.W   #$0000000111,D3
                CMP.W   #%111,D3
                BEQ     INVALIDBRANCH
                
                ;opmode check
                BTST    #8,D2   ;z == 0 if bit is 1
                BNE     GROUP1_2AND ;z == 0 if bit is 1. not normal
                BEQ     GROUP1_1AND
                
CONTANDBRANCH                
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
                BRA     PRINTADD
*                BTST    #8,D3
*                BEQ     TESTADD   ;z == 0 if bit is 1. if bit is 1, then may be invalid
*                BNE     PRINTADD
 

GROUP1_1ADD
                MOVEM.L D2,-(SP)
                JSR     EAGROUP1_1
                MOVEM.L (SP)+,D2                
                BRA     CONTADDBRANCH
                
GROUP1_2ADD
                MOVEM.L D2,-(SP)
                JSR     EAGROUP1_2
                MOVEM.L (SP)+,D2                
                BRA     CONTADDBRANCH
               
PRINTADD
                BTST    #8,D2   ;z == 0 if bit is 1
                BNE     GROUP1_2ADD  ;z == 0 if bit is 1. not normal
                BEQ     GROUP1_1ADD
 
CONTADDBRANCH  
                CLR.L   D2
                MOVE.L  D3,D2
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
                
*TESTADD         LSL.W   #4,D3
*                AND.W   #%000000110000,D3
*                CMP.W   #0,D3
*                BEQ     INVALIDBRANCH ;it is addx
*                BRA     PRINTADD
                


OPCODEGROUP7    JSR     NEXTNEXTFOURHEX 
                ;by this point we cleared D3 and have have the next four hex value in D3 
                ASR.L   #2,D3
                CMPI.W  #3,D3
                BEQ     ASLMEMBRANCH
                
                CLR.L   D3
                MOVE.W  D2,D3
                BTST    #3,D3
                BEQ     ASLREGBRANCH            ;z == 1 if bit is 0
                BNE     LSLREGBRANCH            ;z == 0 if bit is 1 
                BRA     INVALIDBRANCH
                
ASLMEMBRANCH
                CLR.L   D3
                JSR     NEXTFOURHEX
                ASR.L   #1,D3
                CMPI.W  #0,D3
                BNE     LSLMEMBRANCH
                
                JSR     EAGROUP9
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
                JSR     EAGROUP9
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
                
                MOVEM.L D2/D3,-(SP)
                JSR     EAGROUP2
                MOVEM.L (SP)+,D2/D3
                
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
                
                ;get our EA here first
                MOVEM.L D2/D3,-(SP)
                JSR     EAGROUP2
                MOVEM.L (SP)+,D2/D3
                
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
                
                MOVEM.L D2/D3,-(SP)
                JSR     EAGROUP8
                MOVEM.L (SP)+,D2/D3
                
                CMP.B   #$FF,(tempresult)
                BEQ     NEXTIO
                
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
                    
;6000
                    CMP.W       #$6000,D2 
                    BEQ         EAGROUP5_SIZEW  
                    CMP.W       #$6E00,D2 
                    BEQ         EAGROUP5_SIZEW 
                    CMP.W       #$6F00,D2 
                    BEQ         EAGROUP5_SIZEW  
                    CMP.W       #$6700,D2 
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

EAGROUP2
                MOVE.W     D2,D3
                ASR.L      #5,D3 ;shifting bits to get to I/R bit
                AND.L      #%00000000001,D3
                CMPI.W     #1,D3
                BNE        INTDATABRANCH
                
                MOVE.W     D2,D3
                AND.L      #%0000000000000111,D3
                ADDI.B     #$30,D3
                MOVE.B     D3,(A4)+
                MOVE.B     #'D',(A4)+
                MOVE.B     #',',(A4)+

                MOVE.W     D2,D3
                 ASR.L     #8,D3
                ASR.L      #1,D3
                AND.L      #%0000111,D3
                ADDI.B     #$30,D3
                MOVE.B     D3,(A4)+
                MOVE.B     #'D',(A4)+
                MOVE.B     #' ',(A4)+
                MOVE.B     #' ',(A4)+
                MOVE.B     #' ',(A4)+
                RTS

                
INTDATABRANCH   MOVE.W     D2,D3
                AND.L      #%0000000000000111,D3
                ADDI.B     #$30,D3
                MOVE.B     D3,(A4)+
                MOVE.B     #'D',(A4)+
                MOVE.B     #',',(A4)+

                MOVE.W     D2,D3
                ASR.L     #8,D3
                ASR.L      #1,D3
                AND.L      #%0000111,D3
                ADDI.B     #$30,D3
                MOVE.B     D3,(A4)+
                MOVE.B     #'#',(A4)+
                MOVE.B     #' ',(A4)+
                MOVE.B     #' ',(A4)+
                MOVE.B     #' ',(A4)+

                RTS
*EAGROUP2
*                    CLR.L   D3
*                    MOVE.L  D2,D3
*                    ;push value to be shifted into string stack
*                    AND.L   #%0000000000000111,D3
*                    ADDI    #$30,D3
*                    MOVE.B  D3,(A4)+
*                    MOVE.B  #'D',(A4)+
*                    MOVE.B  #' ',(A4)+
*                    MOVE.B  #',',(A4)+
*                    
*                    CLR.L   D3
*                    MOVE.L  D2,D3
*                    AND.L   #%0000111000000000,D3
*                    ASR.L   #8,D3
*                    ASR.L   #1,D3
*                    ADDI    #$30,D3
*                    MOVE.B  D3,(A4)+
*                    
*                    CLR.L   D3
*                    MOVE.L  D2,D3
*                    ;lets detect i/r
*                    AND.L   #%0000000000100000,D3
*                    ASR.L   #5,D3
*                    CMPI.L  #0,D3
*                    BEQ     EAGROUP2IMMEDIATE
*                    
*                    MOVE.B  #'D',(A4)+
*                    MOVE.B  #' ',(A4)+
*                    RTS                 
*                    
*EAGROUP2IMMEDIATE
*                    MOVE.B  #'#',(A4)+
*                    MOVE.B  #' ',(A4)+
*                    RTS
                    
EAGROUP8
                    MOVEM.L D2,-(SP)
                    CLR.L   D1
                    JSR     EAFIRSTVALUE
                    MOVEM.L (SP)+,D2
                    
                    MOVE.B  #' ',(A4)+
                    MOVE.B  #',',(A4)+
                    
                    CLR.L   D1
                    JSR     EALASTVALUE
                    RTS
                    
EAGROUP1_2
                    MOVEM.L D1-D3,-(SP)
                    JSR EAGROUP9
                    MOVEM.L (SP)+,D1-D3
                    MOVE.B  #',',(A4)+
                    MOVE.B  #' ',(A4)+
                    
                    JSR EAGROUP1REGISTER
                    ;print register
                    RTS
EAGROUP1_1  
                    ;print register
                    MOVEM.L D1-D3,-(SP)
                    JSR EAGROUP1REGISTER
                    MOVEM.L (SP)+,D1-D3
                    MOVE.B  #',',(A4)+
                    MOVE.B  #' ',(A4)+

                    JSR EAGROUP9
                    RTS
                    
EAGROUP1REGISTER
                    AND.L   #%0000111000000000,D2
                    ASR.L   #8,D2
                    ASR.L   #1,D2
                    ADD.L   #$30,D2
                    MOVE.B  D2,(A4)+ 
                    MOVE.B  #'D',(A4)+
                    MOVE.B  #' ',(A4)+
                    RTS                 
    
                    
EAGROUP9
                    CLR.L   D1
                    JSR     EALASTVALUE
                    RTS
*******************************************************************************************
DEFAULTGROUP7       MOVE.L  #15,D6   ;max 15
                    BTST.L  #10,D2
                    BEQ     EAGROUP7DEFAULTPOST ;z == 0 if bit is 1, which is memory to register (post increment). do reg scan last, which is done first
                                         ;need to check for indirect adressing (MODE 010) AND immediate value (MODE 111)
                    MOVE.W  (A2),D1
                    ;else do src first
REVERSELOOP1DEF
                   BTST     D6,D1
                   BEQ      SKIPRVRSLOOPDEF
                   SUBI.B   #8,D6
                   AND.B    #$0F,D6
                   ADDI.B   #$30,D6
                   MOVE.B   D6,(A4)+
                   SUBI.B   #$30,D6
                   ADDI     #8,D6
                   MOVE.B   #'A',(A4)+
                   MOVE.B   #'/',(A4)+
SKIPRVRSLOOPDEF
                   SUBI.B   #1,D6
                   AND.B    #$0F,D6
                   CMPI     #8,D6
                   BNE      REVERSELOOP1DEF
                   BEQ      REVERSELOOPSPDEF
                   
REVERSELOOPSPDEF   SUBI.B   #1,D6
                   BTST     #8,D1
                   BEQ      REVERSELOOP2DEF
                   MOVE.B   #$30,(A4)+
                   MOVE.B   #'A',(A4)+
                   MOVE.B   #'/',(A4)+
                   ;SUBI.B   #1,D6
                   
REVERSELOOP2DEF       
                   BTST     D6,D1
                   BEQ      SKIPFRVRSLOOP2DEF
                   ADDI.B   #$30,D6
                   MOVE.B   D6,(A4)+
                   SUBI.B   #$30,D6
                   MOVE.B   #'D',(A4)+
                   MOVE.B   #'/',(A4)+
                   
SKIPFRVRSLOOP2DEF
                   SUBI     #1,D6
                   CMPI     #0,D6
                   BGE      REVERSELOOP2DEF
                   MOVE.B   -(A4),D6
                   CLR.L    D6
                   MOVE.B   #',',(A4)+
                   JSR     EAGROUP7OTHER
                   RTS
**************************************************************                   

**************************************************************
*CHECKIMMEDIATE 
*                    AND.L   #%0000000000111,D1
*                    CMP.L   #2,D1
*                    BEQ     DEFAULTGROUP7
*                    CMP.L   #7,D1
*                    BEQ     DEFAULTGROUP7
                                       
EAGROUP7DEFAULTPOST 
                   MOVEM.L A2,-(SP)
                   JSR     EAGROUP7OTHER
                   MOVEM.L (SP)+,A2
                   MOVEM.W  A2,-(SP)
                   
                   ;have to check if immediate, if so we have to pop twice
                   ;MOVE.W  (A2),D1
                   MOVE.W   D2,D1
                   ;AND.L   #%0000000000111,D1
                   
                   AND.L   #%0000000000111000,D1
                   LSR.L   #3,D1
                   
                   CMP.L   #7,D1
                   BEQ     SKIPDEFAULTGROUP7 ;since its immediate, we have to pop address stack twice
                   CLR.L    D1
                   MOVE.W  (A2),D1           ;otherwise do it once
                   MOVE.B   #',',(A4)+
                   MOVE.L   #15,D6   ;max 15
                    ;else do src first
                   BRA      REVERSELOOP1DEF2
SKIPDEFAULTGROUP7
                   CLR.L    D1
                   MOVE.W  (A2)+,D1
                   CLR.L    D1
                   MOVE.W   (A2)+,D1 
                   ;CLR.L    D1 
                   ;MOVE.W   (A2)+,D1                   
                   MOVE.B   #',',(A4)+
                   MOVE.L   #15,D6   ;max 15
                    ;else do src first
                   BRA      REVERSELOOP1DEF2
REVERSELOOP1DEF2
                   BTST     D6,D1
                   BEQ      SKIPRVRSLOOPDEF2
                   SUBI.B   #8,D6
                   AND.B    #$0F,D6
                   ADDI.B   #$30,D6
                   MOVE.B   D6,(A4)+
                   SUBI.B   #$30,D6
                   ADDI     #8,D6
                   MOVE.B   #'A',(A4)+
                   MOVE.B   #'/',(A4)+
SKIPRVRSLOOPDEF2
                   SUBI.B   #1,D6
                   AND.B    #$0F,D6
                   CMPI     #8,D6
                   BNE      REVERSELOOP1DEF2
                   BEQ      REVERSELOOPSPDEF2
                   
REVERSELOOPSPDEF2  SUBI.B   #1,D6
                   BTST     #8,D1
                   BEQ      REVERSELOOP2DEF2
                   MOVE.B   #$30,(A4)+
                   MOVE.B   #'A',(A4)+
                   MOVE.B   #'/',(A4)+
                   ;SUBI.B   #1,D6
                   
REVERSELOOP2DEF2       
                   BTST     D6,D1
                   BEQ      SKIPFRVRSLOOP2DEF2
                   ADDI.B   #$30,D6
                   MOVE.B   D6,(A4)+
                   SUBI.B   #$30,D6
                   MOVE.B   #'D',(A4)+
                   MOVE.B   #'/',(A4)+
                   
SKIPFRVRSLOOP2DEF2
                   SUBI     #1,D6
                   CMPI     #0,D6
                   BGE      REVERSELOOP2DEF2
                   MOVE.B   -(A4),D6
                   CLR.L    D6
                   MOVEM.W  (SP)+,A2
                   RTS

******************************************************************************                   
EAGROUP7
                    CLR.L   D1  ;byte holder               CLR.L   D1  ;byte holder
                    CLR.L   D6  ;loop counter
                    ;see if our mode is indirect addressing or immediate data.
                    CLR.L   D1
                    MOVE.L  D2,D1
                    LSR.L   #3,D1
                    AND.L   #%0000000000111,D1
                    CMP.L   #2,D1
                    BEQ     DEFAULTGROUP7
                    CMP.L   #7,D1
                    BEQ     DEFAULTGROUP7
                    
                    MOVE.L  #15,D6   ;max 15
                    BTST.L  #10,D2
                    BEQ     EAGROUP7POST ;z == 0 if bit is 1, which is memory to register (post increment). do reg scan last, which is done first
                                         ;need to check for indirect adressing (MODE 010) AND immediate value (MODE 111)
                    MOVE.W  (A2),D1
                    ;else do src first
REVERSELOOP1
                   BTST     D6,D1
                   BEQ      SKIPRVRSLOOP
                   SUBI.B   #8,D6
                   AND.B    #$0F,D6
                   ADDI.B   #$30,D6
                   MOVE.B   D6,(A4)+
                   SUBI.B   #$30,D6
                   ADDI     #8,D6
                   MOVE.B   #'A',(A4)+
                   MOVE.B   #'/',(A4)+
SKIPRVRSLOOP
                   SUBI.B   #1,D6
                   AND.B    #$0F,D6
                   CMPI     #8,D6
                   BNE      REVERSELOOP1
                   BEQ      REVERSELOOPSPC
                   
REVERSELOOPSPC     SUBI.B   #1,D6
                   BTST     #8,D1
                   BEQ      REVERSELOOP2
                   MOVE.B   #$30,(A4)+
                   MOVE.B   #'A',(A4)+
                   MOVE.B   #'/',(A4)+
                   ;SUBI.B   #1,D6
                   

REVERSELOOP2       
                   BTST     D6,D1
                   BEQ      SKIPFRVRSLOOP2
                   ADDI.B   #$30,D6
                   MOVE.B   D6,(A4)+
                   SUBI.B   #$30,D6
                   MOVE.B   #'D',(A4)+
                   MOVE.B   #'/',(A4)+
SKIPFRVRSLOOP2
                   SUBI     #1,D6
                   CMPI     #0,D6
                   BGE      REVERSELOOP2
                   MOVE.B   -(A4),D6
                   CLR.L    D6
                   MOVE.B   #',',(A4)+
                   JSR     EAGROUP7OTHER
                   RTS

EAGROUP7OTHER
                ;we have to detect for immediate value as eagroup9 cannot be used for that
                ;this is mainly bcs there are three word sized hex. 
                CLR.L   D1
                MOVE.L  D2,D1
                LSR.L   #3,D1
                AND.L   #%0000000000111,D1
                CMP.L   #7,D1
                BEQ     IMMEDIATEDATAGROUP7
                JSR     EAGROUP9
                RTS
                
IMMEDIATEDATAGROUP7 
                    CLR.L   D1
                    MOVE.L  D2,D1
                    AND.L   #%0000000000000111,D2
                    ;let d1 have the next value
                    CLR.L   D1
                    CMPI.L  #0,D2
                    BEQ     PRINTWORDDATA7
                    CMPI.L  #1,D2
                    BEQ     PRINTLONGDATA7
                    CMPI.L  #4,D2
                    BEQ     PRINTIMMEDIATEDATA7
                    BRA     INVALIDEAMODE
                
PRINTWORDDATA7
                    MOVE.W  (A2)+,D1
                    CLR.L   D1
                    MOVE.W  (A2)+,D1
                    MOVEM.L D2-D7/A1-A3/A6,-(sp)
                    MOVE.L  #$4,D4
                    JSR     HEXOUTPUT
                    MOVEM.L  (sp)+,D2-D7/A1-A3/A6
                    MOVE.B  #'$',(A4)+
                    MOVE.B  #' ',(A4)+
                    MOVE.B  #' ',(A4)+  
                    MOVE.B  #' ',(A4)+
                    MOVE.B  #' ',(A4)+
                    MOVE.B  #' ',(A4)+  
                    RTS

PRINTLONGDATA7
                    MOVE.W  (A2)+,D1
                    CLR.L   D1
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
                    MOVE.B  #' ',(A4)+
                    MOVE.B  #' ',(A4)+  
                    MOVE.B  #' ',(A4)+
                    MOVE.B  #' ',(A4)+
                    MOVE.B  #' ',(A4)+  
                    RTS
  
PRINTIMMEDIATEDATA7
                    MOVE.W  (A2)+,D1
                    CLR.L   D1
                    MOVE.W  (A2)+,D1
                    MOVEM.L D2-D7/A1-A3/A6,-(sp)
                    MOVE.L  #4,D4
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
                    
EAGROUP7POST                             
                   JSR     EAGROUP7OTHER
                   MOVE.W  (A2),D1
                   MOVE.B   #',',(A4)+
                   MOVE.L  #15,D6   ;max 15



FRWRDLOOP1         
                   CMPI     #15,D6
                   BEQ      FORWARDLOOP2SPC
                   BTST     D6,D1
                   BEQ      SKIPFRWRDSLOOP
                   MOVE.L   D6,D3
                   SUBI.B   #15,D6
                   MULS     #-1,D6
                   AND.L    #$0000000F,D6
                   ADDI.B   #$30,D6
                   MOVE.B   D6,(A4)+
                   SUBI.B   #$30,D6
                   MOVE.B   #'D',(A4)+
                   MOVE.B   #'/',(A4)+
                   MOVE.L   D3,D6
SKIPFRWRDSLOOP
                   SUB.B    #1,D6
                   CMPI     #7,D6
                   BNE      FRWRDLOOP1
                   BEQ      FORWARDLOOP2SET
                   
FORWARDLOOP2SPC
                   BTST     #15,D1
                   BEQ      SKIPFRWRDSLOOP
                   MOVE.B   #$30,(A4)+
                   MOVE.B   #'D',(A4)+
                   MOVE.B   #'/',(A4)+  
                   BRA      SKIPFRWRDSLOOP

FORWARDLOOP2SET     
                   CLR.L    D3
                   
FORWARDLOOP2
                   BTST     D6,D1
                   BEQ      SKIPFRWRDSLOOP2
                   CMP.L    #0,D6
                   BEQ      SKIPFRWRDSLOOP2SPC
                   MOVE.L   D6,D3
                   
                   SUBI.B   #7,D6
                   MULS     #-1,D6
                   AND.L    #$0000000F,D6                

                   ADDI.B   #$30,D6
                   MOVE.B   D6,(A4)+
                   SUBI.B   #$30,D6
                   MOVE.B   #'A',(A4)+
                   MOVE.B   #'/',(A4)+
                   MOVE.L   D3,D6
SKIPFRWRDSLOOP2
                   SUBI.B   #1,D6
                   CMPI     #$FF,D6
                   BNE      FORWARDLOOP2
                   MOVE.B   -(A4),D6
                   CLR.L    D6
                   RTS

SKIPFRWRDSLOOP2SPC  MOVE.B   #$37,(A4)+
                    MOVE.B   #'A',(A4)+
                    MOVE.B   #'/',(A4)+
                    BRA     SKIPFRWRDSLOOP2


EAGROUP4ALL          ;everything except LEA
                    CLR.L   D1
                    JSR     CONSTANTREG
                    MOVE.B  #'D',(A4)+
                    MOVE.B  #',',(A4)+
                    BRA     EAGROUP9
                    
EAGROUP4LEA          ;ONLY FOR LEA
                    CLR.L   D1
                    JSR     CONSTANTREG
                    MOVE.B  #'A',(A4)+
                    MOVE.B  #',',(A4)+
                    BRA     EAGROUP9
                    
CONSTANTREG
                   MOVE.L   D2,D1
                   ;we just want the 11th - 9th bit
                   AND.L    #%0000111000000000,D1
                   LSR.L    #8,D1
                   LSR.L    #1,D1
                   ADDI.B  #$30,D1
                   MOVE.B  D1,(A4)+
                   RTS
                   
EAFIRSTVALUE
                    MOVE.L  D2,D1
                    AND.L   #%0000000111000000,D1
                    LSR.L   #6,D1
                    
                    CMP.L   #7,D1
                    BEQ     IMMEDIATEDATAFIRST
                    CMP.L   #4,D1
                    BEQ     ADDRESSDECREMENTFIRST
                    BGT     INVALIDEAMODE
                    CMP.L   #3,D1
                    BEQ     ADDRESSINCREMENTFIRST
                    CMP.L   #2,D1
                    BEQ     INDIRECTADDRESSFIRST
                    CMP.L   #1,D1
                    BEQ     DIRECTADDRESSFIRST
                                        ;data reg

                    
                    CLR.L   D1
                    MOVE.L  D2,D1
                    MOVE.L  D2,D1
                    AND.L   #%0000111000000000,D1
                    ASR.L   #8,D1
                    ASR.L   #1,D1                    
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
                    
                    
INDIRECTADDRESSFIRST

*                    MOVE.L  #6,D0
*                    TRAP    #15
                    
                    MOVE.B  #')',(A4)+
*                    MOVE.L  #6,D0
*                    TRAP    #15

                    MOVE.L  D2,D1
                    AND.L   #%0000111000000000,D1
                    ASR.L   #8,D1
                    ASR.L   #1,D1
                    
                    ADDI.B  #$30,D1
                    MOVE.B  D1,(A4)+
                    
                    MOVE.B  #'A',(A4)+
                    MOVE.B  #'(',(A4)+
*                    MOVE.L  #6,D0
*                    TRAP    #15
                    
                    MOVE.B  #' ',(A4)+
                    MOVE.B  #' ',(A4)+
                    MOVE.B  #' ',(A4)+                    
                    RTS                  
      
DIRECTADDRESSFIRST
                    CLR.L   D1
                    MOVE.L  D2,D1
                    
                    
                    AND.L   #%0000111000000000,D1
                    ASR.L   #8,D1
                    ASR.L   #1,D1
                    
                    
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

              
IMMEDIATEDATAFIRST
                    ;need to decide whether print long, word, or byte sized. 
                    ;decide size of output, 0(word), 1(long), 4(immediate)
*                    MOVE.L      #$23,D1
*                    MOVE.L      #6,D0
*                    TRAP        #15
                    
                    CLR.L   D1
                    MOVE.L  D2,D1
                    AND.L   #%0000111000000000,D1
                    ASR.L   #8,D1
                    ASR.L   #1,D1
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

                        
ADDRESSINCREMENTFIRST    
                    MOVE.B  #'+',(A4)+
*                    MOVE.L  #6,D0
*                    TRAP    #15

                    MOVE.B  #')',(A4)+
*                    MOVE.L  #6,D0
*                    TRAP    #15
                    

   
                    MOVE.L  D2,D1
                    
                    AND.L   #%0000111000000000,D1
                    ASR.L   #8,D1
                    ASR.L   #1,D1
                    
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
                    

ADDRESSDECREMENTFIRST 
                    MOVE.B  #')',(A4)+
*                    MOVE.L  #6,D0
*                    TRAP    #15
                    
                    MOVE.L  D2,D1
                    
                    AND.L   #%0000111000000000,D1
                    ASR.L   #8,D1
                    ASR.L   #1,D1
                    
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
                    
                    MOVE.B  #'A',(A4)+
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
                    
                        
PRINTWORDDATA
                    MOVE.W  (A2)+,D1
                    MOVEM.L D2-D7/A1-A3/A6,-(sp)
                    MOVE.L  #$4,D4
                    JSR     HEXOUTPUT
                    MOVEM.L  (sp)+,D2-D7/A1-A3/A6
                    MOVE.B  #'$',(A4)+
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
                    MOVE.B  #' ',(A4)+
                    MOVE.B  #' ',(A4)+  
                    MOVE.B  #' ',(A4)+
                    MOVE.B  #' ',(A4)+
                    MOVE.B  #' ',(A4)+  
                    RTS
  
PRINTIMMEDIATEDATA
                    MOVE.W  (A2)+,D1
                    MOVEM.L D2-D7/A1-A3/A6,-(sp)
                    MOVE.L  #4,D4
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
                BGT      ENDPAGE ;so when equal, we are done
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
                LEA     IOVariable,A1          ;had to specify or it wont work properly                 
                LEA     NEWPAGEMSG,A1     
                MOVE.W  #14,D0          
                TRAP    #15 
                
                LEA     IOVariable,A1          ;had to specify or it wont work properly                 
                MOVE.W  #2,D0           ;had to specify or it wont work properly
                TRAP    #15  
                
                MOVE.B  (A1),D3
                
                LEA     IOVariable,A1          ;had to specify or it wont work properly
                CMP.B   #$59,D3
                BEQ     FEEDOPCODE
                CMP.B   #$79,D3
                BEQ     FEEDOPCODE
                CMP.B   #$0,D3
                BEQ     FEEDOPCODE
                CMP.B   #$4E,D3
                BEQ     ENDPAGE 
                CMP.B   #$6E,D3
                BEQ     ENDPAGE 
                
                LEA     IOVariable,A1          ;had to specify or it wont work properly
                LEA     BADCHARACTER,A1     
                MOVE.W  #13,D0          
                TRAP    #15
                
                BRA     NEWPAGELOOP  
                ******************************************************************************************************************
ENDPAGE                 
                MOVEM.L     (SP)+,D0-D7/A1-A6 ;start from scratch, all 0s
                BRA         STARTMENU
 
                
ENDPROGRAM              
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

MSGINPUT            DC.B    'Please enter first memory address  (''Q'' to quit): $',0
MSGINPUT2           DC.B    'Please enter second memory address (''Q'' to quit): $',0
BADVALUE            DC.L    'INPUT VALUE EXCEEDS 32 BIT RANGE!',CR,LF,0
BADCHARACTER        DC.L    'INPUT HAS ILLEGAL CHARACTER!',CR,LF,0
BADADDRESS          DC.L    'SOURCE ADDRESS CANNOT BE BIGGER THEN DESTINATION ADDRESS!',CR,LF,0
VALUETOOLOW         DC.L    'VALUE TOO LOW DUE TO LOW INPUT VALUE OR OVERFLOW!',CR,LF,0
NEWPAGEMSG          DC.L    'ENTER TO CONTINUE... ',CR,LF,0

NEWPROGMSG          DC.L    'STARTOVER? [Y|N]: ',CR,LF,0

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
tempresult          DS.L    50      ; variable to save temporary result
base16value         DS.L    50     ; variable to save the final result
IOVariable          DS.L    10     ; variable to save the final result

* Put variables and constants here

    END    START        ; last line of source
