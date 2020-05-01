//parser class
//contains buffered reader which reads file line by line
//analyzes what type of line it is, discards comments

class Parser {
  BufferedReader reader;
  boolean finished = false;
  StringList line;
  int lineNum = 0;

  Parser(String file) {
    reader = createReader(file); //create reader file
    line = new StringList(); //create stringlist
  }//constructor

  void readFile() {
    String tempLine = "";
    while (finished==false) {
      try {
        tempLine = reader.readLine();
        line.append(tempLine); //adds line to stringlist
      }//end try
      catch(IOException e) {
        e.printStackTrace();
        tempLine = null;
      }//catch

      if (tempLine == null) {
        finished = true;
      }//null
    }//while
  }//read file

  boolean hasMoreCommands() {
    //if finished is true, then there are not more commands (more commands false)
    return !finished;
  }//if there are more commands

  void advance() {
    lineNum++;
  }//advance

  String currentString() {
    return line.get(lineNum);
  }//current string 

  String currentType() {
    String type = "";
    if (currentString().contains("@")) {
      type = "a";
    }//a instruction
    else if (currentString().contains("(")) {
      type = "l";
    }//label
    else {
      type = "c";
    }//c instruction
    return type;
  }//current type
}//class definition
