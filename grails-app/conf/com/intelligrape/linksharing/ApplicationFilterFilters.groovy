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
//                }

            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
