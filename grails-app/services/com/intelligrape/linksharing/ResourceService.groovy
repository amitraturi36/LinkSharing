package com.intelligrape.linksharing

import grails.transaction.Transactional

@Transactional
class ResourceService {

    def serviceMethod() {

    }

    def search(ResourceSearchCO resourceSearchCO){
        Topic topic=Topic.get(resourceSearchCO.user)
       List<Resource>resourceList = Resource.createCriteria().list {
            eq('topic.createdBy',resourceSearchCO.user)

        }
        return resourceList
    }
}
