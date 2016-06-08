class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?" {
            constraints {
                // apply constraints here
            }
        }

        // "/"(view:"/index")
        "500"(view: '/500')
        "/"(controller: '/login/auth')
        "404"(controller: 'test', action: 'abcd')


    }
}
