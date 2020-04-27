/*Wren Lee 
 module 6 - assembler
 crcp 2330 - nand 2 tetris
 
 to get started with the assembler, first name your file in the void setup()
 */

//variables
String file, fileAsm;
PrintWriter writer;

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
  file = "Max"; //STEP 1: NAME YOUR FILE
  fileAsm = file + ".asm"; //creates file

  p = new Parser(fileAsm);
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
  //gets stringlists from parser to put into code and symbols classes
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

  //s.predefinedSymbols(); //predefined symbols
  //s.firstPass(allLines, allTypes);

  c.init(allTypes, allComp, allDest, allJump, allA); //initizalies stringlists in code class
  c.decode();

  writeToFile();
}//end draw

void writeToFile() {
  String finalFile = file;
  finalFile = finalFile + ".hack";
  writer = createWriter(finalFile);

  StringList finalBinary = new StringList();

  finalBinary = c.export(); //set final binary codes from code to stringlist

  for (int i = 0; i < finalBinary.size(); i++) {
    writer.println(finalBinary.get(i)); //adds codes to writer
  }//for loop 

  writer.flush(); 
  writer.close();
  println(finalFile + " is published!");
}//write to file
