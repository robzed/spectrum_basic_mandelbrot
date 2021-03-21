5 DIM p,q,t,x,y,x2,y2,r,c as FIXED
10 CLS:DIM a$(81):FOR i=1 TO 81:LET a$(i)=CHR$(32+i):NEXT i:LET a$(80)=" "
20 LET p=3/31: LET q=2/21
30 FOR r=-1 TO 1 STEP q: FOR c=-2 TO 1 STEP p
40 LET x=0: LET y=0: LET i=1
50 LET x2=x*x: LET y2=y*y
60 IF x2+y2>4 OR i>70 THEN GOTO 80
70 LET t=x2-y2+c:LET y=2*x*y+r:LET x=t:LET i=i+1:GOTO 50
80 PRINT PAPER 7-i/10;a$(i);
90 NEXT c: NEXT r

