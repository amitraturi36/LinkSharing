package com.intelligrape.linksharing

class SubscriptionController {

    def index() {}
    def delete(Long id){
        Subscription subscription = Subscription.load(id)
        try {
            subscription.delete()
            render("<br/>Sucess")
        } catch (Exception e) {
            render "<br/>Subscription not found"
        }
    }
    def save(Long id){
        Topic topic=Topic.read(id)
        User user=User.findByFirstName(session.userName)
           Subscription subscription=new Subscription(topic: topic,user: user)
            if(subscription.save(flush: true,failOnError: true))
            {

                render "Sucess"

            }
            else{

                render "Errors"
            }
    }
    def update(Long id,Seriousness seriousness){

        Subscription subscription=Subscription.load(id)
         subscription.seriousness=seriousness
        if(subscription.save(flush:true,failOnError: true )){
            render "Sucess"
        }
        else{

            render "Errors"
        }
    }
}
