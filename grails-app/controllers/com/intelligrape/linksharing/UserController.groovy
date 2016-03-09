package com.intelligrape.linksharing

import grails.util.Holders
import org.springframework.beans.factory.annotation.Autowired

class UserController {
    String confirmPassword
    static constraints = {
        confirmPassword
    }
//    def userService
//   def myBean
//    def    myBeanConstrctr

    def index() {
        List<TopicVO> topicVOList = Topic.getTrendingTopics(0)
        render(view: "index", model: [list: topicVOList, subtopics: session.user.subscribedTopic])
        // render view: "index", model: [list: userService.serviceMethod(), subtopics: session.user.subscribedTopic]
//        def c= Holders.applicationContext.getBean(CustomBean)
//        //    render myBean.firstName
//        render   c.firstName
    }


    def register(String email, String fname, String lname, String passwrd, String CnfrmPsswrd, String uname) {
        User user = new User(email: email, firstName: fname, lastName: lname, password: passwrd, confirmPassword: CnfrmPsswrd)
        user.validate()
        // render user.errors.allErrors.collect { message(error: it) }.join(',')
        flash.errors = message(error: user.errors.getFieldError('email')) + "," + message(error: user.errors.getFieldError('password')) + "," + message(error: user.errors.getFieldError('firstName')) + "," + message(error: user.errors.getFieldError('lastName'))
        render view: 'register'

    }

    def showSubscribedTopics(Long id) {

        if (id) {
            Topic topic = Topic.get(id)
            List<User> user = topic.subscribedUser

            render view: "/topic/show", model: [user: user, topics: topic]

        } else {
            flash.errors = "No such topic Exists"
            redirect(action: 'index')
        }

    }

}
