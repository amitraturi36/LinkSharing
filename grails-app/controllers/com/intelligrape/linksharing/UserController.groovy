package com.intelligrape.linksharing

import grails.converters.JSON
import org.springframework.web.multipart.commons.CommonsMultipartFile

class UserController {
//    def userService
//   def myBean
//    def    myBeanConstrctr
    def useService

    def index(SearchCO searchCO) {
        List<TopicVO> topicVOList = Topic.getTrendingTopics()
        List <Topic>topicList=session.user.getSubscribedTopic(params)
        User user=User.get(session.user.id)
        render view: "index", model: [resources:user.getUnReadResources(searchCO),list: topicVOList, subtopics:topicList, subtopicscount: topicList.size() ]
        // render view: "index", model: [list: userService.serviceMethod(), subtopics: session.user.subscribedTopic]
//        def c= Holders.applicationContext.getBean(CustomBean)
//        //    render myBean.firstName
//        render   c.firstName
    }


    def register(UserCO userCO) {
        User user = new User([
                email          : userCO.email,
                firstName      : userCO.fname,
                lastName       : userCO.lname,
                password       : userCO.passwrd,
                confirmPassword: userCO.CnfrmPsswrd,
                active         : true
        ])
        CommonsMultipartFile file = params.list("photo")?.getAt(0)
        user.photo = file?.bytes
        def okContentTypes = ['image/png', 'image/jpeg', 'image/jpg', 'image/gif', '.image/png', '.image/jpeg', '.image/jpg', '.image/gif']
        if ((okContentTypes.contains(file?.getContentType())) || (!file)) {

            if (user.validate()) {
                println(user.email)
                println(user.hasErrors())
                user.save(flush: true)
                flash.messages = "sucessfully registered"
                session.user = user
                redirect(controller: "user", action: "index")

            } else {
                render view: '/login/index', model: [user: user]
            }
        } else {
            flash.errors = "Please choose valid iumage"
            redirect(controller: 'login', action: 'index')
        }

        // render user.errors.allErrors.collect { message(error: it) }.join(',')

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
    def subTopics(){
        if(session.user){

            render view: "/topic/show", model: [user:session.user, topics:Topic.findAllByCreatedBy(session.user)]
        }
    }

    def sendInvitation(String email, Long topicId) {
        if ((email) && (topicId)) {
            Topic topic = Topic.get(topicId)
            SendMailVO sendMailVO = new SendMailVO([
                    email  : email,
                    subject: " ${session.user.name} sent you a Subscription request",
                    body   : "please subscribe to the top: ${topic.topicName}"
            ])
            useService.sendmail(sendMailVO)
            flash.messages = "email sent successfully"
            render "sucess"
        } else {
            flash.errors = "email is not valid"
        }
    }

    def image(Long id) {
        User user = User.get(id)
        response.contentType = 'image/png' // or the appropriate image content type
        response.outputStream << user.photo
        response.outputStream.flush()
    }

    def changePassword(String email) {
        def response = [data: ""]
        try {
            useService.forgetpassemail(email)
            response.data = "Email sent successfully"
        } catch (NullPointerException e) {
            response.data = "email is not valid"
        }
        finally {
            render response as JSON
        }


    }

    def profile(ResourceSearchCO resourceSearchCO) {
        def searchString = params.userId
        params.max = Math.min(params.max ? params.int('max') : 1, 100)
        params.offset = (params.offset ? params.int('offset') :0)
        User user = User.get(searchString) //resourceSearchCO.user
        List<Topic> topicList = user?.getSubscribedTopic(params)
        if ((session.user == user) || (session.user.admin)) {
            render view: '/user/profile', model: [
                    user          : resourceSearchCO.user,
                    subtopics     : topicList,
                    subtopicscount: topicList.size()
            ]
        } else {
            topicList = topicList - topicList.findAll { it.visibility == Visibility.PUBLIC }
            render view: '/user/profile', model: [user: resourceSearchCO.user, subtopics:topicList, subtopicscount: topicList.size() ]
        }
    }


    def topics() {

    }

    def subscriptions() {

    }

    def list(UserSearchCO userSearchCO) {
        if (session.user.admin) {

        } else {
            redirect(controller: 'user', action: 'index')
        }
    }

    def toggleActive(Long id) {
        if (session.user.admin) {
            User user = User.get(id)
            user.active = !user.active
            user.save(flush: true)
        } else {
            redirect(controller: 'user', action: 'index')
        }
    }
}