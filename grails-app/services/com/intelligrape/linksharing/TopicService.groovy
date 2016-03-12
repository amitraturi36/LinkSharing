package com.intelligrape.linksharing

import grails.transaction.Transactional

@Transactional
class TopicService {

    def serviceMethod() {

    }
def search(TopicSearchCO topicSearchCO){
     return Topic.findAllByCreatedBy(topicSearchCO.user)
}


}
