//parser class
//contains buffered reader which reads file line by line
//analyzes what type of line it is, discards comments

class Parser {
  BufferedReader reader;
  StringList line;
  StringList typeList;
  String comp, dest, jump;

  Parser(String file) {
    reader = createReader(file); //create reader file
    line = new StringList(); //create stringlist
    typeList = new StringList();
    comp = "";
    dest = "";
    jump = "";
  }//constructor

  void readFile() {
    try {
      line.append(reader.readLine()); //adds line to stringlist
    }//end try
    catch(IOException e) {
      e.printStackTrace();
    }//catch

    for (int i = 0; i < line.size(); i++) {
      if (line.get(i) == null) {   
        noLoop(); //stop loop if out of text
      }//if null stop
    }//for loop
  }//read file

  void analyzeFile() {
    cleanComments();
    for (int i = 0; i < line.size()-1; i++) {
      typeList.set(i, commandType(i));//determines command type
      println(line.get(i) + " --> " + typeList.get(i) + " --> " + getSymbol(i));
    }//for line loop
    println("-------------------------");//line break
  }//end analyze file

  void cleanComments() {
    //take out comments
    for (int i = 0; i < line.size()-1; i++) {
      if (line.get(i).contains("//")) {
        String[] tempStr = new String[10];
        tempStr = line.get(i).split("//"); //splits comment
        tempStr[1] = ""; //replaces the comment part with an empty string
        line.set(i, tempStr[0]); //makes it into a string
        line.remove(i); //remove line
      }//if comments
      if (line.get(i).isEmpty() == true) {//if it's empty
        line.remove(i);
      }//empty space
    }//for loop
  }//clean line end

  String commandType(int i) {
    String type = "";
    if (line.get(i).contains("@")) {
      type = "a";
    }//a instruction
    else if (line.get(i).contains("(")) {
      type = "l";
    }//label
    else {
      type = "c";
    }//c instruction
    return type;
  }//command type

  String getSymbol(int i) {
    String symbol = ""; //empty symbol
    int length = line.get(i).length();
    if (typeList.get(i) == "a") {
      symbol = line.get(i).substring(1, length);//takes out the @ symbol
    }//a instruction
    else if (typeList.get(i) == "l") {
      symbol = line.get(i).substring(1, length-1); //takes out parenthesis
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
  void cInstruction(int i) {
    if (typeList.get(i) == "c") {
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
