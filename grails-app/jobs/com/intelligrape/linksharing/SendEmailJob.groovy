package com.intelligrape.linksharing



class SendEmailJob {
    static triggers = {
        cron name: 'myTrigger', cronExpression: "0 0 1 ? * MON *"
    }
//    def group = "MyGroup"
    def description = "Example job with Cron Trigger"
def useService
    def execute() {
        EmailDTO emailDTO=new EmailDTO(body:"hello",subject: "my job",email:"amitraturi36@gmail.com" )
       useService.sendmail(emailDTO)
    }
}


