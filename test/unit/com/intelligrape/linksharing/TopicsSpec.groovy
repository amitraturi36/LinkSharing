package com.intelligrape.linksharing

import grails.test.mixin.TestFor
import org.junit.Ignore
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Topic)
class TopicsSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test Topics"(String testTopic, User crtBy, Visibility vsbl, Boolean result) {
        given:
        User user = new User();

        Topic topic = new Topic(topicName: testTopic, createdBy: crtBy, visibility: vsbl)
        expect:
        topic.validate() == result
        where:
        testTopic | crtBy      | vsbl                | result
        "history" | new User() | Visibility.PRIVIATE | true
        "history" | null       | null                | false

    }
//@Ignore
//    void "Checking Uniqueness"() {
//
//        setup:
//        User user = new User()
//        topic topic = new topic(topicName: "history", createdBy: user, visibility: Visibility.PRIVIATE)
//        when:
//        topic.save()
//
//        then:
//        topic.count() == 1
//
//        when:
//        topic topic2 = new topic(topicName: "history", createdBy: user, visibility: Visibility.PRIVIATE)
//        topic2.save()
//
//        then:
//        topic2.count() == 1
//        topic2.errors.allErrors.size() == 1
//        topic2.errors.getFieldErrorCount('createdBy') == 1
//    }

    void "to String test"() {

        given:
        User user = new User()
        Topic topic = new Topic(topicName: "history", createdBy: user, visibility: Visibility.PRIVIATE)
        expect:
        topic.toString() == "history"

    }

    void "String to Enum Test"() {

        given:
        User user = new User()
        Topic topic = new Topic(topicName: "history", createdBy: user, visibility: Visibility.PRIVIATE)
        expect:
        topic.visibility.stringToEnum("private").class == Visibility

    }
}
