package com.intelligrape.linksharing

import grails.converters.JSON
import grails.transaction.Transactional

class LinkResourceController extends ResourceController {
    @Transactional
    def saveLinkResources(String url, Long topicId, String description) {
        def message=[message:"",errors:""]
        if ((url) && (topicId)) {
            Topic topic = Topic.get(topicId)
            LinkResource linkResource = new LinkResource([
                    url        : url,
                    topic      : topic,
                    description: description,
                    createdBy  : topic.createdBy
            ])
            if (linkResource.validate()) {
                User user = User.get(session.user)
                linkResource.save(flush: true, failOnError: true)
                message.message = "Link Resource Saved Successfully"
              addToReadingItems(linkResource,user)
                render message as JSON

            } else {
              message.errors = "Link Resource  Not Saved"
                render message as JSON
            }

        } else {
            message.errors = "Link URL can't be blank "
            render message as JSON
        }


    }

}
