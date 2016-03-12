package com.intelligrape.linksharing

import org.hibernate.ObjectNotFoundException


class TopicController {

    def delete(Long id) {
        Topic topic = Topic.load(id)
        try {
            topic.delete()
            flash.message = "Sucessfully Deleted"
        } catch (ObjectNotFoundException e) {
            flash.errors = e
        }
        redirect(action: 'index')

    }

    def read(ResourceSearchCO resourceSearchCo) {
        Topic topic = Topic.read(resourceSearchCo.topicId)
        render topic.toString()
    }

    def show(Topic topic) {
        if (topic && (topic.visibility == Visibility.PUBLIC || topic.checksubscribeuser(session.user))) {
            List<User> userList = topic.subscribedUser
            render view: 'show', model: [topic: topic, user: userList]
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
        List<Topic> topicList = Topic.search(resourceSearchCO).list()
        render topicList.resources.description

    }

    def visiblity(Long topicId, String visiblity) {
        if ((topicId) && (visiblity)) {
            Topic topic = Topic.get(topicId)
            topic.visibility = Visibility.stringToEnum(visiblity)
            topic.save(flush: true)
        }
    }


}


