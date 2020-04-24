//parser class
//contains buffered reader which reads file line by line
//analyzes what type of line it is, discards comments

class Parser {
  BufferedReader reader;
  String line;
  boolean skipLine;
  boolean hasNextLine;
  char type;
  String comp, dest, jump;

  Parser(String file) {
    reader = createReader(file); //create reader file
    hasNextLine = true;
    skipLine = false;
    comp = "";
    dest = "";
    jump = "";
  }//constructor

  void readFile() {
    try {
      line = reader.readLine();
      //cleanLine();
      if (skipLine == false && hasNextLine == true) {
        commandType();//determines command type
      }//if it's not a comment and there's another line
    }//end try

    catch(IOException e) {
      e.printStackTrace();
      hasNextLine = false;
    }//catch 
    println(line + " --> " + type + " --> " + getSymbol());
  }//end read file

  void cleanLine() {//take out white space and comments
    if (line.contains("//")) {
      String[] tempStr = new String[10];
      tempStr = line.split("/"); //splits comment
      tempStr[1] = ""; //replaces the comment part with an empty string
      line = tempStr.toString(); //makes it into a string
    }//comments
    if (line.length() == 0) {
      skipLine = true;
    }//empty line
  }//clean line end

  void commandType() {
    if (line.contains("@")) {
      type = 'a';
    }//a instruction
    else if (line.contains("(")) {
      type = 'l';
    }//label
    else {
      type = 'c';
    }//c instruction
  }//command type

  String getSymbol() {
    String symbol = ""; //empty symbol
    int length = line.length();
    if (type == 'a') {
      symbol = line.substring(1, length-1);//takes out the @ symbol
    }//a instruction
    else if (type == 'l') {
      symbol = line.substring(1, length-2); //takes out parenthesis
    }//label
    return symbol;
  }//get symbol

  /*
c instruction to do:
   -if it's a c instruction 
   
   -if it contains the = symbol
   -->if it doesn't have the = symbol, then dest = null and 
   -->if it has = then it'll divide into dest and comp
   
   -if it contains the ; symbbol
   -->if it doesn't then jump is null
   -->if it does, it'll split into comp and jump
   */
  void cInstruction() {
    if (type == 'c') {
    }//if it's a c instruction
  }//c instruction

  String dest() {
    return dest;
  }//dest

  String comp() {
    return comp;
  }//comp

  String jump() {
    return jump;
  }//jump
}//class definition
