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
//call r2 @r2
//set d to r2 d = r2

//r0 value to add by
//r1 counter value
//r2 product

@prod
M = 0 //sets total to 0

@R1
D = M
@counter
M = D //sets counter to r1

(LOOP)
@counter
D = M
@END
D;JEQ //checks to see if counter is 0

@R0
D = M //calls up r0 to be added in the data register

@prod
M = M + D //adds r0 to prod value

@counter
M = M - 1 //decreases counter

@LOOP
0; JMP //loop to top
//loop ends

(END)
@prod
D = M
@R2
M = D //setting product to r2