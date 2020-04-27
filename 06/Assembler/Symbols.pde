class Symbols{
  StringList symbols;
  StringList addresses;
  
  StringList lines;
  
  Symbols(){//creates table
    symbols = new StringList();
    addresses = new StringList();
    
    lines = new StringList();
  }//symbols constructor
  
  /*
  one stringlist has symbols. 
  Check if the symbol is in there and return the index of that symbol 
  to use in the address stringlist then return the binary number of that
  */
  
  void firstPass(StringList allLines){
    lines = allLines; //gets all of the lines
    
    
  }//first pass
  
  void predefinedSymbols(){ //add of the 23 predefined symbols
    symbols.append("R0");
    addresses.append("0");
    symbols.append("R1");
    addresses.append("1");
    symbols.append("R2");
    addresses.append("2");
    symbols.append("R3");
    addresses.append("3");
    symbols.append("R4");
    addresses.append("4");
    symbols.append("R5");
    addresses.append("5");
    symbols.append("R6");
    addresses.append("6");
    symbols.append("R7");
    addresses.append("7");
    symbols.append("R8");
    addresses.append("8");
    symbols.append("R9");
    addresses.append("9");
    symbols.append("R10");
    addresses.append("10");
    symbols.append("R11");
    addresses.append("11");
    symbols.append("R12");
    addresses.append("12");
    symbols.append("R13");
    addresses.append("13");
    symbols.append("R14");
    addresses.append("14");
    symbols.append("R15");
    addresses.append("15");
    symbols.append("SCREEN");
    addresses.append("16384");
    symbols.append("KBD");
    addresses.append("24576");
    symbols.append("SP");
    addresses.append("0");
    symbols.append("LCL");
    addresses.append("1");
    symbols.append("ARG");
    addresses.append("2");
    symbols.append("THIS");
    addresses.append("3");
    symbols.append("THAT");
    addresses.append("4");
  }//predefined symbols
  
}//class def ends
