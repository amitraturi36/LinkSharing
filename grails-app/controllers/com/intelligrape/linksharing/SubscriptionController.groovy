package com.intelligrape.linksharing

import org.hibernate.ObjectNotFoundException

class SubscriptionController {


    def delete(Long id) {

        User user = User.get(session.user)
        Topic topic = Topic.get(id)

        if (topic?.createdBy?.id == user?.id) {
            flash.errors = "creator of topic cnnot unsubscribe"

        } else {
            Subscription subscription = Subscription.findByTopicAndUser(topic, user)
                   topic.resources.each {
                ReadingItem readingItem=ReadingItem.findByResourceAndUser(it,user)
                readingItem?.delete(flush:  true)
            }
            try {
                subscription.delete(flush: true)
            } catch (ObjectNotFoundException error) {
                flash.errors = error
            }
        }
        render template:"/user/inbox",  model: [resources: user.getUnReadResources(new SearchCO()),user: user]
    }

    def save(Long id) {
        Topic topic = Topic.get(id)
        User user = User.get(session.user)
        Subscription subscription = new Subscription(topic: topic, user: user, seriousness: Seriousness.SERIOUS)
        if (subscription.validate()&&(!topic?.subscriptions?.contains(subscription))) {

            subscription.save(flush: true, failOnError: true)
            ReadingItem readingItem
            topic?.resources?.each {
              new ReadingItem(user: user,resource: it,isRead: false).save(flush: true)
            }

        } else {
            flash.errors = "fail to update Subscription"
        }

        render template:"/user/inbox",  model: [resources: user.getUnReadResources(new SearchCO()),user: user]
    }

    def update(Long subId, String seriousness) {
        def message = [error: "", message: ""]
        Subscription subscription = Subscription.get(subId)
        subscription.seriousness = Seriousness.stringToEnum(seriousness)
        if (subscription.validate()) {
            subscription.save(flush: true, failOnError: true)
            message.message = "successfully changed"

        } else {
            message.error = "fail to update seriousness"
        }
        render "sucess"
    }
}
