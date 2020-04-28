//parser class
//contains buffered reader which reads file line by line
//analyzes what type of line it is, discards comments

class Parser {
  BufferedReader reader;
  StringList line;
  StringList typeList;
  StringList comp, dest, jump;
  StringList aInstruct;
  StringList labels;

  Parser(String file) {
    reader = createReader(file); //create reader file
    line = new StringList(); //create stringlist
    typeList = new StringList();
    comp = new StringList();
    dest = new StringList();
    jump = new StringList();
    aInstruct = new StringList();
    labels = new StringList();
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
      String tempLine = line.get(i);
      String trimString = tempLine.trim(); //trims excess white space
      line.set(i, trimString);
      
      typeList.set(i, commandType(i));//determines command type
      cInstruction(i);
      symbols(i);
      //println(i + " " + line.get(i) + " --> " + typeList.get(i));
      //println(i + " " + line.get(i));
    }//for line loop
   // println("-------------------------");//line break
  }//end analyze file

  void cleanComments() {
    //take out comments
    for (int i = 0; i < line.size()-1; i++) {
      if (line.get(i).contains("//")) {
        String[] tempStr = new String[2];
        tempStr = line.get(i).split("//"); //splits comment
        String str = tempStr[0];
        //println("pre trim " + str + ".");
        str = str.trim();
        //println("post trim " + str + ".");
        line.set(i, str); //makes it into a string
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

  void symbols(int i) {
    String symbol = ""; //empty symbol
    int length = line.get(i).length();
    if (typeList.get(i) == "a") {
      symbol = line.get(i).substring(1, length);//takes out the @ symbol
      aInstruct.set(i, symbol);
      comp.set(i, "0");
      dest.set(i, "0");
      jump.set(i, "0");
    }//a instruction
    else if (typeList.get(i) == "l") {
      symbol = line.get(i).substring(1, length-1); //takes out parenthesis
      labels.set(i, symbol);
      //println(symbol);
      comp.set(i, "0");
      dest.set(i, "0");
      jump.set(i, "0");
    }//label
  }//get symbol

  void cInstruction(int i) {
    //i is in the index number
    //only comp/dest or comp/jump

    String[] tempStr = new String[3];

    if (typeList.get(i) == "c") {
      //println(i + " " + line.get(i));
      if (line.get(i).contains("=")==true) { //dest = comp
        tempStr = line.get(i).split("=");
        dest.set(i, tempStr[0]);
        comp.set(i, tempStr[1]);
        //println("Dest " + dest.get(i) + " comp " + comp.get(i));
      }//comp + dest
      else {
        dest.set(i, "0");
      }//if there is no dest

      if (line.get(i).contains(";")==true) {//comp;jump
        tempStr = line.get(i).split(";");
        comp.set(i, tempStr[0]);
        jump.set(i, tempStr[1]);
        //println("Comp " + comp.get(i) + " jump " + jump.get(i));
      }//comp + jump
      else {
        jump.set(i, "0");
      }//if there is no jump
    }//if it's a c instruction
  }//c instruction

  StringList dest() {
    return dest;
  }//dest

  StringList comp() {
    return comp;
  }//comp

  StringList jump() {
    return jump;
  }//jump

  StringList types() {
    return typeList;
  }//types

  StringList aInstruct() {
    return aInstruct;
  }//a instruct

  StringList lines() {
    return line;
  }//returns all lines w/ comments cleaned out
  
  StringList labels(){
    return labels;
  }//returns all labels w/o parenthesis
}//class definition
