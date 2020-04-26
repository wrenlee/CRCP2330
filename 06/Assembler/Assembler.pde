//Wren Lee assembler
//crcp 2330 - nand 2 tetris

//variables
String file;

Parser p;
Code c;

StringList allComp;
StringList allDest;
StringList allJump;
StringList allTypes;
StringList allA;

void setup() {
  file = "MaxL";
  file = file + ".asm"; //creates file

  p = new Parser(file);
  c = new Code();

  //init stringlists
  allComp = new StringList();
  allDest = new StringList();
  allJump = new StringList();
  allTypes = new StringList();
  allA = new StringList();
}//end setup

void draw() {
  p.readFile(); //adds strings to string list
  p.analyzeFile(); //takes out comments, analyzes a/label/c, determine comp/dest/jump
  
  initCode();

  c.init(allTypes, allComp, allDest, allJump, allA); //initizalies stringlists in code class
  c.decode();
}//end draw

void initCode() {
  //gets types, comp, dest, jump
  allDest = p.dest();
  allComp = p.comp();
  allJump = p.jump();
  allTypes = p.types();
  allA = p.aInstruct();
}//init code
