package com.intelligrape.linksharing

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class TestController {

    def abc() { render "hi" }

    def abcd() { render "hey" }
}
