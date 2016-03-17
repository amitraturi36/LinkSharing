package com.intelligrape.linksharing

import grails.converters.JSON

class ResourceRatingController {

    def resourcerating(Long id,Integer score) {
        def message=[message:"",errors:""]
        if(score) {
            Resource resource = Resource.get(id)
            if (resource) {
                User user = session.user
                ResourceRating rating = ResourceRating.findByResourceAndCreatedBy(resource, user)
                println(rating)
                if (rating) {
                    rating.score = score


                    rating.save(flush: true)
                } else {
                    rating = new ResourceRating(createdBy: session.user, resource: resource, score: score)
                    rating.save(flush: true)
                    resource.addToRatings(rating)

                }
                message.message = "successfully changed Ratings"
            } else {
                message.error = "Something went wrong"
            }
        }
          render message as JSON

    }

}
