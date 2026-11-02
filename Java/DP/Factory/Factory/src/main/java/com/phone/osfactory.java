package com.phone;

public class osfactory {

  public os getinstance(String str) {
    if (str.equals("open")) return new android();
    if (str.equals("closed")) return new ios();
    else return new other();
  }
}
