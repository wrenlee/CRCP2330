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

@R2
M = 0 //sets total to 0 just in case

@R1
D = M
@LOOP
D; JGT //tests to see if r1 has values in it or not

(START)
(LOOP)
@R0
D = M //calls up r0 to be added in the data register
@R2
M = D + M //adds r0 to prod value
@R1
D = M //sets memory value to d
D = D - 1 //decreases r1 (n)
M = D
@END
D; JEQ //go to end if r1 is 0
@LOOP
D; JGT //if data register (d) is greater than 0 (i > n), jump to loop it again

//(END)
//@END
//0; JMP //terminate program through loop to end constantly