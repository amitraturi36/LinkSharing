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
            if ((readingItem?.user != attr.resource.createdBy) && (readingItem)) {
                if (readingItem.isRead) {
                    out << "<span Style='background-color:limegreen' >Read</span> "
                } else {
                    out << "<span Style='background-color:red' > <a onclick=\"read(${attr.resource?.id})\" id=\"${attr.resource?.id}\">Read</a></span> "
                }
            }
        }
    }
    def download = { attr, body ->
        if ((attr.resource) && (attr.resource.instanceOf(DocumentResource))) {
            out << "<span  onclick=download(${attr.resource?.id})>  <a id=\"resc${attr.resource?.id}\" ><span id=\"resc${attr.resource?.id}1\">DownLoad</span></a></span> "
        }
    }
    def link = { attr, body ->
        if ((attr.resource?.canViewedBy(attr.resource.id, session.user.id) && (attr.resource.instanceOf(LinkResource)))) {
            out << "<span><a href=\"${attr.resource?.url}\" target='_blank'>View Full Website</a></span>"
        }
    }
    def toptopics = {
        List list = Resource.toppost()
        list = list - list.visibility.findAll { it != Visibility.PRIVATE }
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
    def seriousness = { attr, body ->
        Topic topic = Topic.get(attr.topic)
        User user=User.get(session.user.id)

        Subscription subscription =user.getSubscription(attr.topic)
        if ((topic.subscribedUser.contains(session.user)) || (session.user.admin)) {
            out << "<select class=\"form-control\" name=\"seriousness\" id=\"sub${subscription.id}\" onclick=seriousnesschange(${subscription.id})>\n" +
                    "                        <option id=\"CASUAL\"value=\"casual\">Casual</option>\n" +
                    "                        <option id=\"SERIOUS\" value=\"serious\">Serious</option>\n" +
                    "                        <option id=\"VERY_SERIOUS\"value=\"very serious\">Very Serious</option>\n" +
                    "                    </select>"
        }

    }
    def visiblity = { attr, body ->
        Topic topic = Topic.get(attr.topic)
        if ((topic.subscribedUser.contains(session.user)) || (session.user.admin)) {
            out << "<select class=\"form-control\" id=\"topic${topic.id}\"  onclick=visiblitychange(${topic.id})>\n" +
                    "                        <option value=\"PUBLIC\">Public</option>\n" +
                    "                        <option value=\"PRIVATE\">Private</option>\n" +
                    "                    </select>"
        }
    }
    def userImage = { attrs, body ->
        if (attrs.user.photo) {
            out << "<img src=\"${attrs.user.imageUrl}\" alt=\"${attrs.alt}\" width=\"60px\" height=\"60px\"/>"
        } else {
            out << "<img src=${assetPath(src: 'user.png')} width=\"60px\" height=\"60px\"/>"
        }


    }
    def update = { attr, body ->
        Topic topic = Topic.get(attr.topic)
        if ((topic.subscribedUser.contains(session.user)) || (session.user.admin)) {
            out << " <a href=\"#\" class=\"glyphicon glyphicon-envelope\" style=\"padding:0px 7px;margin:0px 7px\"\n" +
                    "                               data-toggle=\"modal\" data-target=\"#myModal2\"></a>\n" +
                    "                            <g:render template=\"/topic/email\"></g:render>"
            if ((topic.createdBy==session.user) || (session.user.admin)) {
                out << " <a href=\"/resource/show?id=${attr.topic}\" class=\"glyphicon glyphicon-pencil\" style=\"padding:0px 7px;margin:0px 7px\"></a>"
            }
        }
    }
}