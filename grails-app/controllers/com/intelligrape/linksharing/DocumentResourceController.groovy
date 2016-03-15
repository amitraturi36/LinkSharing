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
             String filePath = getGrailsApplication().config.LinkSharing.documents.folderPath
             String fileName=file.originalFilename.trim()+topicId+User.randomnumbergenerator()
             String path=filePath+fileName
            def document = new File(path)
            document << file.bytes
            DocumentResource documentResource = new DocumentResource([
                    filePaths  : fileName,
                    topic      : Topic.get(topicId),
                    description: description,
                    createdBy  : session.user
            ])
            if (documentResource.validate()) {
                flash.messages="successfully saved"
                documentResource.save(flush: true, failOnError: true)
                addToReadingItems(documentResource,session.user)
                redirect(controller:'user',action: 'index' )
            } else {
               flash.errors="fail to upload"
                redirect(controller:'user',action: 'index' )
            }
        } else {
            flash.errors="fail to upload"
            redirect(controller:'user',action: 'index' )
        }


    }

    def download(Long resourceId) {
        def download = [download: "", resource: ""]
        DocumentResource resource = Resource.get(resourceId)
        if ((resource?.canViewedBy(resourceId, session.user.id) && (resource))) {
            download.download = 1
            download.resource = "http://localhost:8080/"+resource.filePaths
            render download as JSON
        } else {
            download.download = "resource is not accessible"
            render download as JSON
        }

    }
}

