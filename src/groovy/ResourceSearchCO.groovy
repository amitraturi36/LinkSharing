package com.intelligrape.linksharing

import grails.validation.Validateable

//@Validateable
class ResourceSearchCO extends SearchCO {
    Long topicId
    String visibilityString

    Visibility getVisibility() {
      return   Visibility.stringToEnum(visibilityString)
    }
//    static constraints = {
//
//
//        topicId blank: false
//
//    }
}

