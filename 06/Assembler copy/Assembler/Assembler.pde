/*Wren Lee 
 module 6 - assembler
 crcp 2330 - nand 2 tetris
 
 to get started with the assembler, first name your file in the void setup()
 */

//variables
String file, fileAsm;
PrintWriter writer;

Parser p;
Parser p2;
Code c;
Symbols s;

StringList binary;

void setup() {
  file = "RectL"; 
  fileAsm = file + ".asm"; //creates file

  p = new Parser(fileAsm);
  p2 = new Parser(fileAsm);
  c = new Code();
  s = new Symbols();

  //init stringlists
  binary = new StringList();

  s.predefinedSymbols(); //predefined symbols

  noLoop();
}//end setup

void draw() {
  p.readFile(); //adds strings to string list

  firstPass();
  secondPass();
  //s.printTable();

  writeToFile();
}//end draw

void firstPass() {
  String labelName = ""; //label name
  int rom = 0;
  while (p.hasMoreCommands()==true) {
    p.advance();
    if (p.currentString().startsWith("//") == false && p.currentString().isEmpty() == false) {
      if (p.currentType() == "l") {//if it's a label
        int length = p.currentString().length();
        labelName = p.currentString().substring(1, length-1);//get label name w/o parenthesis
        s.addSymbol(labelName, rom); //add label name and ROM address
      }//if it's a label
      else {
        rom++;
      }//if it's a or c command
    }//not comment or empty space
  }//has more commands
}//first pass

void secondPass() {
  p2.readFile(); //adds strings to string list
  int ram = 16; 
  while (p2.hasMoreCommands()==true) {
    p2.advance();
    if (p2.currentString().startsWith("//") == false && p2.currentString().isEmpty() == false) {

      if (p2.currentType() == "a") {
        int length = p2.currentString().length();
        String aCommand = p2.currentString().substring(1, length);//takes out the @ symbol
        String address = "";
        if(isNum(aCommand) == true){
          address = aCommand;
        }//if it's a number
        else if (s.hasSymbol(aCommand) == false) {
          s.addSymbol(aCommand, ram);//add symbol
          address = Integer.toString(ram);
          ram++; //increase ram
        }//if the symbol isn't there
        else {
          address = s.getAddress(aCommand);
        }//if the symbol is there
        binary.append(c.aToBinary(address));
      }//a command

      else if (p2.currentType() == "c") {
        //break line up into comp dest and jump
        String[] tempStr = new String[3];
        String comp = "";
        String dest = "";
        String jump = "";
        if (p2.currentString().contains("=")==true) { //dest = comp
          tempStr = p2.currentString().split("=");
          dest = tempStr[0];
          comp = tempStr[1];
        }//comp + dest
        else {
          dest = "0";
        }//if there is no dest
        if (p2.currentString().contains(";")==true) {//comp;jump
          tempStr = p2.currentString().split(";");
          comp = tempStr[0];
          jump = tempStr[1];
        }//comp + jump
        else {
          jump = "0";
        }//if there is no jump
        //println(p2.currentString() + " -> comp " + comp + " dest " + dest + " jump " + jump);
        binary.append(c.cToBinary(comp, dest, jump));
      }//c command
    }//not comment or empty space
  }//has more commands
}//second pass

boolean isNum(String str){
  //println(str);
    //code from https://www.baeldung.com/java-check-string-number
    if(str == null){
      return false;
    }//if empty
    try{
      int address = Integer.parseInt(str);
    }//try
    catch(NumberFormatException nfe){
      return false;
    }//catch
    return true;
  }//is num

void writeToFile() {
  String finalFile = file;
  finalFile = finalFile + ".hack";
  writer = createWriter(finalFile);

  for (int i = 0; i < binary.size(); i++) {
    writer.println(binary.get(i)); //adds codes to writer
  }//for loop 

  writer.flush(); 
  writer.close();
  println("Your " + finalFile + " file is made!");
}//write to file
