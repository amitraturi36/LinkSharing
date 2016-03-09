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

    def saveLinkResources(String url, Long topicId, String description) {

        if ((url) && (topicId)) {
            Topic topic = Topic.get(topicId)
            LinkResource linkResource = new LinkResource([
                    url        : url,
                    topic      : topic,
                    description: description,
                    createdBy  : topic.createdBy
            ])
            if (linkResource.save(flush: true, failOnError: true)) {
                flash.message = message(code: "topic.saved.message")
                render("sucess")
            } else {
                flash.message = message(error: "topic.not.saved.message")
            }

        } else {
            flash.message = message(code: "topic.not.saved.message")
            render "fails"
        }
        redirect(controller: 'user', action: 'index')


    }

    def delete(Long id) {
        def resources = Resource.load(id)
        if (!resources.delete(flush: true)) {

            flash.errors = "Successfully  deleted Post"
        } else {
            flash.errors = "Unable to delete Post"
            render view: "/user/index"
        }

    }

}