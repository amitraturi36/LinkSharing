package com.intelligrape.linksharing

import grails.validation.Validateable

@Validateable
class UserSearchCO extends SearchCO {
    Boolean active
    String email
    String username
    String firstName
    String lastName

}
