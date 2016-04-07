package com.intelligrape.linksharing

import grails.transaction.Transactional

@Transactional
class UseService {

    def mailService

    def serviceMethod() {



    }

    def sendmail(EmailDTO sendMailVO) {
        mailService.sendMail {
            async true
            to sendMailVO.email
            subject sendMailVO.subject
            body sendMailVO.body

        }

    }
     def sendpassword(String email,String username,String password){

         EmailDTO sendMailVO = new EmailDTO([

                 email  : email,
                 subject: "Welcome TO Link Sharing Your username and password ",
                 body   : "Your username is ${username} And Your  Password is ${password}"

         ])
         sendmail(sendMailVO)


     }
    def forgetpassemail(String email) {
        User user = User.findByEmail(email)
        String password = User.randomnumbergenerator().toString()
        user.password = password
        user.save(flush: true)
        EmailDTO sendMailVO = new EmailDTO([
                email  : email,
                subject: "Request for New Pasword",
                body   : "your New Password is ${password}"
        ])
        sendmail(sendMailVO)


    }
}
