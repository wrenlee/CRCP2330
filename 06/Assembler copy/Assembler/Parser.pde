//parser class
//contains buffered reader which reads file line by line
//analyzes what type of line it is, discards comments

class Parser {
  BufferedReader reader;
  boolean finished = false;
  StringList allLines;
  int lineNum = 0;

  Parser(String file) {
    reader = createReader(file); //create reader file
    allLines = new StringList();
  }//constructor

  void readFile() {
    String line;
    while (finished==false) {
      try {
        line = reader.readLine(); //reads line
      }//end try
      catch(IOException e) {
        e.printStackTrace();
        line = null;
      }//catch

      if (line == null) {
        finished = true;
      }//null
      else{
       allLines.append(line);
      }//put line into all lines
    }//while
  }//read file

  boolean hasMoreCommands() {
    boolean moreCommands = true;
    if(lineNum+1 >= allLines.size()){
      moreCommands = false;
    }//if the current line number 
    return moreCommands;
  }//if there are more commands

  void advance() {
    lineNum++;
  }//advance

  String currentString() {
    String curString = allLines.get(lineNum);
    
    if (curString.contains("//")) {
        String[] tempStr = new String[2];
        tempStr = curString.split("//"); //splits comment
        String temp = tempStr[0];
        curString = temp.trim();
      }//if there is a comment
      
    return curString;
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
    //println(type + " -> " + currentString());
    return type;
  }//current type
}//class definition
