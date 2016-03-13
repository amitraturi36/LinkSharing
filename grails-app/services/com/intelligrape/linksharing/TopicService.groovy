package com.intelligrape.linksharing

import grails.transaction.Transactional

@Transactional
class TopicService {

    def serviceMethod() {

    }

    def search(ResourceSearchCO resourceSearchCO){
        List<Topic>topicList = Topic.createCriteria().list {

            ilike("topicName",'%'+resourceSearchCO.q+'%')

        }
        return topicList
    }


}
