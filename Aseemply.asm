.model Large
.data 
msg1 db  ,10, '                    *******Welcome in our Library App*******',10,'                            ------------------------' ,'$'
msg2 db  ,10,10,10, ' :) The Available Books are :-  ',10,'$'
   
msgc db  ,10, '<<|         1- Comedy                |>>','$'
msgB db  ,10, '<<|         2- Black Comedy          |>>','$'
msgD db  ,10, '<<|         3- drama                 |>>','$'
msgH db  ,10, '<<|         4- Horror                |>>','$'
msgL db  ,10, '<<|         5- Classic               |>>','$'
msgF db  ,10, '<<|         6- Fictional             |>>','$'
msgS db  ,10, '<<|         7- Sceintific            |>>','$'
ABooks db,10,10, ':) The Availble Bbooks for you are :- ',10,'$'
;********************************************************************************
msg1c db  ,10, ' |         1-  The Way I Heard It                    |','$'
msg2c db  ,10, ' |         2-  The Ladies Room                       |','$'
msg3c db  ,10, ' |         3-  The Funniest Joke Book ever           |','$'
msg4c db  ,10, ' |         4-  Comedy Comedy Comedy Drama: A Memoir  |','$'
;********************************************************************************
msg1b db  ,10, ' |         1-  Catch-22                              |','$'
msg2b db  ,10, ' |         2-  Cat"s Cradle                          |','$'
msg3b db  ,10, ' |         3-  Red Russia                            |','$'
msg4b db  ,10, ' |         4-  As I Lay Dying                        |','$'
;********************************************************************************
msg1h db  ,10, ' |         1-  Verity                                |','$'
msg2h db  ,10, ' |         2-  The Silent Patient                    |','$'
msg3h db  ,10, ' |         3-  I Am Watching You                     |','$'
msg4h db  ,10, ' |         4-  The Maid: A Novel                     |','$'
;********************************************************************************
msg1d db  ,10, ' |         1-  Romeo and Juliet                      |','$'
msg2d db  ,10, ' |         2-  Hamlet                                |','$'
msg3d db  ,10, ' |         3-  Gone Girl                             |','$'
msg4d db  ,10, ' |         4-  Macbeth                               |','$'
;********************************************************************************
msg1L db  ,10, ' |         1-  A Christmas Carol                     |','$'
msg2L db  ,10, ' |         2-  Animal Farm                           |','$'
msg3L db  ,10, ' |         3-  Crime and Punishment                  |','$'
msg4L db  ,10, ' |         4-  Nineteen Eighty-Four 1949             |','$'
;********************************************************************************
msg1f db  ,10, ' |         1-  The Princess Bride                    |','$'
msg2f db  ,10, ' |         2-  The Master and Margarita              |','$'
msg3f db  ,10, ' |         3-  The Other Guest                       |','$'
msg4f db  ,10, ' |         4-  The Kite Runner                       |','$'
;********************************************************************************
msg1s db  ,10, ' |         1-  The God Equation                      |','$'
msg2s db  ,10, ' |         2-  The Demon-Haunted World               |','$'
msg3s db  ,10, ' |         3-  The Elegant Universe                  |','$'
msg4s db  ,10, ' |         4-  The Blind Watchmaker                  |','$'
;********************************************************************************

msg3 db  ,10,10, ':) Please Choose Your favourite Type:-  ',10,'$'
rec db  10,10,':) These Books Are Reccomended for You :)   :-  ',10,'$' 
choisBook db  ,10,10, ':) Please Choose which book are you wanted:-  ',10,'$'
errormsg db  ,10, 'XXXXXXXXX :( X :( X error X ): X ): XXXXXXXXX   ','$'
Backmsg db  ,10,10, '  <<< 8-  Back               !!! ',10,'$'
quitmsg db ,10,10,  '  <<< 9-  Quit               !!! ',10,'$'
recmsg db ,10,10,   '  <<< 0-  Reccomendation     !!! ','$'
;********************************************************************************
bookedmsg1 db ,10,10, ':) Successful Process :-  ','$'
bookedmsg2 db ,10, ':) the BOOK Booked for you :-  ','$'
bookedmsg3 db ,10, ':) Another Service :-  ','$'
x db 1,2,3,4,5,6,7,8 

