package com.intelligrape.linksharing

class ResourceController {

    def resourceService

    def search(ResourceSearchCO resourceSearchCO) {
        if (session.user?.admin == true) {
            if (resourceSearchCO.q) {
                render view: '/resource/search', model: [resource: resourceService.search(resourceSearchCO)]
            } else {

                Topic topic = Topic.get(resourceSearchCO.topicId)
                render view: '/resource/search', model: [resource: topic.resources]
            }
        }
       else if (resourceSearchCO.q) {
            if (session?.user) {
                Topic topic = Topic.get(resourceSearchCO.topicId)
                if (((topic.checksubscribeuser(session.user)) || (topic.visibility == Visibility.PUBLIC)) && (resourceSearchCO.q)) {
                    render view: '/resource/search', model: [resource: resourceService.search(resourceSearchCO)]
                } else {
                    redirect(controller: 'login', action: 'index')
                }
            } else {
                Topic topic = Topic.get(resourceSearchCO.topicId)
                if (topic.visibility == Visibility.PUBLIC) {
                    render view: '/resource/search', model: [resource: resourceService.search(resourceSearchCO)]
                } else {
                    redirect(controller: 'login', action: 'index')
                }
            }

        } else {
            redirect(controller: 'login', action: 'index')
        }
    }

    def show(Long id) {
        Topic topic = Topic.get(id)
        render view: 'resource', model: [resources: topic.resources, topic: topic]

    }
//    def show(ResourceSearchCO resourceSearchCo) {
//        Topic topic = Topic.findById(resourceSearchCo.topicId)
////        if (!topic) {
////            flash.errors = "topic not found"
////            if (session.user)
////                redirect(controller: "login", action: "index")
////
////        } else {
////            if (topic.visibility == Visibility.PRIVATE) {
////                if (topic.subscription.user.userName.find { it == session.userName }) {
////                    flash.message= "Sucess"
////                    render view: '/topic/show',model:[topic:topic]
////                } else {
////                    flash.error = "topic not Subscribed"
////                    if (session.user)
////                       redirect(controller: "login", action: "index")
////                }
////            } else {
////                render view: '/topic/show',model:[topic:topic]
////
////            }
////        }
//    }
//    def showResourceRating(Resource resource) {
//        render resource.ratingInfo
//    }
//
//    def resourceShow() {
//        List<TopicVO> topics = []
//        int i
//        2.times {
//            topics = Topic.getTrendingTopics(it)
//            i = 0
//            render "${topics[i++].createdBy}   ${topics[i++].name}  ${topics[i++].count}  ${topics[i++].id}  ${topics[i].visibility}<br/>"
//
//        }
//
//    }
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

    protected void addToReadingItems(Resource resource) {
        resource.topic.subscriptions.user.each {
            new ReadingItem(user: it, resource: resource, isRead: true).save(flush: true)
        }

    }
}