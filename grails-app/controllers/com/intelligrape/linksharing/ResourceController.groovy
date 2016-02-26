package com.intelligrape.linksharing

class ResourceController {

    def index() {}


    def search(ResourceSearchCO resourceSearchCO) {
        if (resourceSearchCO.q) {
            resourceSearchCO.visibilityString="public"

        }

    }
    def showResourceRating(Resource resource){
       render resource.ratingInfo
    }

    def resourceShow(){


    }
}