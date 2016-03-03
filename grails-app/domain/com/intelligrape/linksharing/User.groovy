package com.intelligrape.linksharing


import java.sql.Blob

class User {
    String email
    String password
    String firstName
    String lastName
    Blob photo
    Boolean admin
    Boolean active
    Date dateCreated
    Date lastUpdated
    String confirmPassword
    static transients = ['userName', 'confirmPassword']

    String getUserName() {

        return [this.firstName, ' ', this.lastName].findAll { it }.join('')
    }
    static hasMany = [topic: Topic, subscriptions: Subscription, readingItems: ReadingItem, resources: Resource]


    static constraints = {
        email(unique: true, blank: false, email: true)
        password(blank: false, size: 5..15)
        firstName(blank: false)
        lastName(blank: false)
        photo(nullable: true)
        admin(nullable: true)
        active(nullable: true)
        confirmPassword(bindable: true, validator: { String val, User obj ->
            boolean result = false
            if (obj.id) {
                result = true
            } else {
                result = val == obj.password
            }
            return result
        })

    }

    def getSubscribedTopic() {
        List<Topic> topicList = Topic.createCriteria().list([max:5,offset:0]) {
            createAlias('subscription', 'sp')
            eq('sp.user', this)
//            subscription{
//                eq('user', this)
//            }
        }
        return topicList
    }

    @Override
    String toString() {
        return this.userName
    }
}