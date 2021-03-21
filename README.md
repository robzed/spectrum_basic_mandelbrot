# Introduction

Sinclair ZX Spectrum BASIC mandelbrot (in 10 lines or less)

Prints a Mandelbrot as characters. Since calculating the Mandelbrot is quite intensive for an 8-bit machine, and the ZX Spectrum is a 1980's computer, this 

Originally started for the BASIC 10 Liner contest https://gkanold.wixsite.com/homeputerium/rules2021

![Image of Mandelbrot](images/overview.png)


# Running the Fast version

Load the file 'Mandelbrot_fast.tzx'. It is set to Auto-run.

The fast version is always up to date - we create the slow Sinclair BASIC version after working on the fast version.


# Compiling the Fast version

This uses Boriel's ZXBasic compiler: https://zxbasic.readthedocs.io/en/latest/archive/  We suggest you get it from here to get the latest version - although you can install an older version using pip. 

The command line we use to compile it to a tape file is:

../zxbasic/zxbc.py Mandelbrot_fast.bas  --tzx --BASIC --autorun --string-base=1 -O2


# Loading the slow Sinclair BASIC version:

Use either the tape (tzx) or the snapshot (szx) versions in an emulator, for example Fuse. The snapshot is a Spectrum 128K image, but the tape should load into a 48K or 128K machine. It shouls also load into a Spectrum Next - although this hasn't been tested.

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
 * Multiple statements on each line

_insert more details here_


# Formatted and Commented Source Code

5 DIM p,q,t,x,y,x2,y2,r,c as FIXED    ' define 
10 cls
   DIM a$(81)
   FOR i=1 TO 81
      LET a$(i)=CHR$(32+i)            ' fill a character string array with different characters for printing
   NEXT i
   LET a$(80)=" "                     ' redundant - previously deep spaces would be a space
20 LET p=3/31
   LET q=2/21
30 FOR r=-1 TO 1 STEP q               ' rows, or the 'y' axis of the screen, stepped in the equation domain
   FOR c=-2 TO 1 STEP p
40 LET x=0
   LET y=0
   LET i=1                            ' iteration depth - this is what forms the pattern
50 LET x2=x*x
   LET y2=y*y
60 IF x2+y2>4 OR i>70 THEN GOTO 80
70 LET t=x2-y2+c
   LET y=2*x*y+r
   LET x=t
   LET i=i+1
   GOTO 50
80 PRINT PAPER 7-i/10;a$(i);
90 NEXT c
   NEXT r


