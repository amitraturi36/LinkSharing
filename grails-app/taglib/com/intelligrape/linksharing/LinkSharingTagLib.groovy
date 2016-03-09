package com.intelligrape.linksharing

class LinkSharingTagLib {
    //  static defaultEncodeAs = [taglib: 'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
    static namespace = "ls"
    def read = { attr, body ->
        User user = User.get(session.user.id)
        if (user) {

            ReadingItem readingItem = ReadingItem.createCriteria().get {
                eq('resource', attr.resource)
                eq('user', user)
            }
            if (attr.resource.instanceOf(LinkResource)) {


                if ((readingItem?.user != attr.resource.createdBy) && (readingItem)) {
                    if (readingItem.isRead) {
                        out << "<div Style='background-color:limegreen' class='readitem'><a href=\"${attr.resource?.url}\" target='_blank'>View Full Website</a></div> "
                    } else {
                        out << "<div Style='background-color:red'> <a href=\"${attr.resource?.url}\" target='_blank'>View Full Website </a></div> "
                    }
                } else {
                    out << "<div> <a href=\"${attr.resource?.url}\" target='_blank'>View Full Website </a></div> "
                }

            } else {
                if ((readingItem?.user != attr.resource.createdBy) && (readingItem)) {
                    if (readingItem.isRead) {
                        out << "<div Style='background-color:limegreen'><a href=\"${attr.resource?.filePaths}\" target='_blank'>Download</a></div> "
                    } else {
                        out << "<div Style='background-color:red'> <a href=\"${attr.resource?.filePaths}\" target='_blank'>Download</a></div> "
                    }
                } else {
                    out << "<div> <a href=\"${attr.resource?.filePaths}\" target='_blank'>DownLoad </a></div> "
                }

            }
        }

    }
    def toptopics = {
        List list = Resource.toppost()
        out << render(template: '/topic/toppost', model: [list: list])
    }
    def trndngtopics = {
        List<TopicVO> topicVOList = Topic.getTrendingTopics(0)
        render(template: '/user/trendingtopics', model: [list: topicVOList, subtopics: session.user.subscribedTopic])


    }
    def canDeleteResource = { attr, body ->
        if (User.canDeleteResource(attr.resource.id, session.user)) {

            out << body()
        }

    }
}
