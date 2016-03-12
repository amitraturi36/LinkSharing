package com.intelligrape.linksharing

class ResourceController {


    def search(ResourceSearchCO resourceSearchCO) {
        if (resourceSearchCO.q) {
            resourceSearchCO.visibilityString = "public"

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