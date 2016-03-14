package com.intelligrape.linksharing

class LinkResource extends Resource {
    String url
    static belongsTo = [topic: Topic]
    static constraints = {
        url url: true
    }

    @Override
    String toString() {
        return this.url
    }
}
