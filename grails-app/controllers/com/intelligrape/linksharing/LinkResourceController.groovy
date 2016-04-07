package com.intelligrape.linksharing

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
@Secured(['ROLE_USER','ROLE_ADMIN'])
class LinkResourceController extends ResourceController {
    def   springSecurityService
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
                User user = springSecurityService.currentUser
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
