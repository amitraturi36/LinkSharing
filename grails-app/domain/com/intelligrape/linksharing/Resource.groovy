package com.intelligrape.linksharing

abstract class Resource {
    User createdBy
    String description
    Topic topic
    Date dateCreated
    Date lastUpdated
    RatingInfoVO ratingInfo
    static transients = ['ratingInfo']
    static hasMany = [ratings: ResourceRating, readingItems: ReadingItem]
    static belongsTo = [topic:Topic]

    static constraints = {
        description(type: 'text')
    }
    static mapping = {}

    def getRatingInfo() {
        if (!ratingInfo) {
            ratingInfo = Resource.resourceRater(this)
        }
        ratingInfo
    }

    static RatingInfoVO resourceRater(Resource resource) {
        List<ResourceRating> resourceList = ResourceRating.createCriteria().list {
            projections {
                sum "score"
                avg("score")
                count('id', "score")
            }
            eq('resource', Resource.get(resource.id))

        }

        return new RatingInfoVO(averageScore: resourceList[1], totalScore: resourceList[0], totalVotes: resourceList[2])
    }

    static def toppost() {
        List<Topic> topicList = ResourceRating.createCriteria().list {
            createAlias('resource', 'resc')
            createAlias('resource.topic', 'resctp')
            projections {
                groupProperty('resc.topic')
                count('id')
                property('resc.createdBy')
                property('resctp.visibility')
                property('resc.topic.id')

            }
            order('score')
        }
        List<TopicVO> topicVOList = []
        topicList.each { row ->
            topicVOList.add(new TopicVO(name: row[0], count: row[1], createdBy: row[2], visibility: row[3], id: row[4]))

        }

        return topicVOList
    }
     static def getTopPosts(){
         List <TopicVO> topicVOList=toppost()
         topicVOList=topicVOList-topicVOList.findAll{it.visibility==Visibility.PRIVIATE}
         return  topicVOList

     }
    void resourceType(){

    }



}
