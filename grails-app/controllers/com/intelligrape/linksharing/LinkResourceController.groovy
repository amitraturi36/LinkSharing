package com.intelligrape.linksharing

import grails.transaction.Transactional

class LinkResourceController extends ResourceController {
    @Transactional
    def saveLinkResources(String url, Long topicId, String description) {
        if ((url) && (topicId)) {
            Topic topic = Topic.get(topicId)
            LinkResource linkResource = new LinkResource([
                    url        : url,
                    topic      : topic,
                    description: description,
                    createdBy  : topic.createdBy
            ])
            if (linkResource.validate()) {
                linkResource.save(flush: true, failOnError: true)
                flash.messages = "Saved Successfully"
              addToReadingItems(linkResource)
               redirect(controller:'user',action:'index'  )
            } else {
              flash.errors = "Link Resource  Not Saved"
              redirect(controller:'user',action:'index'  )
            }

        } else {
            flash.message = message(code: "topic.not.saved.message")
            redirect controller:'login',action: ' index'
        }


    }

}
