package com.intelligrape.linksharing

class Topic {
    String topicName
    Visibility visibility
    User createdBy
    static hasMany = [subscriptions: Subscription, resources: Resource]
    static belongsTo = [createdBy: User]
    static constraints = {


        topicName blank:false,unique: "createdBy"

    }

    @Override
    String toString() {

        return this.topicName;
    }

    def afterInsert() {
        log.info "----------Into After Insert------"

         Subscription subscription

        Topic.withNewSession {

         subscription= new Subscription(topic: this , user: this.createdBy,seriousness:Seriousness.VERYSERIOUS)
            if (!subscription.save())
            {
                log.error(subscription.errors)
            }



        }


    }

    def beforeInsert() {
        log.info "----------Into before Insert------"
    }

    def beforeValidate() {
        log.info "----------Into before Validate------"
    }

}
