package com.intelligrape.linksharing

class MyfirsttaglibTagLib {
    static namespace = "Ls"
    static defaultEncodeAs = [taglib: 'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

    def ahowAdmin = { attrs, body ->
        Boolean isAdmin = Boolean.valueOf(session.username)
        if (isAdmin) {
            out << body()
        }

    }
    def showUserList={
        List <User>userList=[]
        for (int i=1;i<=10;i++)
        {
            userList.add(new User(firstName: "user_${i}",lastName:"lastName${i}",id: i))
        }
        out<<render(template: '/user/userList',model:[userLists:userList] )
    }

    def showdetail

}