package com.intelligrape.linksharing

class User {
    String email
    String password
    String firstName
    String lastName
    String userName
    byte[] photo
    Boolean admin
    Boolean active
    Date dateCreated
    Date lastUpdated
    String confirmPassword
    static transients = ['name', 'confirmPassword']

    String getName() {
        return this.firstName + ' ' + this.lastName
    }

    static hasMany = [topics: Topic, subscriptions: Subscription, readingItems: ReadingItem, resources: Resource]

    static mapping = {
//        subscriptions lazy: false
        photo(sqlType: "longblob")
    }

    static constraints = {
        userName(unique: true,blank: false)
        email(unique: true, blank: false, email: true)
        password(blank: false, size: 5..15)
        firstName(blank: false)
        lastName(blank: false)
        photo(nullable: true)
        admin(nullable: true)
        active(nullable: true)
        confirmPassword(bindable: true, validator: { String val, User obj ->
            boolean result = false
            if (obj.id) {
                result = true
            } else {
                result = val == obj.password
            }
            return result
        })

    }

    def getSubscribedTopic(params) {
        List<Topic> topicList = Topic.createCriteria().list([max: 5, offset: 0]) {
            createAlias('subscriptions', 'sp')
            eq('sp.user', this)
//            subscriptions{
//                eq('user', this)
//            }
        }
        return topicList
    }

    static boolean canDeleteResource(Long id, User user) {
        Resource resource = Resource.get(id)
        User tempuser = get(user.id)
        return resource.createdBy == tempuser || tempuser.admin

    }

    @Override
    String toString() {
        return this.name
    }

    static Long randomnumbergenerator() {
        Random random = new Random()
        return 100000 + random.nextInt(899999)
    }

    String getImageUrl() {

        return "/user/image/${this.id}"
    }

    Subscription getSubscription(Long id) {
        Topic topic = Topic.get(id)
        return Subscription.findByTopicAndUser(topic, this)
    }


    static namedQueries = {
        search {
            UserSearchCO co ->
                if (co.active == null) {
                    if (co.firstName) {
                        eq("firstName", co.firstName)
                    }
                    if (co.lastName) {
                        eq("lastName", co.lastName)
                    }
                    if (co.email) {
                        eq("email", co.email)
                    }
                }
                else if(co.active){
                    eq('active',co.active)
                    if (co.firstName) {
                        eq("firstName", co.firstName)
                    }
                    if (co.lastName) {
                        eq("lastName", co.lastName)
                    }
                    if (co.email) {
                        eq("email", co.email)
                    }
                }
                else{
                    eq('active',co.active)
                    if (co.firstName) {
                        eq("firstName", co.firstName)
                    }
                    if (co.lastName) {
                        eq("lastName", co.lastName)
                    }
                    if (co.email) {
                        eq("email", co.email)
                    }
                }
        }
    }

    def getUnReadResources(SearchCO searchCO){
        List<Resource>resourceList
        if(searchCO?.q){
            resourceList=  ReadingItem.createCriteria().list([max: 0, offset: 0]) {
                createAlias('resource','r')
                projections{
                    property('resource')
                }
                ilike('r.description','%'+searchCO.q+'%')
                eq('user',this)
                eq('isRead',false)

            }

        }else{
            resourceList=  ReadingItem.createCriteria().list(([max: 0, offset: 0])){
                projections{
                    property('resource')
                }
                eq('user',this)
                eq('isRead',false)

            }
        }
        return resourceList
    }
}