package com.intelligrape.linksharing

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString
import org.hibernate.criterion.Projection
import org.hibernate.sql.Alias

@EqualsAndHashCode(includes = 'username')
@ToString(includes = 'username', includeNames = true, includePackage = false)
class User implements Serializable {

    private static final long serialVersionUID = 1

    transient springSecurityService

    String username
    String password
    String email
    String firstName
    String lastName
    byte[] photo
    Boolean admin
    Boolean active
    Date dateCreated
    Date lastUpdated
    String confirmPassword
    static transients = ['name', 'confirmPassword', 'springSecurityService']

    boolean enabled = true
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired
    static hasMany = [topics: Topic, subscriptions: Subscription, readingItems: ReadingItem, resources: Resource]

//	User(String username, String password) {
//		this.username = username
//		this.password = password
//	}

    Set<Role> getAuthorities() {
        UserRole.findAllByUser(this)*.role
    }

    def beforeInsert() {
        println "In before insert"
        encodePassword()

    }

    def beforeUpdate() {
        println "in before update"
        if (isDirty('password')) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
        confirmPassword = password
    }


    static constraints = {
        username blank: false, unique: true
        password blank: false
        email(unique: true, blank: false, email: true)
        password(blank: false)
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
                result = (val == obj.password)
            }
            return result
        })

    }

    static mapping = {
        password column: '`password`'
        photo(sqlType: "longblob")
    }

    String getName() {
        return this.firstName + ' ' + this.lastName
    }


    def getSubscribedTopic(params) {
        List<Topic> topicList = Topic.createCriteria().list([max: params.max, offset: params.offset]) {
            createAlias('subscriptions', 'sp')
            order('id')
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
            UserSearchCO co ->e
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
                } else if (co.active) {
                    eq('active', co.active)
                    if (co.firstName) {
                        eq("firstName", co.firstName)
                    }
                    if (co.lastName) {
                        eq("lastName", co.lastName)
                    }
                    if (co.email) {
                        eq("email", co.email)
                    }
                } else {
                    eq('active', co.active)
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

    def getUnReadResources(SearchCO searchCO) {

        List<Resource> resourceList

            resourceList = ReadingItem.createCriteria().list(([max: 10, offset: 0])) {
                createAlias('resource', 'r')
                projections {
                    property('resource')
                }
                eq('user', this)
                eq('isRead', false)
                order('r.lastUpdated', 'desc')
            }
        return resourceList
    }

    def getAllResources(SearchCO searchCO) {


        List<Resource> resourceList
        if (searchCO?.q) {
            resourceList = ReadingItem.createCriteria().list([max: 5]) {
                createAlias('resource', 'r')
                projections {
                    property('resource')
                }
                ilike('r.description', '%' + searchCO.q + '%')
                eq('user', this)
                order('r.lastUpdated', 'desc')


            }

        } else {
            resourceList = ReadingItem.createCriteria().list(([max: 0, offset: 0])) {
                createAlias('resource', 'r')
                projections {
                    property('resource')
                }
                eq('user', this)
                order('r.lastUpdated', 'desc')

            }
        }

        return resourceList
    }
 static  User topUser(){
      List <User> resourceList= Resource.createCriteria().list {
            createAlias('createdBy','cr')
           projections {
               property('createdBy')
           }
                max('cr.id')

        }

       return resourceList.flatten()[0]
    }

}
