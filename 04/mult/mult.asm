// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

//load ro @r0
//create variable of product @Prod
//loop through until r1 is met to add r0 multiple times 
//counter variable
//(d = d + a)
//call r2 @r2
//set d to r2 d = r2

@R0 //call up address 0
D = M //data register now contains the value of the memory register

//variables for counter (i) and sum
@i
M = 0
@sum
M = 0

(LOOP)
@i
D = M
@n
D = D - M



@prod
D = M //sets memory of prod to the data register

0; JMP //terminate program through loop