import java.lang.Math;

/*
process:
 -if a, transfer it into binary
 -if c, checks the comp/dest/jump parts and determines the binary for each part then combines them 
 */

class Code {
  //variables from parser

  Code() {
  }//constructor

  String aToBinary(String address) {
    //println(address);
    String aBin = ""; //binary w/o leading zeros
    int aTemp = Integer.parseInt(address); //convert string to number
    aBin = Integer.toBinaryString(aTemp); //convert number to binary string

    String zeros = ""; 
    if (aBin.length()<16) {
      for (int z = aBin.length(); z < 16; z++) {
        zeros = zeros + "0"; //add zeros
      }//loop through and add enough zeros
    }//if it's not 16 long

    zeros = zeros + aBin; //add binary value and zeros
    return zeros;
  }//a to binary

  String cToBinary(String comp, String dest, String jump) {
    // 1 1 1 a c1 c2 c3 c4 c5 c6 d1 d2 d3 j1 j2 j3
    // 0 1 2 3 4  5  6  7  8  9  10 11 12 13 14 15

    IntList cTemp = new IntList(); //list to hold all binary values

    for (int j = 0; j < 3; j++) {
      cTemp.set(0, 1);
      cTemp.set(1, 1);
      cTemp.set(2, 1);
    }//adds first 3 1s

    //begin comp

    //a, 12
    if (comp.contains("M")) {
      cTemp.set(3, 1);
    }//a = 1 w/ m
    else {
      cTemp.set(3, 0);
    }//a = 0 w/o m

    if (comp.equals("0")) {
      cTemp.set(4, 1);
      cTemp.set(5, 0);
      cTemp.set(6, 1);
      cTemp.set(7, 0);
      cTemp.set(8, 1);
      cTemp.set(9, 0);
    }//0
    else if (comp.equals("1")) {
      cTemp.set(4, 1);
      cTemp.set(5, 1);
      cTemp.set(6, 1);
      cTemp.set(7, 1);
      cTemp.set(8, 1);
      cTemp.set(9, 1);
    }//1
    else if (comp.equals("-1")) {
      cTemp.set(4, 1);
      cTemp.set(5, 1);
      cTemp.set(6, 1);
      cTemp.set(7, 0);
      cTemp.set(8, 1);
      cTemp.set(9, 0);
    }//-1
    else if (comp.equals("D")) {
      cTemp.set(4, 0);
      cTemp.set(5, 0);
      cTemp.set(6, 1);
      cTemp.set(7, 1);
      cTemp.set(8, 0);
      cTemp.set(9, 0);
    }//D
    else if (comp.equals("A") || comp.equals("M")) {
      cTemp.set(4, 1);
      cTemp.set(5, 1);
      cTemp.set(6, 0);
      cTemp.set(7, 0);
      cTemp.set(8, 0);
      cTemp.set(9, 0);
    }//A and M
    else if (comp.equals("!D")) {
      cTemp.set(4, 0);
      cTemp.set(5, 0);
      cTemp.set(6, 1);
      cTemp.set(7, 1);
      cTemp.set(8, 0);
      cTemp.set(9, 1);
    }//!D
    else if (comp.equals("!A") || comp.equals("!M")) {
      cTemp.set(4, 1);
      cTemp.set(5, 1);
      cTemp.set(6, 0);
      cTemp.set(7, 0);
      cTemp.set(8, 0);
      cTemp.set(9, 1);
    }//!A and !M
    else if (comp.equals("-D")) {
      cTemp.set(4, 0);
      cTemp.set(5, 0);
      cTemp.set(6, 1);
      cTemp.set(7, 1);
      cTemp.set(8, 1);
      cTemp.set(9, 1);
    }//-D
    else if (comp.equals("-A") || comp.equals("-M")) {
      cTemp.set(4, 1);
      cTemp.set(5, 1);
      cTemp.set(6, 0);
      cTemp.set(7, 0);
      cTemp.set(8, 1);
      cTemp.set(9, 1);
    }//-A or -M
    else if (comp.equals("D+1")) {
      cTemp.set(4, 0);
      cTemp.set(5, 1);
      cTemp.set(6, 1);
      cTemp.set(7, 1);
      cTemp.set(8, 1);
      cTemp.set(9, 1);
    }//D+1
    else if (comp.equals("A+1") || comp.equals("M+1")) {
      cTemp.set(4, 1);
      cTemp.set(5, 1);
      cTemp.set(6, 0);
      cTemp.set(7, 1);
      cTemp.set(8, 1);
      cTemp.set(9, 1);
    }//A+1 or M+1
    else if (comp.equals("D-1")) {
      cTemp.set(4, 0);
      cTemp.set(5, 0);
      cTemp.set(6, 1);
      cTemp.set(7, 1);
      cTemp.set(8, 1);
      cTemp.set(9, 0);
    }//D-1
    else if (comp.equals("A-1") || comp.equals("M-1")) {
      cTemp.set(4, 1);
      cTemp.set(5, 1);
      cTemp.set(6, 0);
      cTemp.set(7, 0);
      cTemp.set(8, 1);
      cTemp.set(9, 0);
    }//A-1 or M-1
    else if (comp.equals("D+A") || comp.equals("D+M")) {
      cTemp.set(4, 0);
      cTemp.set(5, 0);
      cTemp.set(6, 0);
      cTemp.set(7, 0);
      cTemp.set(8, 1);
      cTemp.set(9, 0);
    }//D+A or D+M
    else if (comp.equals("D-A") || comp.equals("D-M")) {
      cTemp.set(4, 0);
      cTemp.set(5, 1);
      cTemp.set(6, 0);
      cTemp.set(7, 0);
      cTemp.set(8, 1);
      cTemp.set(9, 1);
    }//D-A or D-M
    else if (comp.equals("A-D") || comp.equals("M-D")) {
      cTemp.set(4, 0);
      cTemp.set(5, 0);
      cTemp.set(6, 0);
      cTemp.set(7, 1);
      cTemp.set(8, 1);
      cTemp.set(9, 1);
    }//A-D or M-D
    else if (comp.equals("D&A") || comp.equals("D&M")) {
      cTemp.set(4, 0);
      cTemp.set(5, 0);
      cTemp.set(6, 0);
      cTemp.set(7, 0);
      cTemp.set(8, 0);
      cTemp.set(9, 0);
    }//D&A and D&M
    else if (comp.equals("D|A") || comp.equals("D|M")) {
      cTemp.set(4, 0);
      cTemp.set(5, 1);
      cTemp.set(6, 0);
      cTemp.set(7, 1);
      cTemp.set(8, 0);
      cTemp.set(9, 1);
    }//D|A D|M
    //end of comp

    //begin of dest
    String destTemp = ""; //holds dest
    if (dest.equals("0")) {
      cTemp.set(10, 0);
      cTemp.set(11, 0);
      cTemp.set(12, 0);
    }//dest is empty
    else {
      destTemp = dest;
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
    if (jump.equals("0")) {
      cTemp.set(13, 0);
      cTemp.set(14, 0);
      cTemp.set(15, 0);
    }//jump is empty
    else {
      jumpTemp = jump;
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

    String cStrTemp = ""; //empty temp string
    for (int k = 0; k < cTemp.size(); k++) {
      cStrTemp = cStrTemp + cTemp.get(k);
    }//loop through temp and add to temp string

    return cStrTemp;
  }//c to binary
}//class definition end
