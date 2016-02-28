package com.intelligrape.linksharing

class LoginController {

    def index() {
        if (flash.error) {
            render "${flash.error}"
        } else if (session.user) {
            forward(controller: 'User', action: 'index')

        } else {
            List list = Resource.toppost()
          render  view:'index',model:[list:list]


        }

    }

    def loginHandler(String username, String password) {
        if ((!username) && (!password)) {
            render "Please enter valid user or password"
        } else {
            User user = User.findByEmailAndPassword(username, password)
            if (user) {
                if (!user.active) {
                    flash.error = "Your accoutn is not active"
                    redirect(action: "index")
                } else {
                    session.user = user
                    redirect(action: "index")
                }
            } else {
                flash.error = "User not found"
                render flash.error
            }
        }
    }

    def logout() {
        session.invalidate()
        forward(action: "index")

    }
}
