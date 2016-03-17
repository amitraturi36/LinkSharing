package com.intelligrape.linksharing

class LinkSharingTagLib {
    //  static defaultEncodeAs = [taglib: 'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
    static namespace = "ls"
    def read = { attr, body ->
        if (session.user) {
            User user = User.get(session.user.id)
            if (user) {
                ReadingItem readingItem = ReadingItem.createCriteria().get {
                    eq('resource', attr.resource)
                    eq('user', user)
                }
                println(readingItem)
                if ((readingItem?.user?.id != attr.resource.createdBy.id) && (readingItem)) {
                    if (readingItem.isRead) {
                        out << "<span class=\"alert-success\" >Read</span> "
                    } else {
                        out << "<span class=\"alert-danger\" > <a onclick=\"read(${attr.resource?.id})\" id=\"${attr.resource?.id}\" style=\"cursor:pointer \">Read</a></span> "
                    }
                }
            }
        }
    }
    def download = { attr, body ->
        if ((attr.resource) && (attr.resource.instanceOf(DocumentResource))) {
            out << "<span  onclick=download(${attr.resource?.id})>  <a id=\"rescdownl${attr.resource?.id}\" style=\"cursor:pointer;text-decoration: none \"><span id=\"rescdownl${attr.resource?.id}1\">DownLoad</span></a></span> "
        }
    }
    def link = { attr, body ->
        if ((attr.resource?.canViewedBy(attr.resource.id, session.user.id) && (attr.resource.instanceOf(LinkResource)))) {
            out << "<span><a href=\"${attr.resource?.url}\" target='_blank' style=\"cursor:pointer;text-decoration: none \">View Full Website</a></span>"
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
        if (session.user) {
            Topic topic = Topic.get(attr.topic)
            User user = User.get(session.user.id)
            if ((topic.subscribedUser.contains(session.user)) || (session.user.admin)) {
                Subscription subscription = user.getSubscription(attr.topic)
                if ((topic.subscribedUser.contains(session.user)) || (session.user.admin)) {
                    out << "<select class=\"form-control\" name=\"seriousness\" id=\"sub${subscription.id}\" onclick=seriousnesschange(${subscription.id})>\n" +
                            "                        <option id=\"CASUAL\"value=\"casual\">Casual</option>\n" +
                            "                        <option id=\"SERIOUS\" value=\"serious\">Serious</option>\n" +
                            "                        <option id=\"VERY_SERIOUS\"value=\"very serious\">Very Serious</option>\n" +
                            "                    </select>"
                }
            }

        }
    }
    def visiblity = { attr, body ->
        if (session.user) {
            Topic topic = Topic.get(attr.topic)
            if ((topic.subscribedUser.contains(session.user)) || (session.user.admin)) {
                out << "<select class=\"form-control\" id=\"vistopic${topic.id}\"  onclick=visiblitychange(${topic.id})>\n" +
                        "                        <option value=\"PUBLIC\">Public</option>\n" +
                        "                        <option value=\"PRIVATE\">Private</option>\n" +
                        "                    </select>"
            }
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
        if (session.user) {
            Topic topic = Topic.get(attr.topic)
            if ((topic.subscribedUser.contains(session.user)) || (session.user.admin)) {
                out << " <a href=\"#\" class=\"glyphicon glyphicon-envelope\" style=\"text-decoration: none;cursor:pointer;padding:0px 7px;margin:0px 7px\"\n" +
                        "                               data-toggle=\"modal\" data-target=\"#myModal23\"></a>"
                out<< render(template:'/topic/email2',model:[topic: topic] )
                if ((topic.createdBy == session.user) || (session.user.admin)) {
                    out << " <a  data-toggle=\"modal\" data-target=\"#myModal3\" class=\"glyphicon glyphicon-pencil\" style=\"text-decoration: none;cursor:pointer;padding:0px 7px;margin:0px 7px\"></a>"
                    out << render(template: '/topic/topicedit', model: [topic: topic])
                }
            }
        }
    }
    def subscription = { attr, body ->
        if (session.user) {
            Topic topic = Topic.get(attr.topics)
            User user = User.get(session.user.id)
            if (user.id != topic.createdBy.id) {
                println(topic.checksubscribeuser(session.user))
                if (topic.checksubscribeuser(session.user)) {
                    out << "<a onclick=\"subscriptionstatus(${topic.id},'1')\"  class=\"usersub1${topic.id}\" style=\"text-decoration: none;cursor:pointer\">Unsubscribe</a>"
                } else {
                    out << "<a onclick=\"subscriptionstatus(${topic.id},'0')\"  class=\"usersub0${topic.id}\"  style=\"text-decoration: none;cursor:pointer\">Subscribe</a>"
                }

            }
        }
    }
    def candeletetopic = { attr, body ->
        if (session.user) {
            Topic topic = Topic.get(attr.topic)
            if ((topic.createdBy == session.user) || (session.user.admin)) {
                out << " <span class=\"glyphicon glyphicon-trash alert-link\" style=\"cursor:pointer;padding:0px 7px;margin:0px 7px\" onclick=topicdelete(${topic.id})></span>"
            }

        }
    }
    def resourcerater = { attr, body ->
        Resource resource = Resource.get(attr.resourceId)
        Topic topic = resource.topic
        String cssClass
        Integer score = resource.ratingInfo.averageScore
        if (score < 3) {
            cssClass = "alert-danger"
        } else if (score == 3) {
            cssClass = "alert-warning"
        } else {
            cssClass = "alert-success"
        }
        if (session.user) {
            if (Subscription.countByTopicAndUser(topic, session.user)) {
                out << "<div class=\"row\" style=\"padding-bottom:15px\">\n" +
                        "                                    <div class=\"col-xs-8\"></div>\n" +
                        "\n" +
                        "                                    <div class=\"col-xs-4\">\n" +
                        "                                        <select class=\"form-control ${cssClass}\" id=\"resc${resource.id}\"  name=\"score\"  onclick=\" resourcerating(${resource.id})\">\n" +
                        "                                            <option valuse=\" ${score}\">${score}Star</option>\n" +
                        "                                            <option value=\"1\">1 Star</option>\n" +
                        "                                            <option value=\"2\">2 Star</option>\n" +
                        "                                            <option value=\"3\">3 Star</option>\n" +
                        "                                            <option value=\"4\">4 Star</option>\n" +
                        "                                            <option value=\"5\">5 Star</option>\n" +
                        "                                        </select>\n" +
                        "                                    </div>\n" +
                        "                                </div>"
            } else {
                RatingInfoVO ratingInfoVO = Resource.resourceRater(resource)
                if (ratingInfoVO) {
                    ratingInfoVO.averageScore.times {
                        out << "<span class=\"glyphicon glyphicon-heart\" style=\"float:right\"></span>"
                    }
                } else {

                    out << "<span class=\"glyphicon glyphicon-heart\" style=\"float:right\"></span>"
                }
            }
        }else{
            RatingInfoVO ratingInfoVO = Resource.resourceRater(resource)
            if (ratingInfoVO) {
                ratingInfoVO.averageScore.times {
                    out << "<span class=\"glyphicon glyphicon-heart\" style=\"float:right\"></span>"
                }
            } else {

                out << "<span class=\"glyphicon glyphicon-heart\" style=\"float:right\"></span>"
            }
        }

    }
    def subscriptionCount = { attr, body ->
        if (attr.user) {
            User user = User.get(attr.user.id)
            if (user) {
                out << user.subscriptions.size()
            }
        } else if (attr.topic) {
            Topic topic = Topic.get(attr.topic)

            if (topic) {
                out << topic.subscriptions.size()
            }
        }
    }
    def resourceCount = { attr, body ->

        Topic topic = Topic.get(attr.topic)
        if (topic) {
            out << Resource.countByTopic(topic)
        }
    }
    def topicCount = { attr, body ->
        User user = User.get(attr.user)
        if (user) {
            out << Topic.countByCreatedBy(user)
        }
    }

}