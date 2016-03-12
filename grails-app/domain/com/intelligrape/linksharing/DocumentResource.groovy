package com.intelligrape.linksharing

class DocumentResource extends Resource {
    String filePaths
    Date dateCreated
    Date lastUpdated
    static belongsto = [resource: Resource]
    def contentType
    static Transient = ['contentType']
    static constraints = {

        contentType bindable: true, validator: { def val, User obj ->
            return val.getContentType() == Constants.DOCUMENT_CONTENT_TYPE
        }
    }
      @Override
    void deleteFile(){
       DocumentResource documentResource=get(this.id)
        File file=new File (documentResource.filePaths)
        file.delete()
    }

}
