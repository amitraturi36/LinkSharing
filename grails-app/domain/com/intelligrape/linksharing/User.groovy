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
    static transients = ['name', 'confirmPassword']

    String getName() {
        return this.firstName + ' ' + this.lastName
    }

    static hasMany = [topic: Topic, subscriptions: Subscription, readingItems: ReadingItem, resources: Resource]

    static mapping = {
//        subscriptions lazy: false
    }

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
        List<Topic> topicList = Topic.createCriteria().list([max: 5, offset: 0]) {
            createAlias('subscription', 'sp')
            eq('sp.user', this)
//            subscription{
//                eq('user', this)
//            }
        }
        return topicList
    }

    static boolean canDeleteResource(Long id, User user) {
        Resource resource = Resource.get(id)
        User tempuser = get(user.id)
        return resource.createdBy == tempuser || tempuser.admin

    }

    @Override
    String toString() {
        return this.name
    }
}