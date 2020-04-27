import java.lang.Math;

/*
process:
 -checks to see if it's a or c
 -if a, transfer it into binary
 -if c, checks the comp/dest/jump parts and determines the binary for each part then combines them 
 -adds all binary codes to a and c binary 
 */

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

      if (typeList.get(i) == "c") {
        cToBinary(i);
      }//if c instruction
    }//for loop

    //checkCode();
    //println("-------------------------");//line break
  }//decode 

  void aToBinary(int i) {
    int aTemp = Integer.parseInt(aInstruct.get(i)); //convert string to number
    String aBin = "";
    aBin = Integer.toBinaryString(aTemp); //convert number to binary string
    
    String zeros = ""; 
    if(aBin.length()<16){
      for(int z = aBin.length(); z < 16; z++){
        zeros = zeros + "0"; //add zeros
      }//loop through and add enough zeros
    }//if it's not 16 long
    
    zeros = zeros + aBin; //add binary value and zeros
    aBinary.set(i, zeros); //adds value to a binary arraylist
    
    //println(aInstruct.get(i) + " -> " + aBinary.get(i) + " size " + aBinary.get(i).length());
  }//a to binary

  void cToBinary(int i) {
    // 1 1 1 a c1 c2 c3 c4 c5 c6 d1 d2 d3 j1 j2 j3
    // 0 1 2 3 4  5  6  7  8  9  10 11 12 13 14 15

    IntList cTemp = new IntList(); //c instruction but in binary
    String compTemp = comp.get(i); //holds comp

    //println(i + " dest " + dest.get(i) + " comp " + comp.get(i) + " jump " + jump.get(i));

    for (int j = 0; j < 3; j++) {
      cTemp.set(0, 1);
      cTemp.set(1, 1);
      cTemp.set(2, 1);
    }//adds first 3 1s

    //comp part
    if (i > 0) {
      if (typeList.get(i-1) == "a") {
        cTemp.set(3, 1);
      }//if a is 1
      else {
        cTemp.set(3, 0);
      }//if a is 0
    }// i > 0

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
    
    //for(int j = 0; j <= 9; j++){
    //println(i + " " + j + " " + cTemp.get(j));
    //}//testing comp part

    //begin of dest
    String destTemp = ""; //holds dest
    if (dest.get(i).equals("0")) {
      cTemp.set(10, 0);
      cTemp.set(11, 0);
      cTemp.set(12, 0);
    }//dest is empty
    else {
      destTemp = dest.get(i);
    }//if dest has something

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
    String jumpTemp = ""; //holds jump
    if (jump.get(i).equals("0")) {
      cTemp.set(13, 0);
      cTemp.set(14, 0);
      cTemp.set(15, 0);
    }//jump is empty
    else {
      jumpTemp = jump.get(i);
    }//if jump has something
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
    
    //for(int j = 0; j < cTemp.size(); j++){
    //  println(i + " " + j + " " + cTemp.get(j));
    //}

    String cStrTemp = ""; //empty temp string
    for (int k = 0; k < cTemp.size(); k++) {
      cStrTemp = cStrTemp + cTemp.get(k);
      //println(k + " Binary " + cStrTemp);
    }//loop through temp and add to temp string

    //println("c instruction " + cStrTemp);

    cBinary.set(i, cStrTemp); //adds temp string of binary c to c binary stringlist
    //println(i + " Binary " + cStrTemp);
  }//c to binary

  void checkCode() {
    for (int i = 0; i < typeList.size(); i++) {
      print(i + " ");
      if (typeList.get(i).equals("a")) {
        println("A: " + aBinary.get(i));
      }//a
      else if (typeList.get(i).equals("c")) {
        println("C: " + cBinary.get(i));
      }//c
    }//for loop type list
    println("-------------------------");//line break
  }//check code
}//class definition end
