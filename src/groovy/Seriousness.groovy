package com.intelligrape.linksharing
enum Seriousness {
    SERIOUS,VERYSERIOUS,CASUAL
    Seriousness stringToEnum(String stringToEnumdata) {
        if(stringToEnumdata.compareToIgnoreCase("serious"))
        {
            return SERIOUS
        }
        else  if(stringToEnumdata.compareToIgnoreCase("veryserious")){
            return VERYSERIOUS
        }
        else  {
            return CASUAL
        }

    }

}