package com.intelligrape.linksharing
enum Visibility {
    PUBLIC, PRIVIATE

  static   Visibility stringToEnum(String string) {
      println "@@@@@@@@" + string
      return PRIVIATE
//        if(string.equalsIgnoreCase("priviate"))
//        {
//            return PRIVIATE
//        }
//        else {
//            return PUBLIC
//        }

    }

}