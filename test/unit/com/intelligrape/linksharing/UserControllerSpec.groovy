package com.intelligrape.linksharing

import grails.test.mixin.TestFor
import grails.test.mixin.TestMixin
import grails.test.mixin.support.GrailsUnitTestMixin
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
@TestFor(UserControllerSpec)
@TestMixin(GrailsUnitTestMixin)
class UserControllerSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "user Controller index action"() {
        given:
        controller.session.status = "logged in"
        when:
        controller.index()
        then:
        response.contentAsString == "failure"

    }
}
