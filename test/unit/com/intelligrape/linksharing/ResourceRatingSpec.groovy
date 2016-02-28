package com.intelligrape.linksharing

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(ResourceRating)
class ResourceRatingSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "Rating"(Integer scoreTest, Boolean result) {

        given:
        User usr = new User()
        Resource resc = Mock(Resource)
        ResourceRating resourceRating = new ResourceRating(resource: resc, user: usr, score: scoreTest)
        expect:
        resourceRating.validate() == result
        where:
        scoreTest | result
        0         | false
        2         | true
        6         | false

    }

    void "Checking Uniqueness"() {

        setup:
        User usr = new User()
        Resource resc = Mock(Resource)
        ResourceRating resourceRating = new ResourceRating(resource: resc, user: usr, score: 3)
        when:
        resourceRating.save()

        then:
        resourceRating.count() == 1

        when:
        ResourceRating resourceRating2 = new ResourceRating(resource: resc, user: usr, score: 3)
        resourceRating2.save()

        then:
        resourceRating2.count() == 1
        resourceRating2.errors.allErrors.size() == 1
        resourceRating2.errors.getFieldErrorCount('user') == 1
    }
}
