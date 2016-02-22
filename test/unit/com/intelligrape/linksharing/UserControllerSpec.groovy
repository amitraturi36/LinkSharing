package com.intelligrape.linksharing

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(UserController)
class UserControllerSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "Login  Controller index action"() {
             given:
             LoginController logobj=new LoginController()
             when:
            logobj.index()
        then:
        response.contentAsString =="failure"

    }
    void  "Login Haldler"(){

    }

}
