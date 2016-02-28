package com.intelligrape.linksharing

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Subscription)
class SubscriptionSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test Subscription "() {
        given:
        Topic testTopics = new Topic()
        User testUser = new User()
        Subscription subscription1 = new Subscription(topics: testTopics, user: testUser)

        when:
        subscription1.save()

        then:
        subscription1.count() == 1

        when:
        Subscription subscription2 = new Subscription(topics: testTopics, user: testUser)
        subscription2.save()

        then:
        subscription2.count() == 1
        subscription2.errors.allErrors.size() == 1
        subscription2.errors.getFieldErrorCount('topics') == 1
    }
}
