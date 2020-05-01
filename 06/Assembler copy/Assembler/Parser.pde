//parser class
//contains buffered reader which reads file line by line
//analyzes what type of line it is, discards comments

class Parser {
  BufferedReader reader;
  boolean finished = false;
  StringList line;
  int lineNum = 0;

  Parser() {
    
    line = new StringList(); //create stringlist
  }//constructor

  void readFile(String file) {
        reader = createReader(file); //create reader file
    while (finished==false) {
      try {
        line.append(reader.readLine()); //adds line to stringlist
      }//end try
      catch(IOException e) {
        //println("HI!");
        e.printStackTrace();
        line = null;
      }//catch

      if (line == null) {
        finished = true;
      }//null
    }//while
    println(line);
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
