package com.intelligrape.linksharing

class ResourceRating {
    Resource resource
    User createdBy
    Integer score

    static constraints = {
        score min: 1, max: 5
        createdBy(unique: "resource")
    }


}
