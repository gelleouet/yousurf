package yousurf

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller:"inscription")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
