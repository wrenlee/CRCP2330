String file;
Parser p;

void setup() {
  file = "MaxL";
  file = file + ".asm"; //creates file
  
  p = new Parser(file);
}//end setup

void draw() {
  p.loadFile();
}//end draw
