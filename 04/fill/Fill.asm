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
//sCounter


(LOOP)
@KBD //keyboard
D = M //calls keyboard values

@BLACKOUT
D; JNE //if d = 1 aka key is pressed
@WHITEOUT
D; JEQ //else

//black out
(BLACKOUT)
@R0
M = -1 //black
@DRAW
0;JMP //always jump

//white out
(WHITEOUT)
@R0
M = 0 //white
@DRAW
0;JMP

(DRAW)
@8192 //number of pixels to be colored white or black (256 rows * 512 pixels per row) / 16
D = A //setting the address of 8191 to the data register
@counter //create counter to the number of pixels to be changed by using register 1
M = D //setting the data register to the memory register of counter variable

(CONTINUE)
@counter
D = M //calling the counter
@position
M = D //setting the counter's value to the position
@SCREEN //calls screen address
D = A //sets the address of the screen 
@position
M = M + D //adds the current position to the screen

@R0
D = M //calls pixel with the black or white value
@position
//A = M 
M = D //sets the position to be the color the pixel

@counter //counter
M = M - 1 //decrease counter by one

@CONTINUE
M; JGE //if counter is greater than or equal to 0 so not all the pixels are filled

@LOOP
0;JMP //loop to the top