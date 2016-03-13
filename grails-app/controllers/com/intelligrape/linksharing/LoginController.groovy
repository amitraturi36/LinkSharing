package com.intelligrape.linksharing

class LoginController {

    def index() {
        if (flash.error) {
            List list = Resource.toppost()
            render view: 'index', model: [list: list]
        } else if (session.user) {
            forward(controller: 'User', action: 'index')

        } else {
            List list = Resource.toppost()
            List list1=Resource.recentPost(3)
            render view: 'index', model: [list: list,recentpost:list1]


        }


    }

    def loginHandler(String username, String password) {
        if ((!username) && (!password)) {
            flash.errors = "Please enter valid user or password"
            redirect(action: "index")
        } else {
            User user = User.findByEmailAndPassword(username, password)
            if (user) {
                if (!user.active) {
                    flash.errors = "Your accoutn is not active"
                    redirect(action: "index")
                } else {
                    session.user = user
                    redirect(action: "index")
                }
            } else {
                flash.errors = "User not found"
                redirect(action: 'index')
            }
        }
    }

    def logout() {
        session.invalidate()
        forward(action: "index")

    }
}
