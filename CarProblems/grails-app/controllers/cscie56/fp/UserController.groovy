package cscie56.fp

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN'])
class UserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def userService

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def userProfile(User userInstance) {
        def isAdminLoggedin = userService.isAdminLoggedin()
        User loggedInUser = userService.getUser()
        String profileOwnerIsLoggedin = userService.profileOwnerIsLoggedin(userInstance)
        Set userCars = userInstance.cars
        List unapprovedProblems = Problem.findAllByUserAndApproved(userInstance, null)
        List approvedProblems = Problem.findAllByUserAndApproved(userInstance, true)
        List rejectedProblems = Problem.findAllByUserAndApproved(userInstance, false)
        Problem problemInstance = new Problem(params)

        if (isAdminLoggedin == 'yes' &&
                request.forwardURI == "/CarProblems/user/userProfile/1" ||
                isAdminLoggedin == 'yes' &&
                request.forwardURI + '?' + request.queryString  == "/CarProblems/user/userProfile?id=1") {

            redirect(action: 'adminDashboard')

        } else if (isAdminLoggedin == 'no' &&
                request.forwardURI == "/CarProblems/user/userProfile/1" ||
                isAdminLoggedin == 'no' &&
                request.forwardURI + '?' + request.queryString  == "/CarProblems/user/userProfile?id=1") {

            redirect(controller: 'car', action: 'welcomePage')

                 } else {

            respond userInstance, model: [isAdminLoggedin       : isAdminLoggedin,
                                          loggedInUser          : loggedInUser,
                                          profileOwnerIsLoggedin: profileOwnerIsLoggedin,
                                          userCars              : userCars,
                                          unapprovedProblems    : unapprovedProblems,
                                          approvedProblems      : approvedProblems,
                                          rejectedProblems      : rejectedProblems,
                                          problemInstance       : problemInstance]
            }

    }

    def adminDashboard() {
        def isAdminLoggedin = userService.isAdminLoggedin()
        User loggedInUser = userService.getUser()
        Map adminCarUserProblemSummary = userService.adminCarUserProblemSummary()
        List unapprovedProblems = Problem.findAllByApproved(null)

        respond loggedInUser, model: [isAdminLoggedin:isAdminLoggedin,
                                      adminCarUserProblemSummary:adminCarUserProblemSummary,
                                      unapprovedProblems:unapprovedProblems]
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def addCarToUserProfile(params) {
        Car carInstance = Car.findById(params.car)
        User userInstance = userService.getUser()
        carInstance.addToUsers(userInstance)

        userInstance.save flush:true

    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def removeCarFromProfile(params) {
        Car carInstance = Car.findById(params.car)
        User userInstance = userService.getUser()
        carInstance.removeFromUsers(userInstance)

        userInstance.save flush:true

    }

    @Secured(['ROLE_ADMIN'])
    adminApproveProblem(params){
        Problem problemInstance = Problem.findById(params.problemId)
        problemInstance.approved = true

        problemInstance.save flush:true
    }

    @Secured(['ROLE_ADMIN'])
    adminRejectProblem(params){
        Problem problemInstance = Problem.findById(params.problemId)
        problemInstance.approved = false

        problemInstance.save flush:true
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        String isAdminLoggedin = userService.isAdminLoggedin()
        respond User.list(params), model:[userInstanceCount: User.count(),
                                          isAdminLoggedin:isAdminLoggedin]
    }

    def show(User userInstance) {
        String isAdminLoggedin = userService.isAdminLoggedin()
        respond userInstance, model: [isAdminLoggedin:isAdminLoggedin]
    }

    def create() {
        def isAdminLoggedin = userService.isAdminLoggedin()
        respond new User(params), model: [isAdminLoggedin: isAdminLoggedin]
    }

    @Transactional
    def save(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            redirect(action: 'create', params: [invalidParams: true])
            return
        }

        userInstance.save flush:true
        Role userRole = Role.findByAuthority('ROLE_USER')
        UserRole.create userInstance, userRole, true

        String uri = "/user/show/" + userInstance.id.toString()

        redirect(uri: uri, params: [userSaved: true])
    }

    def edit(User userInstance) {
        def isAdminLoggedin = userService.isAdminLoggedin()
        respond userInstance
    }

    @Transactional
    def update(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            String uid = userInstance.id.toString()
            String uri = "/car/edit/" + uid
            redirect(uri: uri, params: [invalidParams: true])
            return
        }

        userInstance.save flush:true

        def isAdminLoggedin = userService.isAdminLoggedin()
        String uid = userInstance.id.toString()
        String uri = (isAdminLoggedin == 'yes')? "/user/show/" + uid : null

        redirect(uri: uri, params: [userUpdated: true])
    }

    @Transactional
    def delete(User userInstance) {

        if (userInstance == null) {
            notFound()
            return
        }


        Role userRole = Role.findByAuthority('ROLE_USER')
        UserRole.remove userInstance, userRole, true

        Problem.findAllByUser(userInstance).each{it -> it.user = null}

        userInstance.save flush:true


        userInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
