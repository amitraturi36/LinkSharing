package com.intelligrape.linksharing

import org.hibernate.criterion.Order

class Topic {
    String topicName
    Visibility visibility
    User createdBy
    static hasMany = [subscriptions: Subscription, resources: Resource]
    static belongsTo = [createdBy: User]
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

    static List getTrendingTopics() {
        List<Resource> topicList = Resource.createCriteria().list {
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
        List<TopicVO> topicVO=[]
        int col
        topicList.size().times { row ->
            col = 0
            topicVO.add(new TopicVO(name: topicList[row][col++], count: topicList[row][col++], createdBy: topicList[row][col++], visibility: topicList[row][col++], id: topicList[row][col]))
        }

        return topicVO


    }

    def afterInsert() {
        log.info "----------Into After Insert------"

        Subscription subscription

        Topic.withNewSession {

            subscription = new Subscription(topic: this, user: this.createdBy, seriousness: Seriousness.VERYSERIOUS)
            if (!subscription.save()) {
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
