package com.intelligrape.linksharing

import org.hibernate.criterion.Order

import java.beans.Transient

class Topic {
    String topicName
    Visibility visibility
    User createdBy
    static hasMany = [subscription: Subscription, resources: Resource ]
    static belongsTo = [createdBy: User]
    static Transient=['subscribedUsers']
    static constraints = {


        topicName blank: false, unique: "createdBy"

    }
    static mapping = {
        sort "topicName"

    }


    @Override
    String toString() {

        return this.topicName;
    }


    static namedQueries = {
        search {
            ResourceSearchCO co ->
                if (co.topicId) {
                    eq("id", co.topicId)
                }
                if (co.visibility) {
                    like("visibility", co.visibility)
                }
        }
    }

    List <User> getSubscribedUser(){
        List <Subscription>userList=Subscription.createCriteria().list{
            eq('topic',this)

        }
        return userList*.user
    }

    static List getTrendingTopics(int offst) {
        List<Resource> topicList = Resource.createCriteria().list(max: 5, offset: offst) {
            createAlias('topic', 't')
            projections {
                groupProperty('topic')
                count('id', 'mycount')
                property('createdBy')
                property('t.visibility')
                property('t.id')
            }
            order('mycount')
            order('t.topicName')
        }
        List<TopicVO> topicVOList = []
        topicList.each { row ->
            topicVOList.add(new TopicVO(name: row[0], count: row[1], createdBy: row[2], visibility: row[3], id: row[4]))

        }

        return topicVOList


    }

    def afterInsert() {
        log.info "----------Into After Insert------"



        Topic.withNewSession {
            Subscription subscription
            if(!this.subscription) {
                subscription = new Subscription(topic: this, user: this.createdBy, seriousness: Seriousness.SERIOUS)
            }
            else{
                subscription= this.addToSubscription(topic:this,user:this.createdBy)
            }
                if (!subscription.save(flush:true,failOnError: true )) {
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
