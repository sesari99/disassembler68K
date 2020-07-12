*-----------------------------------------------------------
* Title      : Dissambler
* Written by : TheCoolGroup
* Date       : 7/21/20
* Description: Interprets memory into Opcodes
*-----------------------------------------------------------
 ORG    $1000
START:                  ; first instruction of program
CR      EQU     $0D
LF      EQU     $0A 


* Put program code here

*MICAH RICE VERSION OF I/O PROMPT
LOOP    LEA     MSG,A1      ;show message to user
        MOVE.W  #14,D0
        TRAP	#15
        
        MOVE.W	#4,D0       ;put memory address
        TRAP	#15
        
        LEA     MSGTWO,A1   ;show message to user
        MOVE.W  #14,D0
        TRAP	#15
        
        MOVE.W	#4,D0       ;put memory address
        TRAP	#15
        SIMHALT             ; halt simulator
        
 

* Put variables and constants here
MSG     DC.B    'Please input starting memory address:',CR,LF,0
MSGTWO  DC.B    'Please input ending memory addresses:',CR,LF,0

    END    START        ; last line of source



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
