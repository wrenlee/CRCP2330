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
//variables: scr (screen counter), counter (number of 16 bit words in screen)
@SCREEN //address 16384, creates scr variable that holds the 16 bit word
D = A 
@scr //screen counter variable
M = D  //sets screen address to screen variable

@8192 //(256 rows * 512 pixels per row) / 16 = number of 16 bit pixels
D = A //setting the address of 8192 to the data register
@counter //create counter to the number of pixels to be changed
M = D //setting the data register to the memory register of counter variable

@KBD //keyboard
D = M //calls keyboard values from keyboard address

@BLACKOUT
D; JNE //if d = 1 aka key is pressed
@WHITEOUT
D; JEQ //if d = 0 aka no key is pressed

//black out
(BLACKOUT)
@pixel
M = -1 //black all 1s in binary = -1
@DRAW
0;JMP //always jump

//white out
(WHITEOUT)
@pixel
M = 0 //white
@DRAW
0;JMP //always jump

(DRAW)
@pixel
D = M //calls pixel with the black or white value
@scr
M = D //resets pixel value into the screen
@scr
A = A + 1 //advances scr to the next 16 bit word

@counter //counter
M = M - 1 //decrease counter by one

@DRAW
M; JGT //if not all the pixels are filled

@LOOP
0;JMP //loop to the top to always check keyboard