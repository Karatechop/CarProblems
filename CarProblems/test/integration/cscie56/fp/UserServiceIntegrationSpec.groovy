package cscie56.fp

import grails.test.spock.IntegrationSpec

class UserServiceIntegrationSpec extends IntegrationSpec {
    def userService
    def setup() {
    }

    def cleanup() {
    }

    void "check getUser() method"() {

        when: 'getUser() method is used'
        User user = userService.getUser()

        then: 'check that there is no logged in user on start-up'
        user == null
    }

    void "check isAdminLoggedin() method"() {

        when: 'isAdminLoggedin() method is used'
        String isAdminLoggedin = userService.isAdminLoggedin()

        then: 'check that admin is not logged in on start-up'
        isAdminLoggedin == 'no'
    }

    void "check profileOwnerIsLoggedin() method"() {

        when: 'profileOwnerIsLoggedin() method is used'
        String profileOwnerIsLoggedin = userService.profileOwnerIsLoggedin()

        then: 'check that there is no user on start-up'
        profileOwnerIsLoggedin == 'no'
    }

    void "check adminCarUserProblemSummary() method"() {

        when: 'profileOwnerIsLoggedin() method is used'
        Map adminCarUserProblemSummary = userService.adminCarUserProblemSummary()

        then: 'check that there is no user on start-up'
        adminCarUserProblemSummary == ['numberOfUsers':11, 'numberOfCars':4, 'numberOfProblems':14, 'numberOfApprovedProblems':11, 'numberOfUnapprovedProblems':1, 'numberOfRejectedProblems':2]
    }


}
