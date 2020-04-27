//Wren Lee assembler
//crcp 2330 - nand 2 tetris

//variables
String file;

Parser p;
Code c;
Symbols s;

StringList allComp;
StringList allDest;
StringList allJump;
StringList allTypes;
StringList allA;
StringList allLines;

void setup() {
  file = "MaxL";
  file = file + ".asm"; //creates file

  p = new Parser(file);
  c = new Code();
  s = new Symbols();

  //init stringlists
  allComp = new StringList();
  allDest = new StringList();
  allJump = new StringList();
  allTypes = new StringList();
  allA = new StringList();
  allLines = new StringList();
}//end setup

void initStrings() {
  //gets types, comp, dest, jump
  allDest = p.dest();
  allComp = p.comp();
  allJump = p.jump();
  allTypes = p.types();
  allA = p.aInstruct();
  allLines = p.lines();
}//init strings

void draw() {
  p.readFile(); //adds strings to string list
  p.analyzeFile(); //takes out comments, analyzes a/label/c, determine comp/dest/jump

  initStrings(); //initializes all of the stringlists

  s.predefinedSymbols(); //predefined symbols
  s.firstPass(allLines);

  c.init(allTypes, allComp, allDest, allJump, allA); //initizalies stringlists in code class
  c.decode();
}//end draw
