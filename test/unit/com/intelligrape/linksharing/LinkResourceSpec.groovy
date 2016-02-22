package com.intelligrape.linksharing

import grails.test.mixin.TestMixin
import grails.test.mixin.support.GrailsUnitTestMixin
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
@TestMixin(GrailsUnitTestMixin)
class LinkResourceSpec extends Specification {

    def setup() {
    }

    def cleanup() {

    }

    void "to String test"() {
        given:
        LinkResource linkResource=new LinkResource(url: "www.abc.com")
        expect:
        linkResource.toString()=="www.abc.com"

    }
}
