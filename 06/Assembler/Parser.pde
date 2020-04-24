//parser class
//contains buffered reader which reads file line by line
//analyzes what type of line it is, discards comments

class Parser {
  BufferedReader reader;
  String line;
  boolean hasNextLine;
  char type;
  String comp, dest, jump;

  Parser(String file) {
    reader = createReader(file); //create reader file
    hasNextLine = true;
    comp = "";
    dest = "";
    jump = "";
  }//constructor

  void readFile() {
    try {
      line = reader.readLine();
      
      if(line == null){
        hasNextLine = false;
      }//line null
      
      cleanComments();
      
      if (line.length()>0 && hasNextLine == true) {
        //commandType();//determines command type
      }//if it's not empty space and has another line
    }//end try

    catch(IOException e) {
      e.printStackTrace();
      hasNextLine = false;
    }//catch 
   // println(line + " --> " + type + " --> " + getSymbol());
  }//end read file

  void cleanComments() {//take out comments
    if (line.contains("//")) {
      //println(line);
      String[] tempStr = new String[10];
      tempStr = line.split("//"); //splits comment
      //println("Temp before " + tempStr[0] + " + " + tempStr[1]);
      tempStr[1] = ""; //replaces the comment part with an empty string
      //println("Temp after " + tempStr[0] + " + " + tempStr[1]);
      line = tempStr[0]; //makes it into a string
      //println("AFTER " + line);
    }//comments
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
      symbol = line.substring(1, length);//takes out the @ symbol
    }//a instruction
    else if (type == 'l') {
      symbol = line.substring(1, length-1); //takes out parenthesis
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
