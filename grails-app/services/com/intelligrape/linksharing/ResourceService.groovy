package com.intelligrape.linksharing

import grails.transaction.Transactional

@Transactional
class ResourceService {

    def serviceMethod() {

    }

    def search(ResourceSearchCO resourceSearchCO){
        Topic topic=Topic.get(resourceSearchCO.topicId)
       List<Resource>resourceList = Resource.createCriteria().list {
            eq('topic',topic)
           ilike('description','%'+resourceSearchCO.q+'%')

        }
        return resourceList
    }
}
