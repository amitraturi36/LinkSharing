package com.intelligrape.linksharing

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import org.hibernate.ObjectNotFoundException


class TopicController {
    def resourceService
    def topicService
    def springSecurityService

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def delete(Long topicId) {
        def message = [message: "", error: ""]
        Topic topic = Topic.load(topicId)
        try {
            topic.delete(flush: true)
            message.message = "Topic Sucessfully Deleted"
        } catch (ObjectNotFoundException e) {
            message.error = e
        }
        render message as JSON

    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def topicLoad(Integer status) {
        User user = springSecurityService.currentUser
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        params.offset = (params.offset ? params.int('offset') : 0)
        List<Topic> topicList
        if (status) {
            if (status == 1) {
                topicList = user.getSubscribedTopic(params)
                render(template: '/user/subscribedtopics', model: [subtopics: topicList, subtopicscount: topicList.size(), user: user])
            } else if (status == 2) {
                topicList = Topic.findAllByCreatedBy(user, [max: 5, offset: params.offset])
                render(template: '/user/subscribedtopics', model: [subtopics: topicList, subtopicscount: topicList.size(), user: user])
            } else {
                Set<User> userList = user.topics.subscriptions.user.flatten() as Set<User>
                render(template: '/user/subscribeduser', model: [subtopicusers: userList, topicusercount: userList.size(), subscribedtopiccount: userList.subscriptions.flatten().size(), user: user])

            }
        }


    }

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def read(ResourceSearchCO resourceSearchCo) {
        Topic topic = Topic.read(resourceSearchCo.topicId)
        render topic.toString()
    }

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def show(Topic topic) {
        User user = springSecurityService.currentUser
        if (topic && (topic.visibility == Visibility.PUBLIC || topic.checksubscribeuser(user))) {
            List<User> userList = topic.subscribedUser
            render template: 'show', model: [topic: topic, userList: userList, resource: topic.resources, user: springSecurityService.getCurrentUser()]
        } else if (!topic) {
            flash.errors = "topic not found"
            redirect(controller: "login", action: "auth")
        } else {
            redirect(controller: "login", action: "auth")
        }
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def save(String topicName, String visiblity) {
        if (topicName) {
            User user = springSecurityService.currentUser
            Topic topic = new Topic()
            topic.visibility = Visibility.stringToEnum(visiblity)
            topic.createdBy = user
            topic.topicName = topicName
            if (topic.save(flush: true, failOnError: true)) {
                flash.messages = "successfully Saved"
                redirect(controller: 'user', action: 'index')
            } else {
                flash.messages = message(code: "topic.not.saved.message")
                redirect(controller: 'user', action: 'index')
            }

        } else {
            flash.messages = message(code: "topic.not.saved.message")
            redirect(controller: 'user', action: 'index')
        }

    }

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def search(ResourceSearchCO resourceSearchCO) {
        if (resourceSearchCO.q) {
            List<Topic> topicList = topicService.search(resourceSearchCO)
            List<Resource> resourceList = resourceService.globalsearch(resourceSearchCO, params) as List<Resource>
            User user = springSecurityService?.currentUser
            if (user?.admin) {

                render view: '/topic/search', model: [resource: resourceList, topic: topicList, resourcecount: resourceList.size(), q: resourceSearchCO.q]

            } else if (user) {
                if (topicList[0]) {
                    topicList = topicList.findAll {
                        (it.checksubscribeuser(user)) || (it.visibility == Visibility.PUBLIC)
                    }
                }

                if (resourceList[0]) {
                    resourceList = resourceList.findAll {
                        (it.topic.checksubscribeuser(user)) || (it.topic.visibility == Visibility.PUBLIC)
                    }
                }
                render view: '/topic/search', model: [resource: resourceList, topic: topicList, resourcecount: resourceList.size(), q: resourceSearchCO.q]

            } else {
                if (topicList) {

                    topicList = topicList.findAll { it.visibility == Visibility.PUBLIC }
                }
                if (resourceList) {

                    resourceList = resourceList.findAll { it.topic.visibility == Visibility.PUBLIC }
                }

                render view: '/topic/search', model: [resource: resourceList, subtopics:topicList, resourcecount: resourceList.size(), q: resourceSearchCO.q]
            }
        } else {
            redirect(controller: 'login', action: 'auth')
        }
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def visiblity(Long topicId, String visiblity) {
        if ((topicId) && (visiblity)) {
            Topic topic = Topic.get(topicId)
            topic.visibility = Visibility.stringToEnum(visiblity)
            topic.save(flush: true)
            render("sucess")
        }

    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def update(Long topicId, String name) {
        User user = springSecurityService.currentUser
        if (user) {
            Topic topic = Topic.get(topicId)
            topic.topicName = name
            topic.save(flush: true)
            topic.refresh()
            flash.message = "Succesfully edited the message"
            redirect(controller: 'user', action: 'index')
        } else {
            //  redirect(controller: 'login', action: 'index')
        }
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def subTopic(SearchCO searchCO) {
        User user = springSecurityService.currentUser
        params.max = Math.min(params.max ? params.int('max') : 5, 100)
        params.offset = (params.offset ? params.int('offset') : 0)
        List<TopicVO> topicVOList = Topic.getTrendingTopics()
        List<Topic> topicList = user.getSubscribedTopic(params)
        topicList = user.getSubscribedTopic(params)
        render(template: '/user/subscribedtopics', model: [subtopics: topicList, subtopicscount: topicList.size(), user: user])
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def createdTopic(SearchCO searchCO) {
        User user = springSecurityService.currentUser
        params.max = Math.min(params.max ? params.int('max') :5, 100)
        params.offset = (params.offset ? params.int('offset') : 0)
        List<Topic> topicList
        topicList = Topic.findAllByCreatedBy(user, [max: params.max, offset: params.offset])
        render(template: '/user/subscribedtopics', model: [subtopics: topicList, subtopicscount: topicList.size(), user: user])
    }
    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def trendingTopic(){
        List<TopicVO> topicVOList = Topic.getTrendingTopics()
        User user = springSecurityService.currentUser
        render(template: '/user/trendingtopics',model:[trendingtopics:topicVOList,subtopicscount:topicVOList.size(), user: user] )
    }
}


