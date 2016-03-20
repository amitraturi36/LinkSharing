package com.intelligrape.linksharing

class ApplicationFilterFilters {

    def filters = {
        all(controller: '*', action: '*') {
            before = {

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
                if (!session.user) {
                    redirect(controller: 'login', action: 'index')
                    return;
                }
            }

        }
        admincheck(controller: 'user', action: 'admin|changeActivation') {
            before = {
                Boolean isAdmin=User.get(session.user)
                if (!isAdmin) {
                    redirect(controller: 'login', action: 'index')
                    return;
                }
            }
        }
    }
}