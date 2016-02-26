package com.intelligrape.linksharing


class DocumentResource extends Resource {
    String filePaths
    Date dateCreated
    Date lastUpdated
    static belongsto = [resource: Resource]


}
