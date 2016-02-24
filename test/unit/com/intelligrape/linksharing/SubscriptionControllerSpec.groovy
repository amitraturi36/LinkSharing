package com.intelligrape.linksharing

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import grails.test.mixin.TestMixin
import grails.test.mixin.support.GrailsUnitTestMixin
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(SubscriptionController)
@TestMixin(GrailsUnitTestMixin)
@Mock([Topic,User,Subscription])
class SubscriptionControllerSpec extends Specification {



    void "test To test save"() {
        given:
        User user = new User(email: "amit@gmail.com", password: "12345admin", firstName: "Amit", lastName: "Raturi", admin: true, active: true,confirmPassword:"12345admin")
        user.save()
        Topic topic=new Topic(topicName:"topic",createdBy: user,visibility: Visibility.PUBLIC  )

        topic.save()
        when:
        controller.save(topic.id)
        then:
        response.contentAsString=="Sucess"
    }
}
