package com.intelligrape.linksharing
class TopicSearchCO {
    Long userId
    String visibilityString
    Visibility getVisibility() {
        return   Visibility.stringToEnum(visibilityString)
    }
    User getUser(){
        return User.get(userId)
    }

}
