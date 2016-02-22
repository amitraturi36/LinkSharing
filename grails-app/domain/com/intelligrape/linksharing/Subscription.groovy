package com.intelligrape.linksharing

class Subscription {
    User user
    Topic topic
    Seriousness seriousness
    static belongsTo=[user:User]
    Date dateCreated

    static constraints = {
     topic unique: "user"

    }
    def afterInsert() {
        log.info "----------User is Subscribed------"
    }

}
