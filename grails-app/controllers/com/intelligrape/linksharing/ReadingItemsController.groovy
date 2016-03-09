package com.intelligrape.linksharing

class ReadingItemsController {
    def changeIsRead( Long id) {
        if(id) {
            if (ReadingItem.executeUpdate("update ReadingItem set isRead=${isRead} where resource=${id} AND user=${session.user}") == 0) {

            }
        }
        else {
            render view:'/user/index'
        }
    }

    def show() {
        def user = session.user
        User user1 = User.get(user.id)
        List<String> resources = user1.subscriptions.topic.resources

        render view: '/resource/resource', model: [resources: resources]
    }
}
