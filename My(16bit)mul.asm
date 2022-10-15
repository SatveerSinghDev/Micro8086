.model small  
 .data        
 a dw 1111H  
 b dw 1221H  
 .code  
      mov      ax, @data     
      mov      ds, ax  
      mov      ax, a            
      mov      bx, b            
      mul      bx               
      mov      si, ax  
      mov      bx, dx           
      mov      dh, 2  
 l1:  mov      ch, 04h       
      mov      cl, 04h            
 l2:  rol      bx, cl         
      mov      dl, bl           
      and      dl, 0fH          
      cmp      dl, 09           
      jbe      l4  
      add      dl, 07           
 l4:  add      dl, 30H  
      mov      ah, 02           
      int      21H  
      dec      ch               
      jnz      l2  
      dec      dh  
      cmp      dh, 0  
      mov      bx, si       
      jnz      l1  
      mov      ah, 4cH          
      int      21H  
      end
