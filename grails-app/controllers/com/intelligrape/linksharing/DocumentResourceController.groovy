package com.intelligrape.linksharing

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import org.springframework.web.multipart.commons.CommonsMultipartFile

class DocumentResourceController extends ResourceController {
    def   springSecurityService
    @Secured(['ROLE_USER','ROLE_ADMIN'])
    @Transactional
    def saveDocument(String description, Long topicId) {
        println(topicId)
        def message=[message:"",errors:""]
        User user = springSecurityService.currentUser
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
                    createdBy  : user
            ])
            if (documentResource.validate()) {
                message.message="successfully saved"
                documentResource.save(flush: true, failOnError: true)
                addToReadingItems(documentResource,user)
                render message as JSON
            } else {
               message.errors="Please Select Valid file "
                render message as JSON
            }
        } else {
            message.errors="Fail to upload Please select atleast a file "
            render message as JSON
        }


    }
    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def download(Long resourceId) {
        User user = springSecurityService.currentUser
        def download = [download: "", resource: ""]
        DocumentResource resource = Resource.get(resourceId)
        if ((resource?.canViewedBy(resourceId,user.id) && (resource))) {
            download.download = 1
            download.resource = "http://localhost:8080/"+resource.filePaths
            render download as JSON
        } else {
            download.download = "resource is not accessible"
            render download as JSON
        }

    }
}

