//parser class
class Parser {
  BufferedReader reader;
  String line;
  boolean endOfFile;

  Parser(String file) {
    reader = createReader(file); //create reader file
    endOfFile = false;
  }//constructor

  void loadFile() {
    try {
      line = reader.readLine();
    }//end try
    catch(IOException e) {
      e.printStackTrace();
      line = null;
      endOfFile = true;
    }//end catch
    println(line);
  }//load file
}
