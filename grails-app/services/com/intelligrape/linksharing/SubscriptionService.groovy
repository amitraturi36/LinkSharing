package com.intelligrape.linksharing

import grails.transaction.Transactional

@Transactional
class SubscriptionService {

    def serviceMethod() {

    }
    def search(TopicSearchCO topicSearchCo ){
        Topic topic=Topic.get(topicSearchCo.topicId)
      return  topic.subscribedUser
    }
}
