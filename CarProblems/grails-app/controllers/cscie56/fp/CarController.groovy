package cscie56.fp

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)

class CarController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def userService
    def carService

    @Secured(['ROLE_ADMIN', 'ROLE_USER', 'ROLE_ANONYMOUS'])
    def welcomePage() {
        User loggedInUser = userService.getUser()
        String isAdminLoggedin = userService.isAdminLoggedin()
        respond Car.list(), model: [isAdminLoggedin:isAdminLoggedin, loggedInUser:loggedInUser]
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER', 'ROLE_ANONYMOUS'])
    def example() {
        Car carInstance = Car.get(1)
        String isAdminLoggedin = userService.isAdminLoggedin()
        User loggedInUser = userService.getUser()
        List carProblemsSummaryReport = carService.generateCarProblemsSummaryReport(carInstance)
        List allCarProblems = Problem.findAllByCarAndApproved(carInstance, true, [sort:"dateSubmitted", order: "desc"])

        respond Car.first(), view: 'carProfile', model: [isAdminLoggedin:isAdminLoggedin,
                                                         loggedInUser:loggedInUser,
                                                         carProblemsSummaryReport:carProblemsSummaryReport,
                                                         allCarProblems:allCarProblems]
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER', 'ROLE_ANONYMOUS'])
    def carProfile (Car carInstance) {
        User loggedInUser = userService.getUser()
        List carProblemsSummaryReport = carService.generateCarProblemsSummaryReport(carInstance)
        List allCarProblems = Problem.findAllByCarAndApproved(carInstance, true, [sort:"dateSubmitted", order: "desc"])
        String isAdminLoggedin = userService.isAdminLoggedin()

        respond carInstance, model: [isAdminLoggedin:isAdminLoggedin,

                                     carProblemsSummaryReport:carProblemsSummaryReport,
                                     allCarProblems:allCarProblems,
                                     loggedInUser:loggedInUser]

    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER', 'ROLE_ANONYMOUS'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        String isAdminLoggedin = userService.isAdminLoggedin()
        User loggedInUser = userService.getUser()
        respond Car.list(params), model:[carInstanceCount: Car.count(),
                                         isAdminLoggedin:isAdminLoggedin,
                                         loggedInUser:loggedInUser]
    }

    @Secured(['ROLE_ADMIN'])
    def show(Car carInstance) {
        String isAdminLoggedin = userService.isAdminLoggedin()
        respond carInstance, model: [isAdminLoggedin:isAdminLoggedin]
    }

    @Secured(['ROLE_ADMIN'])
    def create() {
        def isAdminLoggedin = userService.isAdminLoggedin()
        respond new Car(params), model: [isAdminLoggedin: isAdminLoggedin]
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def save(Car carInstance) {
        if (carInstance == null) {
            notFound()
            return
        }

        if (carInstance.hasErrors()) {
            redirect(action: 'create', params: [invalidParams: true])
            return
        }

        def isAdminLoggedin = userService.isAdminLoggedin()
        User loggedInAdmin = (isAdminLoggedin == 'yes')? userService.getUser() : null

        carInstance.save (flush:true).addToUsers(loggedInAdmin)


        String cid = carInstance.id.toString()
        String uri = (isAdminLoggedin == 'yes')? "/car/show/" + cid : null

        redirect(uri: uri, params: [carSaved: true])
    }

    @Secured(['ROLE_ADMIN'])
    def edit(Car carInstance) {
        def isAdminLoggedin = userService.isAdminLoggedin()
        respond carInstance, model: [isAdminLoggedin:isAdminLoggedin]
    }

    @Secured(['ROLE_ADMIN'])
    @Transactional
    def update(Car carInstance) {
        if (carInstance == null) {
            notFound()
            return
        }

        if (carInstance.hasErrors()) {
            String cid = carInstance.id.toString()
            String uri = "/car/edit/" + cid
            redirect(uri: uri, params: [invalidParams: true])
            return
        }

        carInstance.save(flush:true)

        def isAdminLoggedin = userService.isAdminLoggedin()
        String cid = carInstance.id.toString()
        String uri = (isAdminLoggedin == 'yes')? "/car/show/" + cid : null

        redirect(uri: uri, params: [carUpdated: true])
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def delete(Car carInstance) {

        if (carInstance == null) {
            notFound()
            return
        }

        Problem.findAllByCar(carInstance).each{it -> it.delete()}

        def tmp = []
        tmp.addAll(carInstance.users)
        tmp.each{
            it.removeFromCars(carInstance)
        }
        carInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Car.label', default: 'Car'), carInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'car.label', default: 'Car'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
