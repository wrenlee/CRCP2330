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
StringList allLabels;

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
  allLabels = new StringList();

  s.predefinedSymbols(); //predefined symbols
}//end setup

void initStrings() {
  //gets stringlists from parser to put into code and symbols classes
  allDest = p.dest();
  allComp = p.comp();
  allJump = p.jump();
  allTypes = p.types();
  allA = p.aInstruct();
  allLines = p.lines();
  allLabels = p.labels();
}//init strings

void draw() {
  p.readFile(); //adds strings to string list
  p.analyzeFile(); //takes out comments, analyzes a/label/c, determine comp/dest/jump

  initStrings(); //initializes all of the stringlists

  firstPass();
  s.printTable();
  //secondPass();
  //s.printTable();
  //println("--------------------");

  //code();

  //c.checkCode();

  //writeToFile();
}//end draw

void firstPass() {
  String labelName = ""; //label name
  //int rom = 0;
  for (int i = 0; i < allLabels.size(); i++) {
    println(i);
    //println(allTypes.get(i));
    //println(i);
    if (allLabels.get(i) != null) {
      //println("True");
      labelName = allLabels.get(i); //get label name
      //println(i+1 + " " + labelName);
      s.addSymbol(labelName, i+1); //add label name and ROM address
    }//if it's a label
    //else if (allTypes.get(i) == "a" || allTypes.get(i) == "c"){
    //  rom++;
    //}
  }//loop through lines
  println("Pass!");
}//first pass

void secondPass() {
  for (int i = 0; i < allTypes.size(); i++) {
    if (allTypes.get(i) == "a") {
      if (s.hasSymbol(allA.get(i)) == false) {
        //println("NEW! " + allA.get(i));
        s.addSymbol(allA.get(i));//add symbol
      }//if the symbol isn't there
      else {
        // println("Old " + allA.get(i));
        String newAddress = s.getAddress(allA.get(i));
        allA.set(i, newAddress); //add symbol
        // println("New add " + newAddress);
      }//if the symbol is there
    }//if it's an a command
  }//for loop through all lines
}//second pass

void code() {
  c.init(allTypes, allComp, allDest, allJump, allA); //initizalies stringlists in code class
  c.decode();
}//code

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
