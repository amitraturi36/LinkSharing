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
        List<TopicVO> topics = Topic.getTrendingTopics(0)
        int i
        2.times {
            i = 0
            render "${topics[i++].createdBy}   ${topics[i++].name}  ${topics[i++].count}  ${topics[i++].id}  ${topics[i].visibility}<br/>"
            topics = Topic.getTrendingTopics(5)
        }
    }
}