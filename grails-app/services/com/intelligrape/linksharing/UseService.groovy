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
    def topTopic(){
        Topic topic=null
        int count1=0
        int count2=0
        List <Topic> topicList=Topic.getAll();
        topicList.each {Topic topic1->
            topic1.resources.each {
                count1++
            }
            topic=count1>count2?topic1:topic
            count2=count1
            count1=0
        }
        return topic
    }
}
