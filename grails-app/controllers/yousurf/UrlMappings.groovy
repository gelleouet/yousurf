package yousurf

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: 'tableauBord')
        "/error"(view: '/error')
        "500"(view: '/error')
        "404"(view: '/notFound')
    }
}
