package com.intelligrape.linksharing

class LinkSharingTagLib {
    static defaultEncodeAs = [taglib: 'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
    static namespace = "ls"
    def showUserList = { attr, body ->
        if (session.user) {
          ReadingItem readingItem=ReadingItem.findAllByResource(attr.resource)
            if (readingItem.isRead){
                out<< "Read"
            }
            else{
                out<<"unRead"
            }
        }

    }
}
