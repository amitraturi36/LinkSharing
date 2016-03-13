import com.intelligrape.linksharing.*

class BootStrap {
    def grailsApplication
    def init = {
        createUser()
        createTopics()
        createResources()
        subscribeTopics()
        createReadingItems()
        createResourceRatings()

    }

    void createUser() {
        Integer count = User.count()
        if (count == 0) {

            User user = new User([
                    email          : "user1@gmail.com",
                    password       : Constants.PASSWORD,
                    firstName      : "Bhuwan",
                    lastName       : "brijwasi",
                    admin          : false,
                    active         : false,
                    confirmPassword: Constants.PASSWORD
            ])

            User admin = new User([
                    email          : "amit@gmail.com",
                    password       : Constants.PASSWORD,
                    firstName      : "Amit",
                    lastName       : "Raturi",
                    admin          : true,
                    active         : true,
                    confirmPassword: Constants.PASSWORD
            ])



            if (user.save(failOnError: true, flush: true) && (admin.save(failOnError: true, flush: true))) {
                log.info("save is successfull")
            } else {
                log.error("save failed")
            }
        } else {
            log.error("User alredy exist")
        }


    }


    void createTopics() {

        User creater
        Topic topic
        if (!Topic.count()) {
            User.getAll().each {
                creater = it
                5.times {
                    topic = new Topic([
                            topicName : "topic ${it + 1}",
                            createdBy : creater,
                            visibility: Visibility.PRIVATE
                    ])
                    if (!topic.save(flush: true)) {
                        log.error(topic.errors)
                    }

                }
            }


        }

    }

    void createResources() {
        Resource linkResource
        Resource documentResource
        if (!Resource.count()) {
            Topic.getAll().each
                    { topic ->
                        2.times {
                            linkResource = new LinkResource([
                                    topic      : topic,
                                    createdBy  : topic.createdBy,
                                    description: "description ${topic.topicName} LinkResource${it}",
                                    url        : "http://www.url.com"
                            ])
                            documentResource = new DocumentResource([
                                    topic      : topic,
                                    createdBy  : topic.createdBy,
                                    description: "description ${topic.topicName} documentResource ${it}",
                                    filePaths  : "file:///home/amit/temp${it}.txt"
                            ])
                            if (!linkResource.save()) {
                                log.error(linkResource.errors)
                            }
                            if (!documentResource.save()) {
                                log.error(documentResource.errors)
                            }
                        }
                    }
        }
    }

    void subscribeTopics() {
        Subscription subscription
        Topic.getAll().each { topic ->
            User.getAll().each {
                if (topic.createdBy != it) {
                    subscription = new Subscription([
                            topic      : topic,
                            user       : it,
                            seriousness: Seriousness.CASUAL
                    ])
                    if (!subscription.save(flush: true)) {
                        log.error(subscription.errors)
                    }

                }
            }
        }


    }

    void createReadingItems() {
        ReadingItem readingItem

        Subscription.getAll().each {
            Resource.findAllByTopic(it.topic).each { resource ->
                if ((resource.createdBy != it.user) && (!ReadingItem.countByUserAndResource(it.user, resource))) {
                    readingItem = new ReadingItem(user: it.user, resource: resource, isRead: false)
                    if (!readingItem.save()) {
                        log.error(readingItem.errors)
                    }
                }

            }

        }


    }

    void createResourceRatings() {
        ResourceRating rating


        ReadingItem.getAll().each {
            if (!it.isRead) {

                rating = new ResourceRating([
                        createdBy: it.user,
                        resource : it.resource,
                        score    : 1
                ])
                if (!rating.save()) {
                    log.error(rating.errors)
                }
            }

        }

    }


    def destroy = {
    }
}
