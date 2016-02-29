package com.intelligrape.linksharing

import org.codehaus.groovy.control.messages.Message

class UserController {
    String confirmPassword
    static constraints = {
        confirmPassword
    }

    def index() {
        List<TopicVO> topicVOList = Topic.getTrendingTopics(0)
        render(view: "index", model: [list: topicVOList, subtopics: session.user.subscribedTopic])

    }


    def register(String email, String fname, String lname, String passwrd, String CnfrmPsswrd, String uname) {
        User user = new User(email: email, firstName: fname, lastName: lname, password: passwrd, confirmPassword: CnfrmPsswrd)
        user.validate()
        // message(code: "${user.errors.allErrors}")
        List errors = []
        render user.errors.allErrors.collect { message(error: it) }.join(',')

    }

}
