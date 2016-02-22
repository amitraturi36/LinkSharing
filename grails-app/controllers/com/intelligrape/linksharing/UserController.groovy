package com.intelligrape.linksharing

class UserController {
    String confirmPassword
    static constraints = {
        confirmPassword
    }

    def index() {

        render "user dahsboard ${session.userName}"
    }

    def show(String id) {
        def topic = Topic.findById(id)
        if (!topic) {
            flash.error = "Topic not found"
            if (session.status)
                redirect(controller: "login", action: "index")

        } else {
            if (topic.visibility == Visibility.PRIVIATE) {
                if (topic.subscriptions.user.firstName.contains(session.userName)) {
                    render "Sucess"
                } else {
                    flash.error = "Topic not Subscribed"
                    if (session.status)
                        redirect(controller: "login", action: "index")
                }
            } else {
                render "Sucess"
            }
        }
    }

    def register(String email, String fname, String lname, String passwrd, String CnfrmPsswrd, String uname) {
        User user = new User(email: email, firstName: fname, lastName: lname, password: passwrd, confirmPassword: CnfrmPsswrd)
        user.validate()
        render "${user.errors.allErrors.collect{it}.join("")}"


    }

}
