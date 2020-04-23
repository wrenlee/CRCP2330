//Wren Lee assembler
//crcp 2330 - nand 2 tetris

//variables
String file;

Parser p;

void setup() {
  file = "MaxL";
  file = file + ".asm"; //creates file
  
  p = new Parser(file);
}//end setup

void draw() {
  p.readFile();
}//end draw
