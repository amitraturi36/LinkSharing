package com.intelligrape.linksharing

class ReadingItemsController {
    def changeIsRead(Long id, Boolean isRead) {

        if( ReadingItem.executeUpdate("update ReadingItem set isRead=${isRead} where resource=${id}")==0){
            render("sucess")
        }
        else {
            render "error"
        }
    }
}
