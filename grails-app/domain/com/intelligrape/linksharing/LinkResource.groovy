package com.intelligrape.linksharing

class LinkResource extends Resource {
    String url
    static belongsTo=[resource:Resource]

    @Override
    String toString() {
        return this.url
    }
}
