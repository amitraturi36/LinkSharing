package com.intelligrape.linksharing

import grails.converters.JSON
import grails.util.Holders
import org.springframework.web.multipart.commons.CommonsMultipartFile

class UserController {
//    def userService
    def useService
    def index(SearchCO searchCO) {
        User user = User.get(session.user)
        params.max = Math.min(params.max ? params.int('max') : 1, 100)
        List<TopicVO> topicVOList = Topic.getTrendingTopics()
        List<Topic> topicList = user.getSubscribedTopic(params)
        render view: "index", model: [resources: user.getUnReadResources(searchCO), list: topicVOList, subtopics: topicList, subtopicscount: topicList.size(), user: user]
        // render view: "index", model: [list: userService.serviceMethod(), subtopics: session.user.subscribedTopic]
    }


    def register(UserCO userCO) {
        User user = new User([
                email          : userCO.email,
                firstName      : userCO.fname,
                lastName       : userCO.lname,
                userName       : userCO.uname,
                password       : userCO.passwrd,
                confirmPassword: userCO.CnfrmPsswrd,
                active         : true
        ])
        CommonsMultipartFile file = params.list("photo")?.getAt(0)
        user.photo = file?.bytes
        def okContentTypes = ['image/png', 'image/jpeg', 'image/jpg', 'image/gif', '.image/png', '.image/jpeg', '.image/jpg', '.image/gif']
        if ((okContentTypes.contains(file?.getContentType())) || (!file)) {

            if (user.validate()) {
                user.save(flush: true)
                flash.messages = "sucessfully registered"
                session.user = user.id
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

    def subTopics() {
        if (session.user) {
            User user = User.get(session.user)

            render view: "/topic/show", model: [user: user, topics: Topic.findAllByCreatedBy(user)]
        }
    }

    def sendInvitation(String email, Long topicId) {
        if ((email) && (topicId)) {
            User user = User.get(session.user)
            Topic topic = Topic.get(topicId)
            EmailDTO sendMailVO = new EmailDTO([
                    email  : email,
                    subject: " ${user.name} sent you a Subscription request",
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
        def response = [data: "",status:""]
        try {
            useService.forgetpassemail(email)
            response.data = "Email sent successfully"
            response.status=1
        } catch (NullPointerException e) {
            response.data = "email is not valid"
            response.status=0;
        }
        finally {
            render response as JSON
        }


    }

    def profile(ResourceSearchCO resourceSearchCO) {
        User sessionUser = User.get(session.user)
        def searchString = params.userId
        params.max = Math.min(params.max ? params.int('max') : 1, 100)
        params.offset = (params.offset ? params.int('offset') : 0)
        User user = User.get(searchString) //resourceSearchCO.user
        List<Topic> topicList = user?.getSubscribedTopic(params)
        List<Topic> userTopics = Topic.findAllByCreatedBy(user, [max: 5])
        if ((sessionUser?.id == user.id) || (sessionUser?.admin)) {
            render view: '/user/profile', model: [
                    user           : resourceSearchCO.user,
                    subtopics      : topicList,
                    subtopicscount : topicList.size(),
                    usertopics     : userTopics,
                    usertopicscount: userTopics.size()
            ]
        } else {
            topicList = topicList.findAll { it.visibility == Visibility.PUBLIC }
            userTopics = userTopics.findAll { it.visibility == Visibility.PUBLIC }
            render view: '/user/profile', model: [user           : resourceSearchCO.user,
                                                  subtopics      : topicList, subtopicscount: topicList.size(),
                                                  usertopics     : userTopics,
                                                  usertopicscount: userTopics.size()]
        }
    }


    def toggleActive(Long id) {
        Boolean isAdmin = User.get(session.user).admin
        if (isAdmin) {
            User user = User.get(id)
            user.active = !user.active
            user.save(flush: true)
        } else {
            redirect(controller: 'user', action: 'index')
        }
    }

    def settings() {
        User user = User.get(session.user)
        if (user) {
            render view: '/user/setting', model: [user: user]
        }
    }

    def update(UserCO userCO) {
        User user = User.get(session.user)
        if (user) {
            if ((userCO.fname)) {
                user.firstName = userCO.fname
            }
            if ((userCO.lname)) {
                user.lastName = userCO.lname
            }
            CommonsMultipartFile file = params.list("photo")?.getAt(0)
            def okContentTypes = ['image/png', 'image/jpeg', 'image/jpg', 'image/gif', '.image/png', '.image/jpeg', '.image/jpg', '.image/gif']
            if ((okContentTypes.contains(file?.getContentType())) || (!file)) {
                user.photo = file?.bytes
                if (user.validate()) {
                    user.merge(flush: true)
                    flash.messages = "sucessfully Updated"
                    session.user = user.id
                    redirect(controller: "user", action: "settings")

                } else {
                    render view: '/login/index', model: [user: user]
                }
            } else {
                flash.errors = "Please choose valid iumage"
                redirect(controller: 'login', action: 'index')
            }
        }


    }

    def admin(Integer selector, String search) {
        List<User> user
        if (selector == 1) {
            user = User.createCriteria().list(params) {

                or {
                    ilike('firstName', "%${search}%")
                    ilike('lastName', "%${search}%")
                    ilike('email', "%${search}%")

                }
                eq('active', true)
            }
        } else if (selector == 0) {
            user = User.createCriteria().list() {

                or {
                    ilike('firstName', "%${search}%")
                    ilike('lastName', "%${search}%")
                    ilike('email', "%${search}%")

                }
                eq('active', false)
            }
        } else {
            user = User.getAll()
        }
        user = user.findAll { (!it.admin) }
        render view: '/user/admin', model: [users: user, usercount: user.size()]
    }

    def changeActivation(Long uId, Integer status) {
        Boolean isAdmin = User.get(session.user)
        def message = [message: "", error: ""]
        if ((uId) && (isAdmin)) {
            User user = User.get(uId)
            if (status == 1) {
                user.active = true
                user.save(flush: true)
                message.message = "Succefully Activated The User"
            } else {
                user.active = false
                message.error = "Succefully Deactivated The User"
                user.save(flush: true)
            }
            render message as JSON
        }

    }

    def checkUniqueUser(String userName,Integer status) {
        def message = [form1: "", form2: ""]
        if(status!=null) {

            if (status == 1) {
                int user = User.countByUserName(userName)
                if (user) {
                    message.form2 = "User Already exits"
                }
            } else {
                int user = User.countByEmail(userName)
                if (user) {
                    message.form2 = "Email Already exits"
                }
            }
        }
        else {
            int user = User.countByEmail(userName)
            if(!user){
                user = User.countByUserName(userName)
            }
            if (!user) {
                message.form1 = "User Does Not Exits"
            }
        }
        render message as JSON
    }

    def inbox(SearchCO searchCO,Integer status) {
        User user = User.get(session.user)
        if (status == 1) {
            Date d=new Date()
            d.seconds=d.seconds-5
            def resourceList=  ReadingItem.createCriteria().list([max: 0, offset: 0]) {
                createAlias('resource','r')
                eq('user',user)
                eq('isRead',false)
                gt('r.dateCreated',d)
                order('r.dateCreated')
            }
             if(resourceList){
                 render template: "/user/inbox", model: [resources: user.getUnReadResources(searchCO), user: user]
             }

        } else {

            render template: "/user/inbox", model: [resources: user.getUnReadResources(searchCO), user: user]

        }
    }
//    def myBean
//    def    myBeanConstrctr
//    def beanTest(){
//
//        def c= Holders.applicationContext.getBean(CustomBean)
//            render myBean.firstName
//            render   c.firstName
//    }

    def test(){
        render view: '/user/test'
    }
}