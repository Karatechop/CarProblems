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

        "/user/userProfile/1" {
            controller = "user"
            action = "adminDashboard"
        }

        "/controllers"(view:"/index")
        "500"(view:'/error')
	}
}
