//Wren Lee assembler
//crcp 2330 - nand 2 tetris

//variables
String file;

Parser p;

StringList allComp;
StringList allDest;
StringList allJump;

void setup() {
  file = "MaxL";
  file = file + ".asm"; //creates file
  
  allComp = new StringList();
  allDest = new StringList();
  allJump = new StringList();
  
  p = new Parser(file);
}//end setup

void draw() {
  p.readFile(); //adds strings to string list
  p.analyzeFile();
}//end draw
