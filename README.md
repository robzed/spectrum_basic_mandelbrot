# Mandelbrot Explorer for the Sinclair ZX Spectrum

A character-based Mandelbrot explorer in BASIC (in 10 lines or less!!)

Prints a Mandelbrot as characters. Since calculating the Mandelbrot is quite intensive for an 8-bit machine, and the ZX Spectrum is a 1980's computer, this takes some time to execute and complete.

Originally started for the BASIC 10 Liner contest https://gkanold.wixsite.com/homeputerium/rules2021

![Image of Mandelbrot](images/overview.png)

# Keys

5-6-7-8 for moment (7=Up, 5=Left, 6=Down, 8=Right) (not shifted)

Space bar for zoom - 1x, 2x, 4x (then resets to 1x)


# Running the Fast version

Load the file 'Mandelbrot_fast.tzx'. It is set to Auto-run.

The fast version is always up to date - we create the slow Sinclair BASIC version after working on the fast version.


# Compiling the Fast version

This uses Boriel's ZXBasic compiler: https://zxbasic.readthedocs.io/en/latest/archive/  We suggest you get it from here to get the latest version - although you can install an older version using pip. 

The command line we use to compile it to a tape file is:

../zxbasic/zxbc.py Mandelbrot_fast.bas  --tzx --BASIC --autorun --string-base=1 -O2 --strict-bool --strict

## Command Line Options

The string-base is required so that the Sinclair BASIC match. The strict bool so we can use bool in complex expressions like Sinclair BASIC.


# Loading the slow Sinclair BASIC version:

Use either the tape (tzx) or the snapshot (szx) versions in an emulator, for example Fuse. The snapshot is a Spectrum 128K image, but the tape should load into a 48K or 128K machine. It should also load into a Spectrum Next - although this hasn't been tested.

For the snapshot (szx), you will need to type 'RUN' after loading the program. The tape file (tzx) will auto run (it was saved with SAVE "Mandel" LINE 0).

This Spectrum BASIC version is slow - the compiled version is better.


# Source code and notes between the slow and fast versions.

Both the Fast and the Sinclair BASIC versions have the same code except for line 5, which defines the variables for the compiler.

The fast version uses fixed point numbers rather than floating point, and due to this the display is very slightly different. 


# About the Authors

Written by Kenny Osborne and Rob Probin, March 2020. We both live in Scotland, with the largest big city being
Glasgow. We are both software engineers who like playing with various technologies outside of our day jobs. 
Rob's second computer (after the the ZX81) was the Sinclair ZX Spectrum 48K, which he used for years before
moving to 16-bit computers. 


# Acknowledgements

 * Based on the Wikipedia article here: https://en.wikipedia.org/wiki/Mandelbrot_set, with the idea of using ASCII characters from a stackoverflow post here: https://stackoverflow.com/questions/811074/what-is-the-coolest-thing-you-can-do-in-10-lines-of-simple-code-help-me-inspir

 * Thanks to Boriel for the BASIC compiler https://github.com/boriel/zxbasic

 * Thanks to http://angrydill.com/wasd/ for showing the impossible is possible. Also for the key movement idea.

# 'Minified' Source Code

The contest specifies restrictions for source - but no major tricks have been used. It depends whether you count ASCII version or the Sinclair version how many characters. But the text complies with x characters per line. The following items have compressed the source slightly:

 * One letter variable names.(No conflicts between integer and string to support compiler).
 * Movement is an expression not IF string compares.
 * Multiple statements on each line.

_insert more details here_


# Formatted and Commented Source Code

NOTE: The single line if's have been split across lines. This is NOT 
compilable in ZXBASIC because you'd need ENDIFs adding - this is just for ease of commenting

```
5  DIM p,q,t,x,y,x2,y2,r,c,d,e,g,h as FIXED: ' define variables only for basic not Sinclair basic 
   DIM z,f,w,k as Integer:
   DIM v,m as Byte

10 DIM a$(81):
   FOR i=1 TO 81:
       LET a$(i)=CHR$(32+i): ' fill a character string array with different characters for printing
   NEXT i:
   CLS:
   LET l$=";"

20 LET d=-1: 
   LET e=1: 
   LET g=-2: 
   LET h=1: 
   LET z=22528:
   LET f=0:
   LET m=0

30 PRINT AT 0,0;:
   LET p=(h-g)/31:
   LET q=(e-d)/21:
   IF m=3 THEN GOTO 10

40 FOR r=d TO e STEP q: ' rows, or the 'y' axis of the screen, stepped in the equation domain
   FOR c=g TO h STEP p: 
     LET x=0: 
     LET y=0: 
     LET i=1 ' iteration depth - this is what forms the pattern

50 LET x2=x*x: 
   LET y2=y*y: 
   IF x2+y2>4 OR i>70 THEN GOTO 80

60 LET o$=l$: 
   LET l$=INKEY$:IF l$<>"" AND o$<>l$ THEN
 LET k=CODE l$:LET w=PEEK (z+f):
 LET w=((w>127)*(w-128))+(w<128)*w:
 POKE z+f,w:
 LET v=(k=56)-(k=53)+32*((k=54)-(k=55))
 LET f=f+v:
 LET f=(f>=0 AND f<768)*f:
 LET w=PEEK(z+f):
 POKE z+f,w+128:
 IF l$=" " THEN 
 LET m=m+1:

  ' set the  (p & q) ... these are the half the zoomed value (50%)
  ' NOTE p & q will be reset after the GOTO
  LET p=(h-g)/4:
  LET q=(e-d)/4:

 ' set the start/ ends (d & e, g, h)
 ' convert f into height and width ... x and y will be reset afterwards
 LET y=INT(f/32):LET x=(f-(y*32))
 LET x=g+x*(h-g)/32
 LET x=g+(f-(y*32))*(h-g)/32:
 LET y=d+y*(e-d)/22:
 LET d=y-q:LET e=y+q:LET g=x-p:LET h=x+p
 GOTO 30
 ENDIF
 ENDIF
70 LET t=x2-y2+c:LET y=2*x*y+r:LET x=t:LET i=i+1:GOTO 50
80 PRINT PAPER 7-i/10;a$(i);:NEXT c:NEXT r: GOTO 30

```

## Variable list

The variables are shortened - which doesn't help with meaningfuul names. Here is a list of variables and their usage:

```
d  = start y coordinate in mandelbrot domain 
e  = end y coordinate in mandelbrot domain
g  = start x coordinate in mandelbrot domain 
h  = start x coordinate in mandelbrot domain 
i  = iteration depth 
p  = mandelbrot domain step for x for every coloum on screen
q  = mandelbrot domain step for y for every coloum on screen
t  = temporary used in calculations for new x and old x can be used in y calculation 
x  = used to calculate mandelbrot 
y  = used to calculate mandelbrot 
x2 = x squared to reduce calcutions
y2 = y squared to reduce calcutions
r  = screen row (y)
c  = screen column (x) 
z  = colour attribute start address
f  = screen postion between 0 and 767
w  = colour attribute byte 
k  = key code
v  = movement ofset
a$ = screen characters to be printed based on depth
o$ = old key string 
l$ = new key string

```

# Future enhancements
 - Make it back to 10 lines, 256 long.
 - Write description above
 - Get Sinclair version working
 - Submit to contest
 - Expand the colours 
 - Allow zoom levels of more than 2x
 - Support shifted 5678 and/or WASD/wasd
 - Support held key repeat for movement keys

