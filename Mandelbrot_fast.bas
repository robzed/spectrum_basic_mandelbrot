5 DIM p,q,t,x,y,x2,y2,r,c,d,e,g,h as FIXED:DIM z,f,w,k as Integer:DIM v as Byte
10 DIM a$(81):FOR i=1 TO 81:LET a$(i)=CHR$(32+i):NEXT i
20 LET d=-1: LET e=1: LET g=-2: LET h=1: LET z=22528:LET f=0
30 LET p=(h-g)/31:LET q=(e-d)/21:CLS:FOR r=d TO e STEP q: FOR c=g TO h STEP p
40 LET x=0: LET y=0: LET i=1
50 LET x2=x*x: LET y2=y*y: IF x2+y2>4 OR i>70 THEN GOTO 80
60 LET l$=INKEY$:IF l$<>"" THEN 
 LET k=CODE l$:LET w=PEEK (z+f):
 'print w;" ";
 LET w=((w>127)*(w-128))+(w<128)*w:
 'print " ";w;" k";k;" ";
  'print w
 POKE z+f,w:
 LET v=(k=56)-(k=53)+32*((k=54)-(k=55))
 LET f=f+v:
 'print f;" ";k=56;k=53;k=54;k=55;">";v
 LET f=(f>=0 AND f<768)*f:
 LET w=PEEK(z+f):
 POKE z+f,w+128:
 'print ">";f;"<"
 PAUSE 20
 ' TODO: have a way of zooming or unzooming (unzooming could be a cycle)
 ' set the  (p & q)
 ' set the start/ ends (d & e, g, h)
 ' cls, then restart the for loops
 IF l$=" " THEN GOTO 30
 ENDIF
70 LET t=x2-y2+c:LET y=2*x*y+r:LET x=t:LET i=i+1:GOTO 50
80 PRINT PAPER 7-i/10;a$(i);:NEXT c:NEXT r


