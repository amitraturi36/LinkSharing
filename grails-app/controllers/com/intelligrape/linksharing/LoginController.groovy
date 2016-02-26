package com.intelligrape.linksharing

class LoginController {

    def index() {
        if (flash.error) {
            render "${flash.error}"
        } else if (session.status) {
            forward(controller: 'User', action: 'index')
        } else {
            List list = Resource.toppost()
            render  "Top posts are ${list}"

        }

    }

    def loginHandler(String username, String password) {
        if ((!username) && (!password)) {
            render "Please enter valid user or password"
        } else {
            User user = User.findByEmail(username, password)
            if (user) {
                if (!user.active) {
                    flash.error = "Your accoutn is not active"
                    redirect(action: "index")
                } else {
                    session.userName = user.userName
                    session.user = user.email
                    session.status = "LoggedIn"
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
