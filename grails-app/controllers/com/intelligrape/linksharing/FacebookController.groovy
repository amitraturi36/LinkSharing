package com.intelligrape.linksharing

import grails.plugin.springsecurity.annotation.Secured

class FacebookController {
    def springSecurityService
    def useService

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def index() {
        render(view: '/login/facebook')
    }

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def register() {
        def user = grails.converters.JSON.parse(params.obj)
        def fileURL = user.picture.data.url
        def thisUrl = new URL(fileURL);
        def connection = thisUrl.openConnection();
        def dataStream = connection.inputStream
        def photo = dataStream?.bytes

        if (user) {
            User logedinUser = User.findByEmail(user.email)
            if (logedinUser) {
                springSecurityService.reauthenticate(logedinUser.username, logedinUser.password)
                render 2
            } else {
                String pass = User.randomnumbergenerator().toString()
                User fbUser = new User([
                        firstName      : user.first_name,
                        lastName       : user.last_name, username: "fb_${user.first_name}_${user.id}",
                        password       : pass,
                        confirmPassword: pass,
                        email          : user.email,
                        enabled        : true,
                        active         : true,
                        photo          : photo
                ])
                if (fbUser.validate()) {
                    try {
                        useService.sendpassword(user.email,fbUser.username,pass)
                        fbUser.save(failOnError: false, flush: true)
                        def userRole = Role.findByAuthority('ROLE_USER') ?: new Role(authority: 'ROLE_USER').save(failOnError: true)
                        new UserRole(fbUser, userRole).save(flush: true)
                        flash.messages = "sucessfully registered"
                        springSecurityService.reauthenticate(fbUser.username, fbUser.password)
                        render 2

                    } catch (Exception e) {

                    }

                }

            }
        }
    }


    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def login() {
        render "success"
    }

}

