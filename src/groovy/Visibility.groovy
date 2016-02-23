package com.intelligrape.linksharing
enum Visibility {
    PUBLIC, PRIVIATE

    Visibility stringToEnum(String stringToEnumdata) {
        if(stringToEnumdata.compareToIgnoreCase("private"))
        {
            return PRIVIATE
        }
        else {
            return PUBLIC
        }

    }

}