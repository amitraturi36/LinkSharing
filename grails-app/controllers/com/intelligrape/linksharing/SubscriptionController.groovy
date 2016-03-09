package com.intelligrape.linksharing

import org.hibernate.ObjectNotFoundException


class SubscriptionController {


    def delete(Long id) {
        Subscription subscription = Subscription.load(id)
        try {
            subscription.delete(flush: true)
            render("Sucess")
        } catch (ObjectNotFoundException error) {
            flash.errors = error
        }
        redirect(controller:'user' , action: 'index')
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
        redirect(controller:'user' , action: 'index')
    }

    def update(Long id, Seriousness seriousness) {
        Subscription subscription = Subscription.get(id)
        subscription.seriousness = seriousness
        if (subscription.validate()) {
            subscription.save(flush: true, failOnError: true)
        } else {
            flash.errors = "fail to update seriousness"
        }
        redirect(controller:'user' , action: 'index')
    }
}
