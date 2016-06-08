package com.intelligrape.linksharing

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.web.multipart.commons.CommonsMultipartFile

class UserController {
//    def userService
    def useService
    def springSecurityService

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def index(SearchCO searchCO) {
        println ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
        User user = springSecurityService.currentUser
        params.max = Math.min(params.max ? params.int('max') : 5, 100)
        List<TopicVO> topicVOList = Topic.getTrendingTopics()
        List<Topic> topicList = user.getSubscribedTopic(params)
        List<Resource> resourceList = user.getUnReadResources(searchCO)

        render view: "index", model: [resources: resourceList, list: topicVOList, subtopics: topicList, subtopicscount: topicList.size(), user: user, resourcecount: resourceList.size(),topuser:User.topUser(),toptopic:useService.topTopic(),topresource:Resource.topresource()]
        // render view: "index", model: [list: userService.serviceMethod(), subtopics: session.user.subscribedTopic]
    }

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def register(UserCO userCO) {
        User user = new User([
                email          : userCO.email,
                firstName      : userCO.fname,
                lastName       : userCO.lname,
                username       : userCO.uname,
                password       : userCO.passwrd,
                confirmPassword: userCO.CnfrmPsswrd,
                enabled        : true,
                active         : true
        ])
        CommonsMultipartFile file = params.list("photo")?.getAt(0)
        user.photo = file?.bytes
        def okContentTypes = ['image/png', 'image/jpeg', 'image/jpg', 'image/gif', '.image/png', '.image/jpeg', '.image/jpg', '.image/gif']
        if ((okContentTypes.contains(file?.getContentType())) || (!file)) {

            if (user.validate()) {
                user.save(flush: true, validate: false)
                def userRole = Role.findByAuthority('ROLE_USER') ?: new Role(authority: 'ROLE_USER').save(failOnError: true)
                new UserRole(user, userRole).save()
                flash.messages = "sucessfully registered"
                springSecurityService.reauthenticate(user.username, user.password)
                //  springSecurityService.currentUser=user
                redirect(controller: 'login', action: 'auth')

            } else {
                render view: '/login/auth', model: [user: user]
            }
        } else {
            flash.errors = "Please choose valid iumage"
            redirect(controller: 'login', action: 'auth')
        }

        // render user.errors.allErrors.collect { message(error: it) }.join(',')

    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def showSubscribedTopics(Long id) {

        if (id) {
            Topic topic = Topic.get(id)
            List<User> user = topic.subscribedUser

            render view: "/topic/_show", model: [user: user, topics: topic]

        } else {
            flash.errors = "No such topic Exists"
            redirect(action: 'index')
        }

    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def subTopics() {
        if (springSecurityService.isLoggedIn()) {
            User user = springSecurityService.currentUser

            render view: "/topic/_show", model: [user: user, topics: Topic.findAllByCreatedBy(user)]
        }
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def sendInvitation(String email, Long topicId) {
        if ((email) && (topicId)) {
            User user = springSecurityService.currentUser
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

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def image(Long id) {
        User user = User.get(id)
        response.contentType = 'image/png' // or the appropriate image content type
        response.outputStream << user.photo
        response.outputStream.flush()
    }

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def changePassword(String email) {
        def response = [data: "", status: ""]
        try {
            useService.forgetpassemail(email)
            response.data = "Email sent successfully"
            response.status = 1
        } catch (NullPointerException e) {
            response.data = "email is not valid"
            response.status = 0;
        }
        finally {
            render response as JSON
        }


    }

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def profile(ResourceSearchCO resourceSearchCO) {
        def sessionUser = springSecurityService.currentUser
        def searchString = params.userId
        params.max = Math.min(params.max ? params.int('max') : 5, 100)
        params.offset = (params.offset ? params.int('offset') : 0)

        User user = User.get(searchString) //resourceSearchCO.user

        List<Topic> topicList = user?.getSubscribedTopic(params)
        List<Topic> userTopics = Topic.findAllByCreatedBy(user, [max: 5, offset: params.offset])

        if ((sessionUser)) {
           render(template:'/user/profilelogedinuser',model:[user           : resourceSearchCO.user,
                                                       subtopics      : topicList,
                                                       subtopicscount : topicList.size(),
                                                       usertopics     : userTopics,
                                                       usertopicscount: userTopics.size()])

        } else {

            render view: '/user/profile', model: [user           : resourceSearchCO.user,
                                                  subtopics      : topicList,
                                                  subtopicscount : topicList.size(),
                                                  usertopics     : userTopics,
                                                  usertopicscount: userTopics.size()]
        }
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def toggleActive(Long id) {
        Boolean isAdmin = springSecurityService.currentUser.admin
        if (isAdmin) {
            User user = User.get(id)
            user.active = !user.active
            user.save(flush: true)
        } else {
            redirect(controller: 'user', action: 'index')
        }
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def settings() {
        User user = springSecurityService.currentUser
        if (user) {
            render view: '/user/setting', model: [user: user]
        }
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def update(UserCO userCO) {
        User user = springSecurityService.currentUser
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

    @Secured(['ROLE_ADMIN'])
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
            user = User.createCriteria().list() {

                or {
                    ilike('firstName', "%${search}%")
                    ilike('lastName', "%${search}%")
                    ilike('email', "%${search}%")

                }
            }
        }
        user = user.findAll { (!it.admin) }
        render view: '/user/admin', model: [users: user, usercount: user.size()]
    }

    @Secured(['ROLE_ADMIN'])
    def changeActivation(Long uId, Integer status) {
        Boolean isAdmin = springSecurityService.currentUser.admin
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

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def checkUniqueUser(String userName, Integer status) {
        def message = [form1: "", form2: ""]
        if (status != null) {

            if (status == 1) {
                int user = User.countByUsername(userName)
                if (user) {
                    message.form2 = "User Already exits"
                }
            } else {
                int user = User.countByEmail(userName)
                if (user) {
                    message.form2 = "Email Already exits"
                }
            }
        } else {
            int user = User.countByEmail(userName)
            if (!user) {
                user = User.countByUsername(userName)
            }
            if (!user) {
                message.form1 = "User Does Not Exits"
            }
        }
        render message as JSON
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def inboxload() {

        User user = springSecurityService.currentUser
        if (user) {
            SearchCO searchCO = null
            render template: "/user/inbox_main_layout", model: [resources: user.getAllResources(), user: user]

        }
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def inbox(SearchCO searchCO, Integer status) {
        User user = springSecurityService.currentUser
        if (status == 1) {
            Date d = new Date()
            d.seconds = d.seconds - 5
            def resourceList = ReadingItem.createCriteria().list([max: 0, offset: 0]) {
                createAlias('resource', 'r')
                eq('user', user)
                eq('isRead', false)
                gt('r.dateCreated', d)
                order('r.dateCreated')
            }
            if (resourceList) {

                render template: "/user/inbox", model: [resources: user.getAllResources(), user: user]
            }

        } else {
            render template: "/user/inbox", model: [resources: user.getAllResources(searchCO), user: user]

        }
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def inboxbar() {
        User user = springSecurityService.currentUser
        SearchCO searchCO = null
        Date d = new Date()
        d.seconds = d.seconds - 10
        def resourceList = ReadingItem.createCriteria().list([max: 0, offset: 0]) {
            createAlias('resource', 'r')
            eq('user', user)
            eq('isRead', false)
            gt('r.dateCreated', d)
            order('r.dateCreated')
        }
        if (resourceList) {
            List<Resource> resourceList1 = user.getUnReadResources(searchCO)
            render template: "/user/inbox_top_bar", model: [resources: resourceList1, user: user, resourcecount: resourceList1.size()]
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
//    @Autowired(required = true)
//    CustomBean  myBean

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def test(User user) {
        //   render view: '/user/test'
        // render myBean.firstName
        // render customBean.firstName
//        UserSearchCO co=new UserSearchCO(firstName: "Amit")
//        render(User.search(co).listDistinct())

        //render myBean.properties
//       File file=new File("/home/amit/NarutoShippuudenEpisode459.mp4")
//      response.contentType = 'video/mp4' // or the appropriate image content type
//        file.eachByte {
//            response.outputStream << it
//            response.outputStream.flush()
//        }
render "file:///home/amit/NarutoShippuudenEpisode459.mp4"
    }


}