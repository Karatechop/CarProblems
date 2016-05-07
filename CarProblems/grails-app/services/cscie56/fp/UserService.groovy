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

        def getUser() {
            def user = springSecurityService.isLoggedIn() ?
                    springSecurityService.currentUser :
                    null
            return user
        }

        def isAdminLoggedin() {
            String isAdminLoggedin = 'no'
            def user = springSecurityService.isLoggedIn() ?
                    springSecurityService.currentUser :
                    null
            if (user){
               if ( user.getAuthorities().authority == ['ROLE_ADMIN'] ){
                   isAdminLoggedin = 'yes'
               } else {
                   isAdminLoggedin = 'no'}
            }
            return isAdminLoggedin
        }

        def profileOwnerIsLoggedin(User userInstance) {
            String profileOwnerIsLoggedin = 'no'
            def user = springSecurityService.isLoggedIn() ?
                    springSecurityService.currentUser :
                    null
            if (user){
               if( user.id == userInstance.id ) {
                   profileOwnerIsLoggedin = 'yes'
               } else {
                   profileOwnerIsLoggedin = 'no'}
            }
            return profileOwnerIsLoggedin
        }

        def adminCarUserProblemSummary(){
            Integer numberOfUsers = User.count()
            Integer numberOfCars = Car.count()
            Integer numberOfProblems = Problem.count()
            Integer numberOfApprovedProblems = Problem.findAllByApproved(true).size()
            Integer numberOfUnapprovedProblems = Problem.findAllByApproved(null).size()
            Integer numberOfRejectedProblems = Problem.findAllByApproved(false).size()
            Map adminCarUserProblemSummary = [numberOfUsers:numberOfUsers,
                                              numberOfCars:numberOfCars,
                                              numberOfProblems:numberOfProblems,
                                              numberOfApprovedProblems:numberOfApprovedProblems,
                                              numberOfUnapprovedProblems:numberOfUnapprovedProblems,
                                              numberOfRejectedProblems:numberOfRejectedProblems]
            return adminCarUserProblemSummary

        }
}
