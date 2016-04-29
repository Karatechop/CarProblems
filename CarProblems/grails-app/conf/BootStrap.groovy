
import cscie56.fp.Role
import cscie56.fp.User
import cscie56.fp.UserRole

class BootStrap {


    def init = { servletContext ->

        def adminRole = new Role('ROLE_ADMIN').save(failOnError: true)
        def userRole = new Role('ROLE_USER').save(failOnError: true)

        def testUser = new User('me', 'pass').save(failOnError: true)

        UserRole.create testUser, adminRole, true

        assert User.count() == 1
        assert Role.count() == 2
        assert UserRole.count() == 1

    }

}
