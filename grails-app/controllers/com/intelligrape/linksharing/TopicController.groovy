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
            render view: 'show', model: [topic: topic, user: userList, resource: topic.resources]
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
            List<Resource> resourceList = resourceService.globalsearch(resourceSearchCO, params)
            User user = springSecurityService?.currentUser
            if (user) {
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

            } else if (user) {
                if (user.admin) {
                    render view: '/topic/search', model: [resource: resourceList, topic: topicList, resourcecount: resourceList.size(), q: resourceSearchCO.q]
                }
            } else {
                if (topicList[0]) {

                    topicList = topicList.findAll { it.visibility == Visibility.PUBLIC }
                }
                if (resourceList[0]) {
                    resourceList = resourceList.findAll { it.topic.visibility == Visibility.PUBLIC }
                }

                render view: '/topic/search', model: [resource: resourceList, topic: topicList, resourcecount: resourceList.size(), q: resourceSearchCO.q]
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

}


