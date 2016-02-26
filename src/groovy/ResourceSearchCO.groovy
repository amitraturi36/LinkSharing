package com.intelligrape.linksharing

class ResourceSearchCO extends SearchCO {
    Long topicId
    String visibilityString

    Visibility getVisibility() {
      return   Visibility.stringToEnum(visibilityString)
    }

}

