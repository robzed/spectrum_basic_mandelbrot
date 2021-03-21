5 DIM p,q,t,x,y,x2,y2,r,c as FIXED:DIM z,f as UInteger:DIM w,k as UByte
10 CLS:DIM a$(81):FOR i=1 TO 81:LET a$(i)=CHR$(32+i):NEXT i:LET a$(80)=" "
20 LET p=3/31:LET q=2/21:LET z=22528:LET f=0
30 FOR r=-1 TO 1 STEP q: FOR c=-2 TO 1 STEP p
40 LET x=0: LET y=0: LET i=1
50 LET x2=x*x: LET y2=y*y: IF x2+y2>4 OR i>70 THEN GOTO 80
60 LET l$=INKEY$:IF l$<>"" THEN 
 LET k=CODE l$:LET w=PEEK z+f:
 'print w;" ";
 LET w=((w>127)*(w-128))+(w<128)*w:
 'print " ";w;" k";k;" ";
  'print w
 POKE z+f,w:
 LET f=f+(k=56)-(k=53)+32*((k=54)-(k=55)):
 'print f;
 LET f=(f>=0 AND f<768)*f:
 POKE z+f,w+128:
 'print ">";f;"<"
 PAUSE 10
 ENDIF
70 LET t=x2-y2+c:LET y=2*x*y+r:LET x=t:LET i=i+1:GOTO 50
80 PRINT PAPER 7-i/10;a$(i);:NEXT c:NEXT r


