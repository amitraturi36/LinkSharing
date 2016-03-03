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
       // render user.errors.allErrors.collect { message(error: it) }.join(',')
        flash.errors=message(error:user.errors.getFieldError('email'))+","+message(error:user.errors.getFieldError('password'))+","+message(error:user.errors.getFieldError('firstName'))+","+message(error:user.errors.getFieldError('lastName'))
        render view:'register'

    }
    def showSubscribedTopics(Long id){
        if(id) {
            Topic topic = Topic.get(id)
            List<User> user = topic.subscribedUser
            render view: "showtopics", model: [user: user, subtopics: topic]

        }
        else{
            flash.errors="No such Topic Exists"
             redirect(action:  'index')
        }

    }

}
