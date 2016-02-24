package com.intelligrape.linksharing

import org.hibernate.ObjectNotFoundException


class TopicController {

    def index() {


    }

    def delete(Long id) {
        Topic topic = Topic.load(id)
        try {
            topic.delete()
            flash.message = "Sucessfully Deleted"
        } catch (ObjectNotFoundException e) {
            flash.error = e
        }

    }

    def show(ResourceSearchCo resourceSearchCo) {
        Topic topic = Topic.read(resourceSearchCo.topicId)
        render topic.toString()
    }

    def save(Topic topic, String seriousness) {
        if (topic.createdBy.userName == session.userName) {
            if (topic.save(flush: true, failOnError: true)) {
                flash.message = "Topic is saved"


            } else {
                flash.message = "Topic is Not saved"

            }

        }

    }

    def search(ResourceSearchCo resourceSearchCo) {
       List <Topic> topicList=Topic.search(resourceSearchCo.topicId)
        render topicList.resources.description
    }

}


