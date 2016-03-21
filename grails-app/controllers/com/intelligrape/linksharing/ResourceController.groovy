package com.intelligrape.linksharing

class ResourceController {

    def resourceService

    def search(ResourceSearchCO resourceSearchCO) {
        User user = User.get(session.user)
        if (user?.admin) {
            if (resourceSearchCO.q) {
                List<Resource> resourceList = resourceService.search(resourceSearchCO, params)
                render view: '/resource/search', model: [resource: resourceList, resourcecount: resourceList.size(), q: resourceSearchCO.q]
            } else {

                Topic topic = Topic.get(resourceSearchCO.topicId)
                render view: '/resource/search', model: [resource: topic.resources, resourcecount: topic.resources.size(), q: resourceSearchCO.q]
            }
        } else if (resourceSearchCO.q) {
            if (user) {
                Topic topic = Topic.get(resourceSearchCO.topicId)
                if (((topic.checksubscribeuser(user)) || (topic.visibility == Visibility.PUBLIC)) && (resourceSearchCO.q)) {
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
    def postSearch(ResourceSearchCO resourceSearchCO) {
        println(resourceSearchCO.topicId)
        User  user=User.get(session.user)
        if((resourceSearchCO.topicId)){
            Topic topic=Topic.get(resourceSearchCO.topicId)
            if(topic) {
               def resourceList
                if (resourceSearchCO.q) {
                    resourceList = resourceService.search(resourceSearchCO, params)


                }else{
                   resourceList=topic.resources


                }
                render template: "/topic/post", model: [topic: topic, resource: resourceList]
            }
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
                new ReadingItem(user: it, resource: resource, isRead: false).save(flush: true)
                new ResourceRating(createdBy:it,resource: resource,score:1).save(flush: true)
            }
        }

    }
}