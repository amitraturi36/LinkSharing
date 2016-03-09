package com.intelligrape.linksharing

enum Visibility {
    PUBLIC, PRIVATE

    static Visibility stringToEnum(String string) {

        if (string.equalsIgnoreCase("PRIVATE")) {
            PRIVATE
        } else {
            PUBLIC
        }

    }

}