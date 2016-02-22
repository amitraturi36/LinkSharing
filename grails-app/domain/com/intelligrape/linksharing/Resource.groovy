package com.intelligrape.linksharing

abstract class Resource {
    User createdBy
    String description
    Topic topic
    Date dateCreated
    Date lastUpdated
    static hasMany =[ratings:ResourceRating,readingItems:ReadingItem]
    static belongsTo = [topic:Topic]

    static constraints = {
        description(type: 'text')
    }
}
