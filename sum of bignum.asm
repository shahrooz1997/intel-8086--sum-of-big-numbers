;sum of bignum  
; by ShahroOz
; HELP:
;    The numbers must be in little endian
;    mode. N must be the length of the two
;    numbers and the length of the result 
;    must be N+1

data segment
    N dw 2
    adad1 dw 919dh,948fh
    adad2 dw 919dh,949fh
    result dw 3 dup(?)
data ends

stack segment
    mystack db 100 dup(?)
stack ends

myprog segment
    main proc far
        assume cs: myprog, ds: data, ss: stack
        mov ax, data
        mov ds, ax
        lea sp, mystack+100
        
        clc
        mov cx, N
        ;[si]+[bx]->[di]
        lea si, adad1
        lea bx, adad2
        lea di, result   
        
 loop1: mov ax, [si]
        adc ax, [bx]
        mov [di], ax
        inc si
        inc si
        inc bx
        inc bx
        inc di
        inc di
        loop loop1
        
        mov cx, 3
        lea di, result
       
 loop2: mov ax, [di] 
        add di, 2
        loop loop2
        
        
        hlt
        
    main endp
    
    
    
myprog ends  
        end main
