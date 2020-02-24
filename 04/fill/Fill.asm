// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

//@keyboard
//(KEYLOOP) if the m is equal to 0
//if it's 1 (meaning the key is pressed, then go to the next)
//(screenLoop) to go through all the pixels
//sCounter for the 

(BEGIN)
@SCREEN
D = A //pulls the address register since the screen is a whole register by itself
@pixel //individual pixel variable
M = D

(LOOP)
@KBD //keyboard
D = M
@WHITEOUT
D; JEQ //if m is = 0
@BLACKOUT
D; JGT //m = 1

//black out
(BLACKOUT)
@pixel
M = -1 //black
@NEXTLINE
0;JMP //always jump

//white out
(WHITEOUT)
@pixel
M = 0 //white
@NEXTLINE
0;JMP

(NEXTLINE)
@pixel
D = M + 1 //increment pixel
M = D
@KBD
D = A - D //cycle through next keyboard bit
@BEGIN
D; JEQ
@LOOP
0;JMP //loop to the top