package com.intelligrape.linksharing

import grails.transaction.Transactional

@Transactional
class ResourceService {

    def serviceMethod() {

    }

    def search(ResourceSearchCO resourceSearchCO,Params){
        println(resourceSearchCO.q)
        Topic topic=Topic.get(resourceSearchCO.topicId)
       List<Resource>resourceList = Resource.createCriteria().list {
            eq('topic',topic)
           ilike('description','%'+resourceSearchCO.q+'%')

        }
        return resourceList
    }
    def globalsearch(ResourceSearchCO resourceSearchCO,params){
        Topic topic=Topic.get(resourceSearchCO.topicId)
        List<Resource>resourceList = Resource.createCriteria().list([max: 0, offset: 0]) {
            ilike('description','%'+resourceSearchCO.q+'%')

        }
        return resourceList
    }


}
