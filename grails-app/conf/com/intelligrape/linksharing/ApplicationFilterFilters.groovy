package com.intelligrape.linksharing

class ApplicationFilterFilters {
    def springSecurityService
    def filters = {
        all(controller: '*', action: '*') {
            before = {
                log.info("springSecurityService.isLoggedIn(): ${springSecurityService.isLoggedIn()}")
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
        sessionCheck(controller: '*', action: '*') {
            before = {
//                if(params) {
//                    log.info(params)
//                }
            }
        }
        loginCheck(controller: 'login', action: '*', invert: true) {
            before = {
//                if (!session.user) {
//                    redirect(controller: 'login', action: 'index')
//                    return;
//                }

            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
        useraccessiblitycheck(controller: 'resource | readingItem | resourceRating|subscription|topic|user', action: 'saveLinkResources|saveDocument|delete|save|index') {
            before = {
                if (!springSecurityService.isLoggedIn()) {
                    redirect(controller: 'login', action: 'index')
                    return;
                }
            }

        }
        admincheck(controller: 'user', action: 'admin|changeActivation') {

            before = {
                Boolean isAdmin = springSecurityService.currentUser.admin
                if (!isAdmin) {
                    redirect(controller: 'login', action: 'index')
                    return;
                }
            }
        }
    }
}