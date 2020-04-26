import java.lang.Math;

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
    //println(typeList.size());
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
    // 1 1 1 a c1 c2 c3 c4 c5 c6 d1 d2 d3 j1 j2 j3
    // 0 1 2 3 4  5  6  7  8  9  10 11 12 13 14 15

    IntList cTemp = new IntList(); //c instruction but in binary
    String compTemp = comp.get(i); //holds comp
    String destTemp = dest.get(i); //holds dest
    String jumpTemp = jump.get(i); //holds jump

    for (int j = 0; j < 3; j++) {
      cTemp.append(1);
    }//adds first 3 1s

    //comp part
    if (typeList.get(i-1) == "a") {
      cTemp.set(3, 1);
    }//if a is 1
    else {
      cTemp.set(3, 0);
    }//if a is 0

    if (compTemp.equals("0")) {
      cTemp.set(4, 1);
      cTemp.set(5, 0);
      cTemp.set(6, 1);
      cTemp.set(7, 0);
      cTemp.set(8, 1);
      cTemp.set(9, 0);
    }//0
    else if (compTemp.equals("1")) {
      cTemp.set(4, 1);
      cTemp.set(5, 1);
      cTemp.set(6, 1);
      cTemp.set(7, 1);
      cTemp.set(8, 1);
      cTemp.set(9, 1);
    }//1
    else if (compTemp.equals("-1")) {
      cTemp.set(4, 1);
      cTemp.set(5, 1);
      cTemp.set(6, 1);
      cTemp.set(7, 0);
      cTemp.set(8, 1);
      cTemp.set(9, 0);
    }//-1
    else if (compTemp.equals("D")) {
      cTemp.set(4, 0);
      cTemp.set(5, 0);
      cTemp.set(6, 1);
      cTemp.set(7, 1);
      cTemp.set(8, 0);
      cTemp.set(9, 0);
    }//D
    else if (compTemp.equals("A") || compTemp.equals("M")) {
      cTemp.set(4, 1);
      cTemp.set(5, 1);
      cTemp.set(6, 0);
      cTemp.set(7, 0);
      cTemp.set(8, 0);
      cTemp.set(9, 0);
    }//A and M
    else if (compTemp.equals("!D")) {
      cTemp.set(4, 0);
      cTemp.set(5, 0);
      cTemp.set(6, 1);
      cTemp.set(7, 1);
      cTemp.set(8, 0);
      cTemp.set(9, 1);
    }//!D
    else if (compTemp.equals("!A") || compTemp.equals("!M")) {
      cTemp.set(4, 1);
      cTemp.set(5, 1);
      cTemp.set(6, 0);
      cTemp.set(7, 0);
      cTemp.set(8, 0);
      cTemp.set(9, 1);
    }//!A and !M
    else if (compTemp.equals("-D")) {
      cTemp.set(4, 0);
      cTemp.set(5, 0);
      cTemp.set(6, 1);
      cTemp.set(7, 1);
      cTemp.set(8, 1);
      cTemp.set(9, 1);
    }//-D
    else if (compTemp.equals("-A") || compTemp.equals("-M")) {
      cTemp.set(4, 1);
      cTemp.set(5, 1);
      cTemp.set(6, 0);
      cTemp.set(7, 0);
      cTemp.set(8, 1);
      cTemp.set(9, 1);
    }//-A or -M
    else if (compTemp.equals("D+1")) {
      cTemp.set(4, 0);
      cTemp.set(5, 1);
      cTemp.set(6, 1);
      cTemp.set(7, 1);
      cTemp.set(8, 1);
      cTemp.set(9, 1);
    }//D+1
    else if (compTemp.equals("A+1") || compTemp.equals("M+1")) {
      cTemp.set(4, 1);
      cTemp.set(5, 1);
      cTemp.set(6, 0);
      cTemp.set(7, 1);
      cTemp.set(8, 1);
      cTemp.set(9, 1);
    }//A+1 or M+1
    else if (compTemp.equals("D-1")) {
      cTemp.set(4, 0);
      cTemp.set(5, 0);
      cTemp.set(6, 1);
      cTemp.set(7, 1);
      cTemp.set(8, 1);
      cTemp.set(9, 0);
    }//D-1
    else if (compTemp.equals("A-1") || compTemp.equals("M-1")) {
      cTemp.set(4, 1);
      cTemp.set(5, 1);
      cTemp.set(6, 0);
      cTemp.set(7, 0);
      cTemp.set(8, 1);
      cTemp.set(9, 0);
    }//A-1 or M-1
    else if (compTemp.equals("D+A") || compTemp.equals("D+M")) {
      cTemp.set(4, 0);
      cTemp.set(5, 0);
      cTemp.set(6, 0);
      cTemp.set(7, 0);
      cTemp.set(8, 1);
      cTemp.set(9, 0);
    }//D+A or D+M
    else if (compTemp.equals("D-A") || compTemp.equals("D-M")) {
      cTemp.set(4, 0);
      cTemp.set(5, 1);
      cTemp.set(6, 0);
      cTemp.set(7, 0);
      cTemp.set(8, 1);
      cTemp.set(9, 1);
    }//D-A or D-M
    else if (compTemp.equals("A-D") || compTemp.equals("M-D")) {
      cTemp.set(4, 0);
      cTemp.set(5, 0);
      cTemp.set(6, 0);
      cTemp.set(7, 1);
      cTemp.set(8, 1);
      cTemp.set(9, 1);
    }//A-D or M-D
    else if (compTemp.equals("D&A") || compTemp.equals("D&M")) {
      cTemp.set(4, 0);
      cTemp.set(5, 0);
      cTemp.set(6, 0);
      cTemp.set(7, 0);
      cTemp.set(8, 0);
      cTemp.set(9, 0);
    }//D&A and D&M
    else if (compTemp.equals("D|A") || compTemp.equals("D|M")) {
      cTemp.set(4, 0);
      cTemp.set(5, 1);
      cTemp.set(6, 0);
      cTemp.set(7, 1);
      cTemp.set(8, 0);
      cTemp.set(9, 1);
    }//D|A D|M
    //end of comp

    //begin of dest
    if (destTemp.contains("M")) {
      cTemp.set(12, 1);
    }//M
    else {
      cTemp.set(12, 0);
    }//no M

    if (destTemp.contains("D")) {
      cTemp.set(11, 1);
    }//D
    else {
      cTemp.set(11, 0);
    }//no D

    if (destTemp.contains("A")) {
      cTemp.set(10, 1);
    }//A
    else {
      cTemp.set(10, 0);
    }//no A
    //end of dest

    //begin jump
    if (jumpTemp.equals(null)) {
      cTemp.set(13, 0);
      cTemp.set(14, 0);
      cTemp.set(15, 0);
    }//if empty

    if (jumpTemp.equals("JGT")) {
      cTemp.set(13, 0);
      cTemp.set(14, 0);
      cTemp.set(15, 1);
    }//JGT
    else if (jumpTemp.equals("JEQ")) {
      cTemp.set(13, 0);
      cTemp.set(14, 1);
      cTemp.set(15, 0);
    }//JEQ
    else if (jumpTemp.equals("JGE")) {
      cTemp.set(13, 0);
      cTemp.set(14, 1);
      cTemp.set(15, 1);
    }//JGE
    else if (jumpTemp.equals("JLT")) {
      cTemp.set(13, 1);
      cTemp.set(14, 0);
      cTemp.set(15, 0);
    }//JLT
    else if (jumpTemp.equals("JNE")) {
      cTemp.set(13, 1);
      cTemp.set(14, 0);
      cTemp.set(15, 1);
    }//JNE
    else if (jumpTemp.equals("JLE")) {
      cTemp.set(13, 1);
      cTemp.set(14, 1);
      cTemp.set(15, 0);
    }//JLE
    else if (jumpTemp.equals("JMP")) {
      cTemp.set(13, 1);
      cTemp.set(14, 1);
      cTemp.set(15, 1);
    }//JMP
    //end jump

    String cStrTemp = ""; //empty temp string
    for (int k = 0; k < cTemp.size(); k++) {
      cStrTemp = cStrTemp + cTemp.get(i);
    }//loop through temp and add to temp string

    //println("c instruction " + cStrTemp);

    cBinary.set(i, cStrTemp); //adds temp string of binary c to c binary stringlist
  }//c to binary
}//class definition end
