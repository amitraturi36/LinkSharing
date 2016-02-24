package com.intelligrape.linksharing

import sun.security.pkcs11.Session

class LoginController {

    def index() {
        if(session.status)
        {
            forward(controller: 'User',action: 'index')
        }
          else  if(flash.error)
        {
            render "${flash.error}"
        }
        else {
            render "failure"


        }

    }

    def loginHandler(String username,String password) {
    if((!username)&&(!password)) {
        render "Please enter valid user or password"
    }
        else {
        User user= User.findByEmail(username,password)
        println user.email
        if (user) {
            if (!user.active) {
                flash.error = "Your accoutn is not active"
                redirect(action: "index")
            } else {
                session.userName = user.userName
                session.status = "LoggedIn"
                redirect(action: "index")
            }
        } else {
            flash.error = "User not found"
            render flash.error
        }
    }
    }

    def logout(){
        session.invalidate()
        forward(action: "index")

    }
}
