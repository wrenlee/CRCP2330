//parser class
//contains buffered reader which reads file line by line
//analyzes what type of line it is, discards comments

class Parser {
  BufferedReader reader;
  String line;
  boolean hasNextLine = true;
  char commandType;
  
  Parser(String file) {
    reader = createReader(file); //create reader file
  }//constructor

  void readFile() {
    try {
      line = reader.readLine();
      if (line.contains("/") == false) {//if it's not a comment
        advance();
      }
    }//end try
    catch(IOException e) {
      e.printStackTrace();
      hasNextLine = false;
    }//end catch
  }//end read file
  
  void advance(){
  }//advance
}//class definition