;******************************************************************************** 
.code
    main proc far 
        .startup
        .386 
            lea dx,msg1  ;display welcome messege
            mov ah,09h
            int 21h

            call displayMessege    ;available books
                        
             mov ah,01h   ;accept the choise
             int 21h
             mov bl,al
             sub  bl,30h
           
             call compare        ;user's input compare
     
            c:
            call comedybooks  ;1
             
            b:
            call blackComedy ;2

            h:
            call Horror   ;3
             
            d:
            call drama  ;4 
             
            l:
            call classic  ;5
            
            f:
            call Fictional  ;6
            
            s: 
            call Sceintific  ;7
 
            er:           ;[0.1.2.3.4.5.6.7.8.9]
             call error  
               
          quit:               
             lea dx,quitmsg   ;9
             mov ah,09h
             int 21h
             jp stop
               
     recommend:  
             lea dx,recmsg       ;0
             mov ah,09h
             int 21h
             
             lea dx,rec
             mov ah,09h
             int 21h
                
             lea dx,msg1b
             mov ah,09h
             int 21h
               
             lea dx,msg2L
             mov ah,09h
             int 21h
               
             lea dx,msg3f
             mov ah,09h
             int 21h
               
             lea dx,msg4s
             mov ah,09h
             int 21h
               
               
             lea dx,choisBook
             mov ah,09h
             int 21h
             
             mov ah,01h   ;accept the choise
             int 21h
             mov bl,al
             sub  bl,30h
             
             cmp bl,1
             je booked
             
             cmp bl,2
             je booked  
 
             cmp bl,3
             je booked             
 
             cmp bl,4
             je booked 
   
             call er   
             jp stop
             
                  
         booked:               ;scusseful boooking
         
             lea dx,bookedmsg1  ;display booked messege
             mov ah,09h
             int 21h
               
             lea dx,bookedmsg2  ;display booked messege
             mov ah,09h
             int 21h
               
             lea dx,bookedmsg3  ;display booked messege
             mov ah,09h
             int 21h
               
             lea dx,Backmsg  ;display back messege
             mov ah,09h
             int 21h
               
             lea dx,quitmsg
             mov ah,09h
             int 21h
               
             mov ah,01h   ;accept the choise
             int 21h
             mov bl,al
             sub  bl,30h
   
             cmp bl,8
             jpe back
               
             cmp bl,9
             jpe quit
             
             jne error
               
        stop:
        .Exit
    main endp
;********************************************************************************
    error proc near    ;invalid input 
              lea dx,errormsg
               mov ah,09h
               int 21h
               
               lea dx,Backmsg  ;display back messege
               mov ah,09h
               int 21h
               
               lea dx,quitmsg
               mov ah,09h
               int 21h
               
               lea dx,recmsg
               mov ah,09h
               int 21h
               
               mov ah,01h   ;accept the choise
               int 21h
               mov bl,al
               sub  bl,30h
   
               cmp bl,8
               jpe back
               
               cmp bl,9
               jpe quit
               
               cmp bl,0
               jpe recommend
               
               jp stop
               
               ret
    error endp
;********************************************************************************    
    back proc near   ;8   ;back procedure
           jmp  main
           jmp stop
           ret
    back endp
;******************************************************************************** 
; book procesdures
   
    blackComedy proc near
            lea dx,msgB  ;display blackcomedy messege
            mov ah,09h
            int 21h
            
            lea dx,ABooks
            mov ah,09h
            int 21h
            
            lea dx,msg1b
            mov ah,09h
            int 21h
             
            lea dx,msg2b
            mov ah,09h
            int 21h
             
            lea dx,msg3b
            mov ah,09h
            int 21h
             
            lea dx,msg4b
            mov ah,09h
            int 21h
             
            lea dx,choisBook
            mov ah,09h
            int 21h
             
            mov ah,01h   ;accept the choise
            int 21h
            mov bl,al
            sub  bl,30h
             
            cmp bl,1
            je booked
             
            cmp bl,2
            je booked  
 
            cmp bl,3
            je booked             
 
            cmp bl,4
            je booked 
             
 
            call er
            jmp stop
            
            ret
    blackComedy endp
