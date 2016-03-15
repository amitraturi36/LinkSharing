package com.intelligrape.linksharing

import grails.converters.JSON

class ResourceRatingController {

    def resourcerating(Long id,Integer score) {
        def message=[message:"",errors:""]
        Resource resource =Resource.get(id)
        if(resource){
           ResourceRating rating= ResourceRating.findByResourceAndCreatedBy(resource,session.user)
            if(rating){
                rating.score=score

            }
            else{
               rating=new ResourceRating(createdBy:session.user,resource:resource,score:score)
            }
            message.message="successfully changed Ratings"
        }
        else{
            message.error="Something went wrong"
        }
          render message as JSON

    }

}
