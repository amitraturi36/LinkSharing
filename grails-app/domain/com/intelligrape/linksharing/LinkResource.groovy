package com.intelligrape.linksharing

class LinkResource extends Resource {
    String url
    static belongsTo = [resource: Resource,topic: Topic]
    static constraints = {
        url url: true
    }

    @Override
    String toString() {
        return this.url
    }
}
