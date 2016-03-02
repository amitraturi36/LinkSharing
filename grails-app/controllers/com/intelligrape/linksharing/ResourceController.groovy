package com.intelligrape.linksharing

class ResourceController {

    def index() {}


    def search(ResourceSearchCO resourceSearchCO) {
        if (resourceSearchCO.q) {
            resourceSearchCO.visibilityString = "public"

        }

    }

    def showResourceRating(Resource resource) {
        render resource.ratingInfo
    }

    def resourceShow() {
        List<TopicVO> topics =[]
        int i
        2.times {
            topics = Topic.getTrendingTopics(it)
            i = 0
            render "${topics[i++].createdBy}   ${topics[i++].name}  ${topics[i++].count}  ${topics[i++].id}  ${topics[i].visibility}<br/>"

        }
    }
    def saveLinkResources(String url,Long topicId,String description){

        if ((url)&&(topicId)) {
            Topic topic=Topic.get(topicId)
         LinkResource linkResource=new LinkResource(url:url,topic:topic,description:description,createdBy:topic.createdBy)
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


    }
}