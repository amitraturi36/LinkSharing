package com.intelligrape.linksharing

enum Visibility {
    PUBLIC, PRIVIATE

    static Visibility stringToEnum(String string) {

        if (string.equalsIgnoreCase("PRIVIATE")) {
            PRIVIATE
        } else {
            PUBLIC
        }

    }

}