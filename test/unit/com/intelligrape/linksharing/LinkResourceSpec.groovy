package com.intelligrape.linksharing

import grails.test.mixin.Mock
import grails.test.mixin.TestMixin
import grails.test.mixin.support.GrailsUnitTestMixin
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
@TestMixin(GrailsUnitTestMixin)
@Mock(LinkResource)
class LinkResourceSpec extends Specification {

    def setup() {
    }

    def cleanup() {

    }

    void "to String test"() {
        given:
        LinkResource linkResource = new LinkResource(url: "http://www.abc.com")
        expect:
        linkResource.toString() == "http://www.abc.com"

    }

    void "checking url validation  "(String url, Boolean result) {
        given:
        User user=new User()
        Topic topic=new Topic()
        LinkResource linkResource = new LinkResource(url: url,createdBy: user,topic: topic,description:"testing linksharing" )
        expect:
        linkResource.validate() == result
        where:
        url                  | result
        "http://www.abc.com" | true
        "wb"                 | false
        null                 | false
        " "                  | false


    }
}
