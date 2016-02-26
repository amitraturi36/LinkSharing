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
       User userobj= new User(firstName: "amit",lastName:"raturi",email:"amit@gmail",password:"1234567",confirmPassword: "1234567",active:true  )
               userobj.save(flush: true)
        def userMock=Mock(User)
        User user= userMock
        userMock.user.findAllByEmail("amit@gmail")<<userobj
        controller.loginHandler("amit@gmail","1234567")
        then:
        controller.response.redirectUrl=="login/index"


    }
}
