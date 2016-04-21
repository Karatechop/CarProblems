package cscie56.fp

import grails.transaction.Transactional

@Transactional
class UserService {

    def createUser(String username, String password) {

        User user = new User()
        user.username = username
        user.password = password

        user.save(failOnError: true)
        return user
    }
}
