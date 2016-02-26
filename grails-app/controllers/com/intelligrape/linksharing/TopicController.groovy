package com.intelligrape.linksharing

import org.hibernate.ObjectNotFoundException


class TopicController {

    def index() {


    }

    def test() {}

    def delete(Long id) {
        Topic topic = Topic.load(id)
        try {
            topic.delete()
            flash.message = "Sucessfully Deleted"
        } catch (ObjectNotFoundException e) {
            flash.error = e
        }

    }

    def read(ResourceSearchCO resourceSearchCo) {
        Topic topic = Topic.read(resourceSearchCo.topicId)
        render topic.toString()
    }

    def show(ResourceSearchCO resourceSearchCo) {
        Topic topic = Topic.findById(resourceSearchCo.topicId)
        if (!topic) {
            flash.error = "Topic not found"
            if (session.status)
                redirect(controller: "login", action: "index")

        } else {
            if (topic.visibility == Visibility.PRIVIATE) {
                if (topic.subscriptions.user.userName.find{it==session.userName}) {
                    render "Sucess"
                } else {
                    flash.error = "Topic not Subscribed"
                    if (session.status)
                        redirect(controller: "login", action: "index")
                }
            } else {
                render "Sucess"
            }
        }
    }

    def save(Topic topic, String seriousness) {
        if (topic.createdBy.userName == session.userName) {
            Subscription.findByTopic(topic).seriousness=Seriousness.stringToEnum(seriousness)
            if (topic.save(flush: true, failOnError: true)) {
                flash.message = message(code: "topic.saved.message")
            } else {
                flash.message = message(code: "topic.not.saved.message")
            }

        }

    }

    def search(ResourceSearchCO resourceSearchCO) {
        List <Topic> topicList = Topic.search(resourceSearchCO).list()
        render topicList.resources.description

    }

}


