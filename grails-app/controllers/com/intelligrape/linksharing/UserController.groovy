package com.intelligrape.linksharing

class UserController {
    String confirmPassword
    static constraints = {
        confirmPassword
    }

    def index() {

        render "user dahsboard ${session.userName}"
    }


    def register(String email, String fname, String lname, String passwrd, String CnfrmPsswrd, String uname) {
        User user = new User(email: email, firstName: fname, lastName: lname, password: passwrd, confirmPassword: CnfrmPsswrd)
        user.validate()
        render "${user.errors.allErrors.collect { it }.join("")}"


    }

}
