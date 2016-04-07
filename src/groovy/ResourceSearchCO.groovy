package com.intelligrape.linksharing

import grails.validation.Validateable

@Validateable
class ResourceSearchCO extends SearchCO {
    Long topicId
    String visibilityString
    Long userId
    Integer status

    Visibility getVisibility() {
        if (this?.visibilityString) {
            return Visibility.stringToEnum(this.visibilityString)

        }
    }
    static constraints = {
        topicId blank: false
    }

    User getUser() {
        return User.get(userId)
    }
}

