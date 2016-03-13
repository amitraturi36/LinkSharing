package com.intelligrape.linksharing

import grails.converters.JSON
import org.hibernate.ObjectNotFoundException


class SubscriptionController {


    def delete(Long id) {
        Topic topic=Topic.get(id)
        Subscription subscription = Subscription.findByTopicAndUser(topic, session.user)
        if((session.user!=subscription.topic.createdBy)) {
            try {
                subscription.delete(flush: true)
                render("Sucess")
            } catch (ObjectNotFoundException error) {
                flash.errors = error
            }
        }
        render "success"
    }

    def save(Long id) {
        Topic topic = Topic.get(id)
        User user = session.user
        Subscription subscription = new Subscription(topic: topic, user: user, seriousness: Seriousness.SERIOUS)

        if (subscription.validate()) {

            subscription.save(flush: true, failOnError: true)
        } else {
            flash.errors="fail to update seriousness"
        }
        render "success"
    }

    def update(Long subId, String seriousness) {
        def message=[error:"",message:""]
        Subscription subscription = Subscription.get(subId)
        subscription.seriousness = Seriousness.stringToEnum(seriousness)
        if (subscription.validate()) {
            subscription.save(flush: true, failOnError: true)
           message.message="successfully changed"

        } else {
            message.error = "fail to update seriousness"
        }
        render "sucess"
    }
}
