package com.intelligrape.linksharing



class SendEmailJob {
    static triggers = {
        simple name:'simpleTrigger', startDelay:10000, repeatInterval: 604800000, repeatCount: -1
        cron name: 'myTrigger', cronExpression: " 0 0 13 ? ? ?"
    }
//    def group = "MyGroup"
//    def description = "Example job with Cron Trigger"
def useService
    def execute() {
        EmailDTO emailDTO=new EmailDTO(body:"hello",subject: "my job",email:"amitraturi36@gmail.com" )
       useService.sendmail(emailDTO)
    }
}


