package com.intelligrape.linksharing

class Subscription {
    User user
    Topic topic
    Seriousness seriousness
    static belongsTo = [user: User]
    Date dateCreated

    static constraints = {
        user unique: 'topic'
    }
    static mapping = {
        seriousness defaultValue: Seriousness.SERIOUS
    }

    def afterInsert() {
        log.info "----------User is Subscribed------"
    }

}
