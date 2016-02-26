package com.intelligrape.linksharing

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import grails.test.mixin.TestMixin
import grails.test.mixin.support.GrailsUnitTestMixin
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(LoginController)
@TestMixin(GrailsUnitTestMixin)
@Mock([Topic,User,Subscription])

class LoginControllerSpec extends Specification {


    void "test for Login Handler"() {
        when:
        new User(firstName: "amit",lastName: "raturi",email: "amit@gmail",password:"1234567",confirmPassword: "1234567" ).save(flush: true)
        controller.loginHandler("amit@gmail","1234567")
        then:
        response.getRedirectedUrl(controller:"login")


    }
}
