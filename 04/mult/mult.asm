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

//variables for counter (i) and prod and n (r1)
//@i
//M = 0 //sets i to 0
@prod
M = 0 //sets prod which will hold product to 0
@R1
D = M //sets memory pull from r1 to data register
@n
M = D //puts data register into memory of n variable
//now i = 0, prod = 0, n = r1

(LOOP)
@R0
D = M //calls up r0 to be added in the data register
@prod
M = D + M //adds r0 to prod value
//@i
//D = D + 1 //increment i
@n
D = D - 1 //decreases n
@LOOP
D; JEQ //if data register (aka n) is equal to 0, jump to loop


@prod
D = M //sets memory of prod to the data register
@R2 
M = D //pushes product into the r2 slot

(END)
@END
0; JMP //terminate program through loop to end constantly