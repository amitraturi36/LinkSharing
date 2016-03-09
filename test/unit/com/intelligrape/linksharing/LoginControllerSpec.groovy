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
@Mock([Topic, User, Subscription])

class LoginControllerSpec  {


    void "test for Login Handler"() {
        setup:
        User.metaClass.'static'.findByEmailAndPassword = { def email, def password ->
            return new User(active: true)
        }
        controller.loginHandler("amit@gmail", "1234567")
        then:
        response.redirectedUrl == "/login/index"


    }
}
