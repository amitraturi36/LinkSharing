package com.intelligrape.linksharing

import grails.validation.Validateable

@Validateable
class UserCO {
    String email
    String fname
    String lname
    String passwrd
    String CnfrmPsswrd
    String uname
    def photo
    static constraints = {
//        photo(nullable: true, validator: { def val, User obj ->
//                def okContentTypes = ['image/png', 'image/jpeg', 'image/jpg', 'image/gif', '.image/png', '.image/jpeg', '.image/jpg', '.image/gif']
//                return okContentTypes.contains(val.getContentType())
//        })
    }
}

