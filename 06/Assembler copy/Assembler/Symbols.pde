class Symbols {
  StringList symbols;
  StringList addresses;

  Symbols() {
    //creates table
    symbols = new StringList();
    addresses = new StringList();
  }//symbols constructor

  /*
   one stringlist has symbols. 
   Check if the symbol is in there and 
   return the index of that symbol to use in the address stringlist 
   then return the binary number of the address
   */

  boolean hasSymbol(String symb) {
    boolean hasSymb;
    if (symbols.hasValue(symb)==true) {
      hasSymb = true;
    }//if the symbol is in table
    else {
      hasSymb = false;
    }//if symbol isn't in table
    return hasSymb;
  }//has symbol, returns t/f value

  String getAddress(String oldStr) {
    String newAdd = ""; //new address
    int slotNum = 0;
    for (int i = 0; i < symbols.size(); i++) {
      if (symbols.get(i).equals(oldStr) == true) {
        slotNum = i; //sets slot num
      }//if string then get slot num
    }//loop through symbols list
    newAdd = addresses.get(slotNum);//gets the address from the symbols table
    return newAdd;
  }//get address

  void addSymbol(String name, int loc) {
    symbols.append(name); //add name to end of symbols table
    String index = Integer.toString(loc);
    addresses.append(index); //add address
  }//add symbol

  void printTable() {
    for (int i = 0; i < symbols.size(); i++) {
      println(i + " " + symbols.get(i) + " | " + addresses.get(i));
    }//for loop
  }//print table

  void predefinedSymbols() { //add of the 23 predefined symbols
  symbols.append("0");
    addresses.append("0");
    symbols.append("1");
    addresses.append("1");
    symbols.append("2");
    addresses.append("2");
    symbols.append("3");
    addresses.append("3");
    symbols.append("4");
    addresses.append("4");
    symbols.append("5");
    addresses.append("5");
    symbols.append("6");
    addresses.append("6");
    symbols.append("7");
    addresses.append("7");
    symbols.append("8");
    addresses.append("8");
    symbols.append("9");
    addresses.append("9");
    symbols.append("10");
    addresses.append("10");
    symbols.append("11");
    addresses.append("11");
    symbols.append("12");
    addresses.append("12");
    symbols.append("13");
    addresses.append("13");
    symbols.append("14");
    addresses.append("14");
    symbols.append("15");
    addresses.append("15");
    
    //rs
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
    
    //screens + kbd
    symbols.append("SCREEN");
    addresses.append("16384");
    symbols.append("KBD");
    addresses.append("24576");
    
    //other symbols
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
