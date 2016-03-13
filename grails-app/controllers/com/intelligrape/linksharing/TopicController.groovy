package com.intelligrape.linksharing

import grails.converters.JSON
import org.hibernate.ObjectNotFoundException


class TopicController {
    def resourceService
    def topicService

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

    def read(ResourceSearchCO resourceSearchCo) {
        Topic topic = Topic.read(resourceSearchCo.topicId)
        render topic.toString()
    }

    def show(Topic topic) {
        if (topic && (topic.visibility == Visibility.PUBLIC || topic.checksubscribeuser(session.user))) {
            List<User> userList = topic.subscribedUser
            render view: 'show', model: [topic: topic, user: userList, resource: topic.resources]
        } else if (!topic) {
            flash.errors = "topic not found"
            redirect(controller: "login", action: "index")
        } else {
            redirect(controller: "login", action: "index")
        }
    }

    def save(String topicName, String visiblity) {
        if (topicName) {
            Topic topic = new Topic()
            topic.visibility = Visibility.stringToEnum(visiblity)
            topic.createdBy = session.user
            topic.topicName = topicName
            if (topic.save(flush: true, failOnError: true)) {
                flash.message = message(code: "topic.saved.message")
                render("sucess")
            } else {
                flash.message = message(code: "topic.not.saved.message")
            }

        } else {
            flash.message = message(code: "topic.not.saved.message")
        }

    }

    def search(ResourceSearchCO resourceSearchCO) {

        if (resourceSearchCO.q) {
            List<Topic> topicList = topicService.search(resourceSearchCO)
            List<Resource> resourceList = resourceService.search(resourceSearchCO)
            if (session.user) {
                if (topicList[0]) {
                    topicList = topicList.findAll {
                        (it.checksubscribeuser(session.user)) || (it.visibility == Visibility.PUBLIC)
                    }
                }
                if (resourceList[0]) {
                    resourceList = resourceList.findAll {
                        (it.topic.checksubscribeuser(session.user)) || (it.topic.visibility == Visibility.PUBLIC)
                    }
                }
                render view: '/topic/search', model: [resource: resourceList, topic: topicList]

            } else if (session.user) {
                if (session.user.admin) {
                    render view: '/topic/search', model: [resource: resourceList, topic: topicList]
                }
            } else {
                if (topicList[0]) {

                    topicList = topicList.findAll { it.visibility == Visibility.PUBLIC }
                }
                if (resourceList[0]) {
                    resourceList = resourceList.findAll { it.topic.visibility == Visibility.PUBLIC }
                }

                render view: '/topic/search', model: [resource: resourceList, topic: topicList]
            }
        } else {
            redirect(controller: 'login', action: 'index')
        }
    }

    def visiblity(Long topicId, String visiblity) {
        if ((topicId) && (visiblity)) {
            Topic topic = Topic.get(topicId)
            topic.visibility = Visibility.stringToEnum(visiblity)
            topic.save(flush: true)
            render("sucess")
        }

    }

    def update(Long topicId, String name) {
        if (session.user) {
            Topic topic = Topic.get(topicId)
            topic.topicName = name
            topic.save(flush: true)
            flash.message = "Succesfully edited the message"
            redirect(controller: 'user', action: 'index')
        } else {
            //  redirect(controller: 'login', action: 'index')
        }
    }

}


