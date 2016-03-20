package com.intelligrape.linksharing

import grails.converters.JSON

class ReadingItemsController {

    def changeIsRead(Long id) {

        if (id) {
            def message=[status:"",error:"",message:""]
          int s= ReadingItem.executeUpdate("update ReadingItem set isRead=${true} where resource=${id} AND user=${session.user}")
            if(s) {
                message.status = 1
                message.message="successfully changed the status"
                render  message as JSON
            }
            else{
                message.error="Not able able to change status please try again"
                render  message as JSON
            }
        }
        else{
            render view: "/login/index"
        }
    }
    def show() {
        User user = User.get(session.user)

        List<String> resources = user.subscriptions.topic.resources

        render view: '/resource/show', model: [resources: resources]
    }
}
