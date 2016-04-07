package com.intelligrape.linksharing
class CustomBean {
    static scope = "prototype"
    String firstName

    void setFirstName(String firstName) {
        this.firstName = firstName
        println("hello im custom bean ${firstName}")
    }

    String getFirstName() {
        println("im gettter ")
        return firstName
    }
    CustomBean(String firstName){
        println("contructor awaked")
        this.firstName=firstName
    }
    CustomBean(){
        println("default constructor awaked")
    }



}
