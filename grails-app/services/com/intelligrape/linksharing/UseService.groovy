package com.intelligrape.linksharing

import grails.transaction.Transactional

@Transactional
class UseService {

    def mailService

    def serviceMethod() {


    }

    def sendmail() {
        mailService.sendMail {
            to "myfriend@gmail.com"
            subject "This is a test mail"
            body "Hello, This is a test mail, how are you?"
        }
    }
}
