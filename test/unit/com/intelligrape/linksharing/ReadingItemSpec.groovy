package com.intelligrape.linksharing

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(ReadingItem)
class ReadingItemSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "Reading Item"(Resource resc, User usr, Boolean bool, Boolean result) {

        Resource resource
        User user
        Boolean isRead
        given:
        ReadingItem readingItem = new ReadingItem(user: usr, resource: resc, isRead: bool)
        expect:
        readingItem.validate() == result
        where:
        resc           | usr        | bool | result
        null           | new User() | true | false
        Mock(Resource) | new User() | true | true
    }
}
