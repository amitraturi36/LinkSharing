package com.intelligrape.linksharing

enum Seriousness {
    SERIOUS, VERY_SERIOUS, CASUAL

    static Seriousness stringToEnum(String stringToEnumdata) {
        if (stringToEnumdata.compareToIgnoreCase("serious")) {
            return SERIOUS
        } else if (stringToEnumdata.compareToIgnoreCase("veryserious")) {
            return VERY_SERIOUS
        } else {
            return CASUAL
        }

    }

}