;********************************************************************************
    classic proc near
    
            lea dx,msgL  ;display classic messege
            mov ah,09h
            int 21h
            
            lea dx,ABooks
            mov ah,09h
            int 21h
 
            lea dx,msg1L
            mov ah,09h
            int 21h
             
            lea dx,msg2L
            mov ah,09h
            int 21h
             
            lea dx,msg3L
            mov ah,09h
            int 21h
             
            lea dx,msg4L
            mov ah,09h
            int 21h
             
            lea dx,choisBook
            mov ah,09h
            int 21h
             
            mov ah,01h   ;accept the choise
            int 21h
            mov bl,al
            sub  bl,30h
             
            cmp bl,1
            je booked
             
            cmp bl,2
            je booked  
 
            cmp bl,3
            je booked             
 
            cmp bl,4
            je booked 
             
 
            call er
            jmp stop
            
            ret
    
          classic endp 
;********************************************************************************          
       Fictional proc near
    
            lea dx,msgF  ;display Fictional messege
            mov ah,09h
            int 21h
            
            lea dx,ABooks
            mov ah,09h
            int 21h
    
            lea dx,msg1f
            mov ah,09h
            int 21h
             
            lea dx,msg2f
            mov ah,09h
            int 21h
             
            lea dx,msg3f
            mov ah,09h
            int 21h
             
            lea dx,msg4f
            mov ah,09h
            int 21h
             
            lea dx,choisBook
            mov ah,09h
            int 21h
             
            mov ah,01h   ;accept the choise
            int 21h
            mov bl,al
            sub  bl,30h
             
            cmp bl,1
            je booked
             
            cmp bl,2
            je booked  
 
            cmp bl,3
            je booked             
 
            cmp bl,4
            je booked 
             
 
            call er
            jmp stop
            
            ret
    
          Fictional endp 
;********************************************************************************
    Sceintific  proc near
    
            lea dx,msgS  ;display Sceintific  messege
            mov ah,09h
            int 21h
            
            lea dx,ABooks
            mov ah,09h
            int 21h

            lea dx,msg1s
            mov ah,09h
            int 21h
             
            lea dx,msg2s
            mov ah,09h
            int 21h
             
            lea dx,msg3s
            mov ah,09h
            int 21h
             
            lea dx,msg4s
            mov ah,09h
            int 21h
             
            lea dx,choisBook
            mov ah,09h
            int 21h
             
            mov ah,01h   ;accept the choise
            int 21h
            mov bl,al
            sub  bl,30h
             
            cmp bl,1
            je booked
             
            cmp bl,2
            je booked  
 
            cmp bl,3
            je booked             
 
            cmp bl,4
            je booked 
             
 
            call er
            jmp stop
            
            ret
    
          Sceintific  endp 
;********************************************************************************          
    drama proc near
    
            lea dx,msgD  ;display drama messege
            mov ah,09h
            int 21h
            
            lea dx,ABooks
            mov ah,09h
            int 21h
                        
            lea dx,msg1d
            mov ah,09h
            int 21h
             
            lea dx,msg2d
            mov ah,09h
            int 21h
             
            lea dx,msg3d
            mov ah,09h
            int 21h
             
            lea dx,msg4d
            mov ah,09h
            int 21h
             
            lea dx,choisBook
            mov ah,09h
            int 21h
             
            mov ah,01h   ;accept the choise
            int 21h
            mov bl,al
            sub  bl,30h
             
            cmp bl,1
            je booked
             
            cmp bl,2
            je booked  
 
            cmp bl,3
            je booked             
 
            cmp bl,4
            je booked 
             
 
            call er
            jmp stop
            
            ret
    
    drama endp 
