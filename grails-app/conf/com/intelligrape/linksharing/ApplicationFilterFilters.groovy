package com.intelligrape.linksharing

class ApplicationFilterFilters {

    def filters = {
        all(controller:'*', action:'*') {
            before = {

            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
        sessionCheck(controller:'*', action:'*') {


        }
        loginCheck(controller:'user',action: '*') {

            before = {

                if(!session.status){
                    redirect(controller:'login',action: 'index' )
                }

            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
