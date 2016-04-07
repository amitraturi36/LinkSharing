package com.intelligrape.linksharing

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

class ResourceRatingController {
    def   springSecurityService
    @Secured(['ROLE_USER','ROLE_ADMIN'])
    def resourcerating(Long id,Integer score) {
        User user = springSecurityService.currentUser
        def message=[message:"",errors:""]
        if(score) {
            Resource resource = Resource.get(id)
            if (resource) {
                ResourceRating rating = ResourceRating.findByResourceAndCreatedBy(resource, user)
                println(rating)
                if (rating) {
                    rating.score = score


                    rating.save(flush: true)
                } else {
                    rating = new ResourceRating(createdBy: user, resource: resource, score: score)
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
