package com.intelligrape.linksharing

import grails.converters.JSON
import grails.transaction.Transactional
import org.springframework.web.multipart.commons.CommonsMultipartFile

class DocumentResourceController extends ResourceController {

    @Transactional
    def saveDocument(String description, Long topicId) {
        println(params.doc)
        if ((topicId) && (params.doc)) {
            CommonsMultipartFile file = params.list("doc")?.getAt(0)
            def document = new File("linksharing.documents.folderPath${file.originalFilename}${topicId}${User.randomnumbergenerator()}")
            document << file.bytes
            DocumentResource documentResource = new DocumentResource([
                    filePaths  : document.absolutePath,
                    topic      : Topic.get(topicId),
                    description: description,
                    createdBy  : session.user
            ])
            if (documentResource.validate()) {
                documentResource.save(flush: true, failOnError: true)
                println "success"
                render "success"
            } else {
                //   render documentResource.errors.allErrors
            }
        } else {
            //  render "fail"
        }
    }

    def download(Long resourceId) {
        def download = [download: "", resource: ""]
        DocumentResource resource = Resource.get(resourceId)
        if ((resource?.canViewedBy(resourceId, session.user.id) && (resource))) {
            download.download = 1
            download.resource = resource.filePaths
            render download as JSON
        } else {
            download.download = "resource is not accessible"
            render download as JSON
        }

    }
}

