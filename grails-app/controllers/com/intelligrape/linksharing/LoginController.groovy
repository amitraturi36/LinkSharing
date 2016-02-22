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

    def loginHandler(String user,String password) {
    if((!user)&&(!password)) {
        render "Please enter valid user or password"
    }
        else {
        User userdata = User.findByEmail(user)
        if ((userdata.email == user) && (userdata.password == password)) {
            if (!userdata.active) {
                flash.error = "Your accoutn is not active"
                redirect(action: "index")
            } else {
                session.userName = userdata.userName
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
