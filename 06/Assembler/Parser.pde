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
  }//read file

  void analyzeFile() {
    cleanComments();
    for (int i = 0; i < line.size(); i++) {
      typeList.set(i, commandType(i));//determines command type
      //println(line.get(index-1) + " --> " + type + " --> " + getSymbol(i));
    }//for line loop
  }//end analyze file

  void cleanComments() {
    //take out comments
    for (int i = 0; i < line.size(); i++) {
      if (line.get(i).contains("//")) {
        String[] tempStr = new String[10];
        tempStr = line.get(i).split("//"); //splits comment
        //println("Temp before " + tempStr[0] + " + " + tempStr[1]);
        tempStr[1] = ""; //replaces the comment part with an empty string
        //println("Temp after " + tempStr[0] + " + " + tempStr[1]);
        line.set(i, tempStr[0]); //makes it into a string
      }//comments
    }//for loop
  }//clean line end

  String commandType(int i) {
    String type;
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
