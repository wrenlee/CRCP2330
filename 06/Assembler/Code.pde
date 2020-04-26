class Code {
  //variables from parser
  StringList typeList;
  StringList comp, dest, jump;
  StringList aInstruct;

  StringList aBinary, cBinary; //holds the binary values

  Code() {
    typeList = new StringList();
    comp = new StringList();
    dest = new StringList();
    jump = new StringList();
    aInstruct = new StringList();

    aBinary = new StringList();
    cBinary = new StringList();
  }//constructor

  void init(StringList allT, StringList allC, StringList allD, StringList allJ, StringList allA) {
    typeList = allT;
    comp = allC;
    dest = allD;
    jump = allJ;
    aInstruct = allA;
  }//initialize

  void decode() {
    for (int i = 0; i < typeList.size(); i++) {
      if (typeList.get(i) == "a") {
        aToBinary(i);
      }//if a instruction
      else if (typeList.get(i) == "c") {
        cToBinary(i);
      }//if c instruction
    }//for loop
  }//decode

  void aToBinary(int i) {
    int aTemp = Integer.parseInt(aInstruct.get(i)); //convert string to number
    aBinary.set(i, Integer.toBinaryString(aTemp)); //convert number to binary string
    println(aInstruct.get(i) + " -> " + aTemp + " -> " + aBinary.get(i));
  }//a to binary

  void cToBinary(int i) {
    // 1 1 1 a c1 c2 c3 c4 c5 c6 c7 d1 d2 d3 j1 j2 j3
    
    IntList cTemp = new IntList();
    
    for (int j = 0; j < 3; j++) {
      cTemp.append(1);
    }//adds first 3 1s

    if ((comp.get(i).contains("A") == true) || (comp.get(i).contains("a") == true)) {
      cTemp.set(3,1);
    }//if there's an a
    else {
      cTemp.set(3,0);
    }//if there's not an a
    
    
    
    //loop through temp and add to cBinary stringlist
  }//c to binary
}//class definition end
