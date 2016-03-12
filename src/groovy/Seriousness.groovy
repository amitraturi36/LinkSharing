package com.intelligrape.linksharing

enum Seriousness {
    SERIOUS, VERY_SERIOUS, CASUAL

    static Seriousness stringToEnum(String stringToEnumdata) {
        if (stringToEnumdata.compareToIgnoreCase("SERIOUS")) {
            return SERIOUS
        } else if (stringToEnumdata.compareToIgnoreCase("VERY_SERIOUS")) {
            return VERY_SERIOUS
        } else {
            return CASUAL
        }

    }

}