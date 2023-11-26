INCLUDE Irvine32.inc
; Constants
MAX_PARKING_COUNT equ 8
RIKSHAW_FEE equ 200
CAR_FEE equ 300
BUS_FEE equ 400
.data

Index Byte 1
Promp11 Byte "PARKING MANAGEMENT",0
Prompt12 Byte "===============",0
menu db '******MENU********$',0
menu1 db 'Assign rikshaw ',0
menu2 db 'Assign  car',0
Input0 db 'Proceed to parking',0
Input1 db 'Show records',0
menu3 db 'Assign bus',0
menu4 db 'Show the records',0
menu5 db 'Press 5 to delete the record',0
menu6 db 'Exit?',0
msg1 db 'Parking Is Full',0
msg2 db 'Wrong input',0
msg3 db 'car$',0
msg4 db 'bus$',0
msg5 db 'record$',0
msg6 db 'there is more space',0
msg7 db 'the total amount is=$',0
msg71 db 'Press 1 to return',0
msg8 db 'the total numbers of vehicles parked=',0
msg9 db 'the total number of rikshws parked=',0
msg10 db 'the total number of cars parked=',0
msg11 db 'the total number of buses parked=',0
msg12 db '**Record deleted successfully**',0
pr1 db 'Rickshaw parked. remaining slots : ',0
pr2 db 'Car parked. remaining slots : ',0
pr3 db 'Bus parked. remaining slots : ',0
rem dword MAX_PARKING_COUNT
amount dw 0
count dword 0
am1 dw ?
am2 dw ?
am3 dw ?
Exitt Byte "EXIT",0

rikshawCount dw 0
carCount db 0
busCount db 0


r dw '0'
cc db '0'
b db '0'
.code
main proc
Call INTRO
Call HomePage

cmp index,1
jne elsee_if
Call User_Interface

elsee_if:
cmp index,2
jne elsee
mov index,1
Call displayRecord

elsee:
mov ecx,10
ENDING_PROCESS:
Call Crlf
LOOP ENDING_PROCESS
Invoke ExitProcess,0

exit
main ENDP
                                ;Homepage proc
HomePage PROC
call clrscr

mov ecx,80
mov dl,10
mov dh,4
LOOPS:
call gotoxy
mov al,42
call writechar
inc dl
LOOP LOOPS

mov ecx,20
dec dl
inc dh
LOOPSS:
call gotoxy
mov al,42
call writechar
inc dh
LOOP LOOPSS

mov ecx,80
LOOPPSS:
call gotoxy
mov al,42
call writechar
dec dl
LOOP LOOPPSS


mov ecx,22
mov dh,4
mov dl,10
LOOPPSSS:
call gotoxy
mov al,42
call writechar
inc dh
LOOP LOOPPSSS

whilee:

mov eax,15
call SetTextColor

mov dh,7
mov dl,35
call gotoxy
mov edx,offset menu
call writestring

mov dh,8
mov dl,35
call gotoxy
mov edx,offset prompt12
call writestring

mov eax,15
call SetTextColor


cmp index,1
jne next
mov eax,12
call SetTextColor
next:
mov dh,10
mov dl,35
call gotoxy
mov edx,offset input0
call writestring


mov eax,15
call SetTextColor


cmp index,2
jne next1
mov eax,12
call SetTextColor
next1:

mov dh,12
mov dl,35
call gotoxy
mov edx,offset input1
call writestring


mov eax,15
call SetTextColor

cmp index,3
jne next13
mov eax,12
call SetTextColor
next13:

mov dh,14
mov dl,35
call gotoxy
mov edx,offset exitt
call writestring

mov eax,15
call SetTextColor


mov dh,16
mov dl,35
call gotoxy
call readchar

cmp eax,18432
jne down
dec index
down:
cmp eax,20480
jne up
inc index
up:
cmp index,4
jne loww
mov index,1
loww:
cmp index,0
jne lowww
mov index,3
lowww:
cmp al,13
jne whilee


call crlf
ret
HomePage ENDP
                                 ;Intro Proc
Intro Proc

Call Clrscr

mov eax,11
call SetTextColor

mov ecx,80
mov dl,10
mov dh,4
LOOPS:
call gotoxy
mov al,42
call writechar
inc dl
LOOP LOOPS

mov ecx,20
dec dl
inc dh
LOOPSS:
call gotoxy
mov al,42
call writechar
inc dh
LOOP LOOPSS

mov ecx,80
LOOPPSS:
call gotoxy
mov al,42
call writechar
dec dl
LOOP LOOPPSS


mov ecx,22
mov dh,4
mov dl,10
LOOPPSSS:
call gotoxy
mov al,42
call writechar
inc dh
LOOP LOOPPSSS


mov eax,10
call SetTextColor

mov dl,40
mov dh,13
call gotoxy
mov edx,offset promp11
call writestring

mov eax,14
call SetTextColor


mov dl,40
mov dh,14
call gotoxy
mov edx,offset prompt12
call writestring

mov eax,15
call SetTextColor


mov ecx,13
CR:
call crlf
LOOP CR
call waitmsg
ret
Intro Endp
                                ;User InterfaceProc
User_Interface Proc
call clrscr

mov ecx,80
mov dl,10
mov dh,4
LOOPS:
call gotoxy
mov al,42
call writechar
inc dl
LOOP LOOPS

mov ecx,20
dec dl
inc dh
LOOPSS:
call gotoxy
mov al,42
call writechar
inc dh
LOOP LOOPSS

mov ecx,80
LOOPPSS:
call gotoxy
mov al,42
call writechar
dec dl
LOOP LOOPPSS


mov ecx,22
mov dh,4
mov dl,10
LOOPPSSS:
call gotoxy
mov al,42
call writechar
inc dh
LOOP LOOPPSSS


