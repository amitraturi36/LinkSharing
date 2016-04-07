package com.intelligrape.linksharing

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_USER', 'ROLE_ADMIN'])
class ForgotpasswordController {
    def springSecurityService

    def changePassword(String passwrd, String CnfrmPsswrd) {
        User user = springSecurityService.currentUser
        if (user) {
            if (passwrd == CnfrmPsswrd) {
                user.confirmPassword = CnfrmPsswrd
                user.password = passwrd
                if (user.validate()) {
                    user.save(flush: true)
                    flash.messages = "Password Save sucessfully"

                    redirect(controller: 'user', action: 'profile')
                } else {
                    flash.errors = "Password not save Please try again"
                    redirect(controller: 'user', action: 'profile')
                    render "fail"
                }
            }
        }

    }
}
