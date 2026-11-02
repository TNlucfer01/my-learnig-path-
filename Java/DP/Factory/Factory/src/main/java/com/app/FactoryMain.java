package com.app;

import com.phone.*;

public class FactoryMain {
  public static void main(String[] args) {
    osfactory osf = new osfactory();
    os obj = osf.getinstance("cl");
    obj.spec();
  }
}
