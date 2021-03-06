package com.intelligrape.linksharing

class ResourceController {

    def resourceService

    def search(ResourceSearchCO resourceSearchCO) {
        if (session.user?.admin == true) {
            if (resourceSearchCO.q) {
                List<Resource> resourceList = resourceService.search(resourceSearchCO, params)
                render view: '/resource/search', model: [resource: resourceList, resourcecount: resourceList.size(), q: resourceSearchCO.q]
            } else {

                Topic topic = Topic.get(resourceSearchCO.topicId)
                render view: '/resource/search', model: [resource: topic.resources, resourcecount: topic.resources.size(), q: resourceSearchCO.q]
            }
        } else if (resourceSearchCO.q) {
            if (session?.user) {
                Topic topic = Topic.get(resourceSearchCO.topicId)
                if (((topic.checksubscribeuser(session.user)) || (topic.visibility == Visibility.PUBLIC)) && (resourceSearchCO.q)) {
                    List<Resource> resourceList = resourceService.search(resourceSearchCO, params)
                    render view: '/resource/search', model: [resource: resourceList,]
                } else {
                    redirect(controller: 'login', action: 'index')
                }
            } else {
                Topic topic = Topic.get(resourceSearchCO.topicId)
                if (topic.visibility == Visibility.PUBLIC) {
                    List<Resource> resourceList = resourceService.search(resourceSearchCO, params)
                    render view: '/resource/search', model: [resource: resourceList, resourcecount: topic.resources.size(), q: resourceSearchCO.q]
                } else {
                    redirect(controller: 'login', action: 'index')
                }
            }

        } else {
            redirect(controller: 'login', action: 'index')
        }
    }

    def show(Long id,Integer status) {
        if((status==1)&&(id)){
            Resource resource=Resource.get(id)
            if(resource) {
                render view:'/resource/search', model: [resource: resource, flag: 1]
            }
        }
        else {
            Topic topic = Topic.get(id)
            render view:'show' , model: [resources: topic.resources, topic: topic]
        }

    }

    def delete(Long id) {
        def resources = Resource.load(id)
        if (resources.delete(flush: true)) {
            flash.errors = "Unable to delete Post"
            render "sucess"

        } else {
            if (resources.instanceOf(DocumentResource)) {
                resources.deleteFile()
            }
            flash.messages = "Successfully  deleted Post"
            render "fail"
        }

    }

    protected void addToReadingItems(Resource resource, User user) {
        resource.topic.subscriptions.user.each {
            if (it.id != user.id) {
                new ReadingItem(user: it, resource: resource, isRead: true).save(flush: true)
            }
        }

    }
}