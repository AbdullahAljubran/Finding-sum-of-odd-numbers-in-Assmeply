[ORG 0x100]
    jmp start
num:    dw    10,20
sum:    dw    0


incr:  add si,1
       jmp again1


increment:
       add cx,1
       mov ax,cx
       jmp comp

result:
       add [sum],ax
       jmp increment

again: mov si,2
again1:mov ax,cx
       cmp si,ax
       je  result
       mov dx,0
       div si
       cmp dx,0
       jne incr
       je  increment

start: mov ax,[num]
       mov bx,[num+2]
       mov cx,ax
       cmp ax,1
       je  increment
comp:  cmp ax,bx
       jne again
       je  end

end:      mov ax,0x4c00
      int 0x21
