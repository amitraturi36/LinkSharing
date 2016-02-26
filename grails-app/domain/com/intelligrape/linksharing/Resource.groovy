package com.intelligrape.linksharing

abstract class Resource {
    User createdBy
    String description
    Topic topic
    Date dateCreated
    Date lastUpdated
    RatingInfoVO ratingInfo
    static transients =['ratingInfo']
    static hasMany = [ratings: ResourceRating, readingItems: ReadingItem]
    static belongsTo = [topic: Topic]

    static constraints = {
        description(type: 'text')
    }

    def getRatingInfo(){
        if(!ratingInfo){
            ratingInfo = Resource.resourceRater(this)
        }
        ratingInfo
    }

    static  RatingInfoVO resourceRater (Resource resource) {
        List<ResourceRating> resourceList = ResourceRating.createCriteria().list{
            projections {
                sum "score"
                avg("score")
               count('id', "score")
            }
            eq('resource', Resource.get(resource.id))

        }

      return  new RatingInfoVO(averageScore:resourceList[1],totalScore:resourceList[0],totalVotes:resourceList[2])
    }

}
