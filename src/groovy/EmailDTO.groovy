package com.intelligrape.linksharing

import grails.validation.Validateable


@Validateable
class EmailDTO {
    String email
    String subject
    String body
    // String content
    static constraints = {
        // content nullable:true
    }

    def sendUnreadResourcesEmail() {

    }
}
