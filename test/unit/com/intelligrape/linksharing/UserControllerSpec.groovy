package com.intelligrape.linksharing

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import grails.test.mixin.TestMixin
import grails.test.mixin.support.GrailsUnitTestMixin
import jdk.nashorn.internal.ir.annotations.Ignore
import org.springframework.stereotype.Controller
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
@TestFor(UserController)
@TestMixin(GrailsUnitTestMixin)
@Mock([UseService])
class UserControllerSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }
//     @Ignore
//    void "user Controller index action"(User user) {
//        given:
//        controller.session.user = user
//        when:
//        controller.index()
//        then:
//        response.contentAsString == "failure"
//
//    }


    void "change password"(){

        given:
        def mockuseService=Mock(UseService)
        controller.useService=mockuseService
        1*controller.useService.forgetpassemail(_)
       when:
       controller.changePassword(_ as String)
        def result =  response.json
       then:
       result.data=="Email sent successfully"

    }

}