whilee:

mov eax,15
call SetTextColor

mov dh,7
mov dl,35
call gotoxy
mov edx,offset promp11
call writestring

mov dh,8
mov dl,35
call gotoxy
mov edx,offset prompt12
call writestring

mov eax,15
call SetTextColor


cmp index,1
jne next
mov eax,12
call SetTextColor
next:
mov dh,10
mov dl,35
call gotoxy
mov edx,offset menu1
call writestring


mov eax,15
call SetTextColor


cmp index,2
jne next1
mov eax,12
call SetTextColor
next1:

mov dh,12
mov dl,35
call gotoxy
mov edx,offset menu2
call writestring


mov eax,15
call SetTextColor


cmp index,3
jne next11
mov eax,12
call SetTextColor
next11:

mov dh,14
mov dl,35
call gotoxy
mov edx,offset menu3
call writestring


mov eax,15
call SetTextColor


cmp index,4
jne next12
mov eax,12
call SetTextColor
next12:

mov dh,16
mov dl,35
call gotoxy
mov edx,offset menu5
call writestring


mov eax,15
call SetTextColor


mov eax,15
call SetTextColor


cmp index,5
jne next13
mov eax,12
call SetTextColor
next13:

mov dh,18
mov dl,35
call gotoxy
mov edx,offset menu6
call writestring

mov eax,15
call SetTextColor


mov dh,20
mov dl,35
call gotoxy
call readchar

cmp eax,18432
jne down
dec index
jmp up
down:
cmp eax,20480
jne up
inc index
up:
cmp index,6
jne loww
mov index,1
loww:
cmp index,0
jne lowww
mov index,5
lowww:
cmp al,13
jne whilee

cmp index,1
jne character
call parkRikshaw
call User_Interface 
jmp ending

character:
cmp index,2
jne WORDD
call parkCar
call User_Interface 
jmp ending

WORDD:
cmp index,3
jne STRINGSS
CALL parkBus
call User_Interface 
jmp ending

Stringss:
cmp index,4
jne endss
call deleteRecord
call User_Interface 
jmp ending

endss:
cmp index,5
jne ending
mov index,1
call HomePage

ending:
call crlf
ret
User_Interface Endp
                               ;park rickshaw
parkRikshaw proc
    ; Check if parking is full
    cmp count, MAX_PARKING_COUNT
    jge parkingFull
    dec rem
    mov eax,rem
    mov edx,OFFSET pr1
    call WRITESTRING
    call WRITEDEC
    mov eax,1000
    call DELAY
    ; Add rikshaw fee to total amount
    add amount, RIKSHAW_FEE

    ; Increment rikshaw count
    inc rikshawCount

    ; Increment total count
    inc count
    jmp endPark

    parkingFull:
    mov eax,2000
    call clrscr
    mov edx,offset msg1
    call writestring
    call Delay

    endPark:
    ret
parkRikshaw endp
                              ;park car Proc
parkCar proc
    ; Similar to parkRikshaw, but for cars
    cmp count, MAX_PARKING_COUNT
    jge parkingFull
    dec rem
    mov eax,rem
    mov edx,OFFSET pr2
    
    call WRITESTRING
    call WRITEDEC
    mov eax,1000
    call DELAY
    add amount, CAR_FEE
    inc carCount
    inc count
    jmp endPark

    parkingFull:
    mov eax,1000
    call clrscr
    mov edx,offset msg1
    call writestring
    call Delay
    endPark:
    ret
parkCar endp

                                ;park bus Proc
parkBus proc
    ; Similar to parkRikshaw, but for buses
    cmp count, MAX_PARKING_COUNT
    jge parkingFull
    dec rem
    mov eax,rem
    mov edx,OFFSET pr3
    call WRITESTRING
    call WRITEDEC
    mov eax,1000
    call DELAY
    add amount, BUS_FEE
    inc busCount
    inc count
    jmp endPark

    parkingFull:
    mov eax,2000
    call clrscr
    mov edx,offset msg1
    call writestring
    call Delay
    endPark:
    ret
parkBus endp
                                 ;displayrecords
displayRecord proc
     mov edx,offset msg71
     call WRITESTRING
     call crlf
       
        
        call displayMenu
        
        
       call User_Interface
        
        ret
displayRecord endp
                                  ;call delete records
deleteRecord proc
    ; Reset all counts and the total amount
    mov rikshawCount, 0
    mov carCount, 0
    mov busCount, 0
    mov amount, 0
    mov count, 0
    mov rem,MAX_PARKING_COUNT
    ; Display a success message
    call clrscr
    mov edx,offset msg12
    call writestring
    mov eax,2000
    call DELAY
    call User_Interface

    
    ret
deleteRecord endp
                                    ;displaymenu
displayMenu proc
    ; Display the total amount, total count, and counts for each type of vehicle
    
    mov edx,offset msg7
    call writestring
    movzx eax, amount

    call writeDec
    call crlf

mov edx,offset msg8
call writestring
mov eax, count
call writeDec
call crlf

mov edx,offset msg9
call writestring
movzx eax, rikshawCount
call writeDec
call crlf

mov edx,offset msg10
call writestring
movzx eax, carCount
call writeDec
call crlf

mov edx,offset msg11
call writestring
movzx eax, busCount
call writeDec
call crlf
call waitmsg
ret
displayMenu endp
                            ;deassigning a parking spot
deleteRecord1 proc
    ; Reset all counts and the total amount
    mov rikshawCount, 0
    mov carCount, 0
    mov busCount, 0
    mov amount, 0
    mov count, 0

    ; Display a success message
    mov edx,offset msg12
    call writestring
    call crlf
    ret
deleteRecord1 endp

end main