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
}