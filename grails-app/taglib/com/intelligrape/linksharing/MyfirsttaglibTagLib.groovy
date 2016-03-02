package com.intelligrape.linksharing

class MyfirsttaglibTagLib {
    static namespace = "ls"
    static defaultEncodeAs = [taglib: 'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

    def showAdmin = { attrs, body ->
        Boolean isAdmin = Boolean.valueOf(session.username)
        if (!isAdmin) {
            println(body())
            out << body()
        }

    }
    def showUserList={
        List <User>userList=[]
        for (int i=1;i<=10;i++)
        {
            userList.add(new User(firstName: "user_${i}",lastName:"lastName${i}",id: i))
        }
        out<<render(template: '/layouts/Topic/email',model:[userLists:userList] )
    }

    def showdetail={attrs, body ->
      out<< attrs.attrs.findAll{it%2}



    }

}