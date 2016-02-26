package com.intelligrape.linksharing

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import grails.test.mixin.TestMixin
import grails.test.mixin.support.GrailsUnitTestMixin
import spock.lang.IgnoreRest
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
@TestFor(TopicController)
@TestMixin(GrailsUnitTestMixin)
@Mock([Topic,Subscription])
class TopicControllerSpec extends Specification {
    void "Topic is getting saved"() {
        given:
        controller.session.userName = "Amit Raturi"
        User user=new User(firstName:'Amit',lastName: 'Raturi' )
        Topic topic=new Topic(topicName: "topic12",createdBy:user,visibility:Visibility.PRIVIATE )
        when:
        controller.save(topic,"public")
        then:
        flash.message=="topic.saved.message"
    }

    void "Deletion of topic"() {
        given:
        User user=new User(firstName:'Amit',lastName: 'Raturi' )
        Topic topic=new Topic(topicName: "topic12",createdBy:user,visibility:Visibility.PRIVIATE )
        topic.save()
        when:
        controller.delete(1)
        then:
        flash.message=="Sucessfully Deleted"

    }
}
