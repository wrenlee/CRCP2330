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

//a register for register itself
//m for the word contained IN the register

(LOOP)
@8191 //(256 rows * 512 pixels per row) / 16 = number of 16 bit pixels minus one because 16384 + 8191 is the same as keyboard register
D = A
@R0 //counter
M = D

@KBD //keyboard
D = M //calls keyboard values from keyboard address
@BLACKOUT
D; JNE //if d = 1 aka key is pressed
//@BLACKOUT
@WHITEOUT
D; JEQ //if d = 0 aka no key is pressed
//@LOOP
//0; JMP //loops to the top and checks again

//black out
(BLACKOUT)
(DRAWA)
@R0
D = M //pulls counter
@SCREEN //address 16384
D = D + A //counter + 16384
A = D //sets the addition to the address
M = -1 //puts -1 into register (-1 is all 1s)
@R0
M = M - 1 //decrease counter by one
D = M
@DRAWA
D; JGE //if not all the pixels are filled
@LOOP
0; JMP //loop to the top to always check keyboard

//white out
(WHITEOUT)
(DRAWB)
@R0
D = M
@SCREEN
D = D + A 
A = D
M = 0
@R0
M = M - 1
D = M
@DRAWB
D; JGE
@LOOP
0; JMP