package cscie56.fp

import grails.transaction.Transactional
import cscie56.fp.UserRole

@Transactional
class UserService {

        def springSecurityService

        def createUser(String username, String password) {

            User user = new User()
            user.username = username
            user.password = password
            user.save(failOnError: true)
            return user
        }

        def isAdminLoggedin() {
            Boolean isAdminLoggedin = false
            def user = springSecurityService.isLoggedIn() ?
                    springSecurityService.currentUser :
                    null
            if (user){
                user.getAuthorities().authority == ['ROLE_ADMIN'] ? isAdminLoggedin = true : null
            }
            return isAdminLoggedin
        }
}
