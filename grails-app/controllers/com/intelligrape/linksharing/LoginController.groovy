package com.intelligrape.linksharing

import grails.converters.JSON
import grails.plugin.springsecurity.SpringSecurityUtils
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.authentication.AccountExpiredException
import org.springframework.security.authentication.CredentialsExpiredException
import org.springframework.security.authentication.DisabledException
import org.springframework.security.authentication.LockedException
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.security.web.WebAttributes

import javax.servlet.http.HttpServletResponse

class LoginController extends grails.plugin.springsecurity.LoginController {
    def authenticationTrustResolver

    /**
     * Dependency injection for the springSecurityService.
     */
    def springSecurityService

    /**
     * Default action; redirects to 'defaultTargetUrl' if logged in, /login/auth otherwise.
     */
    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def index() {
        if (springSecurityService.isLoggedIn()) {
            forward(controller: 'User', action: 'index')

        } else {
            redirect action: 'auth', params: params
        }
    }

    /**
     * Show the login page.
     */
    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def auth() {
        def config = SpringSecurityUtils.securityConfig


        if (springSecurityService.isLoggedIn()) {
            println "Logged In"
            forward(controller: 'user', action: 'index')
            return
        }
        String error
        String view = 'auth'
        String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
        if (params.login_error) {
            error="Username And Password is incorrect "
        }
        render view: view, model: [postUrl            : postUrl,
                                   rememberMeParameter: config.rememberMe.parameter,error: error]

    }

    /**
     * The redirect action for Ajax requests.
     */
    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def authAjax() {
        response.setHeader 'Location', SpringSecurityUtils.securityConfig.auth.ajaxLoginFormUrl
        response.sendError HttpServletResponse.SC_UNAUTHORIZED
    }

    /**
     * Show denied page.
     */
    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def denied() {
        if (springSecurityService.isLoggedIn() &&
                authenticationTrustResolver.isRememberMe(SecurityContextHolder.context?.authentication)) {
            // have cookie but the page is guarded with IS_AUTHENTICATED_FULLY
            redirect action: 'full', params: params
        }
    }

    /**
     * Login page for users with a remember-me cookie but accessing a IS_AUTHENTICATED_FULLY page.
     */
    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def full() {
        def config = SpringSecurityUtils.securityConfig
        render view: 'auth', params: params,
                model: [hasCookie: authenticationTrustResolver.isRememberMe(SecurityContextHolder.context?.authentication),
                        postUrl  : "${request.contextPath}${config.apf.filterProcessesUrl}"]
    }

    /**
     * Callback after a failed login. Redirects to the auth page with a warning message.
     */
    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def authfail() {

        String msg = ''
        def exception = session[WebAttributes.AUTHENTICATION_EXCEPTION]
        if (exception) {
            if (exception instanceof AccountExpiredException) {
                msg = g.message(code: "springSecurity.errors.login.expired")
            } else if (exception instanceof CredentialsExpiredException) {
                msg = g.message(code: "springSecurity.errors.login.passwordExpired")
            } else if (exception instanceof DisabledException) {
                msg = g.message(code: "springSecurity.errors.login.disabled")
            } else if (exception instanceof LockedException) {
                msg = g.message(code: "springSecurity.errors.login.locked")
            } else {
                msg = g.message(code: "springSecurity.errors.login.fail")
            }
        }

        if (springSecurityService.isAjax(request)) {
            render([error: msg] as JSON)
        } else {
            flash.message = msg
            redirect action: 'auth', params: params
        }
    }

    /**
     * The Ajax success redirect url.
     */
    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def ajaxSuccess() {
        render([success: true, username: springSecurityService.authentication.name] as JSON)
    }

    /**
     * The Ajax denied redirect url.
     */
    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def ajaxDenied() {
        render([error: 'access denied'] as JSON)
    }
}