;********************************************************************************    
    horror proc near
    
            lea dx,msgH  ;display horror messege
            mov ah,09h
            int 21h
            
            lea dx,ABooks
            mov ah,09h
            int 21h
            
            lea dx,msg1h
            mov ah,09h
            int 21h
             
            lea dx,msg2h
            mov ah,09h
            int 21h
             
            lea dx,msg3h
            mov ah,09h
            int 21h
             
            lea dx,msg4h
            mov ah,09h
            int 21h
             
            lea dx,choisBook
            mov ah,09h
            int 21h
             
            mov ah,01h   ;accept the choise
            int 21h
            mov bl,al
            sub  bl,30h
             
            cmp bl,1
            je booked
             
            cmp bl,2
            je booked  
 
            cmp bl,3
            je booked             
 
            cmp bl,4
            je booked 
             
 
            call er
            jmp stop
            
            ret
     horror endp
;********************************************************************************     
     comedybooks proc near
     
            lea dx,msgC  ;display COMEDY messege
            mov ah,09h
            int 21h
            
            lea dx,ABooks
            mov ah,09h
            int 21h
            
            lea dx,msg1c
            mov ah,09h
            int 21h
             
            lea dx,msg2c
            mov ah,09h
            int 21h
             
            lea dx,msg3c
            mov ah,09h
            int 21h
             
            lea dx,msg4c
            mov ah,09h
            int 21h
             
            lea dx,choisBook
            mov ah,09h
            int 21h
             
            mov ah,01h   ;accept the choise
            int 21h
            mov bl,al
            sub  bl,30h
            mov cx,4
             
            cmp bl,1
            je booked 
             
            cmp bl,2
            je booked  
 
            cmp bl,3
            je booked             
 
            cmp bl,4
            je booked 
             
            call er
            ret
            jmp stop
             
      comedybooks endp
;********************************************************************************      
    
    compare proc near ; compare procedure
    .386
             cmp bl,1        
             je c      ;comedy
                
             cmp bl,2
             je b       ;blackComedy
             
             cmp bl,3
             je d        ;drama
             
             cmp bl,4
             je h       ;horror
             
             cmp bl,5
             je l       ;classic
              
             cmp bl,6
             je f       ;fictional
             
             cmp bl,7
             je s      ;sceintific
             
             cmp bl,8   ;back
             je back
              
             cmp bl,9   ;quit
             je  quit
             
             cmp bl,0   ;reccomendation
             je  recommend
             
             cmp bl,x     ;error
             jne error
             
             ret
    compare endp
;********************************************************************************    
    displayMessege proc near   ;display procedure

            lea dx,msg2  ;display book messege
            mov ah,09h
            int 21h
         
            lea dx,msgC  ;display COMEDY messege
            mov ah,09h
            int 21h

            lea dx,msgB  ;display BLACK COMEDY messege
            mov ah,09h
            int 21h
            
            lea dx,msgD  ;display DARAMA messege
            mov ah,09h
            int 21h
            
            lea dx,msgH  ;display horror messege
            mov ah,09h
            int 21h
            
            lea dx,msgL  ;display classic messege
            mov ah,09h
            int 21h
            
            lea dx,msgF  ;display fictional messege
            mov ah,09h
            int 21h
            
            lea dx,msgS  ;display scientific messege
            mov ah,09h
            int 21h
            
            lea dx,Backmsg  ;display back messege
            mov ah,09h
            int 21h
            
            lea dx,quitmsg   ;display quit messege
            mov ah,09h
            int 21h
            
            lea dx,recmsg     ;display recommendation messege
            mov ah,09h
            int 21h
            
            lea dx,msg3  ;display book messege
            mov ah,09h
            int 21h
         
            RET
    displayMessege endp
end main       
;********************************************************************************
;procedures 
;-----------
;1-display messege
;2-compare
;3-books (comedy -blackcomedy-horror-classic-ficitional-sceintific-drama)
;4-back
;5-error
;main (far)
;----------------------------------------------------------------------
;labels
;-------
;c:comedy
;b:blackcomedy
;h:horro
;l:classic
;f:ficitional
;s:sceintific
;d:drama
;er:error
;quit
;recommend
;booked
