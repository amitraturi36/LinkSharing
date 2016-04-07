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
    static belongsTo = [topic: Topic]

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

    static def resourceRater(Resource resource) {
        List<Long> resourceList = ResourceRating.createCriteria().list {
            projections {
                sum "score"
                avg("score")
                count('id', "score")
            }
            eq('resource', resource)

        }

        return new RatingInfoVO(averageScore: resourceList[0][1], totalScore: resourceList[0][0], totalVotes: resourceList[0][2])

    }

    static def toppost() {
       def topicList = ResourceRating.createCriteria().list {
            createAlias('resource', 'resc')
            createAlias('resource.topic', 'resctp')
            projections {
                groupProperty('resc.topic')
                count('id')
                property('resc.createdBy')
                property('resctp.visibility')
                property('resc.topic.id')
                property('resc.description')

            }
            order('score')
        }
        List<TopicVO> topicVOList = []
        topicList.each { row ->
            topicVOList.add(new TopicVO(name: row[0], count: row[1], createdBy: row[2], visibility: row[3], id: row[4],description: row[5]))

        }

        return topicVOList
    }

    static def getTopPosts() {
        List<TopicVO> topicVOList = toppost()
        topicVOList = topicVOList - topicVOList.findAll { it.visibility == Visibility.PRIVATE }
        return topicVOList

    }

    Boolean canViewedBy(Long resourceId, Long userId) {
        Resource resource = Resource.get(resourceId)
        Topic topic = resource.topic
        return topic.canViewedBy(userId)


    }

    void deleteFile() {

        log.error("this will be implemented in linkresource")
    }

    static def recentPost(Integer status) {
        Date date = new Date()
        List<Resource> list
        if (status == 1) {
            list = Resource.createCriteria().list([max: 5, offset: 0]) {
                gt('dateCreated', date - 7)
                order('dateCreated')
            }
        } else if (status == 2) {
            list = Resource.createCriteria().list([max: 5, offset: 0]) {
                gt('dateCreated', date - date.date)
                order('dateCreated')
            }
        } else {
            date.date=1
            date.month=0
            list = Resource.createCriteria().list([max: 5, offset: 0]) {
                gt('dateCreated', date - date.date + 1)
                order('dateCreated')
            }
        }
        return list.findAll { it.topic.visibility.PUBLIC }
    }


}
