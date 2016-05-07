class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {

            }
        }
        "/" {
            controller = "car"
            action = "welcomePage"
        }

        "/example" {
            controller = "car"
            action = "example"
        }

    "/controllers"(view:"/index")
        "500"(view:'/error')
	}
}
