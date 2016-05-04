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
        User userInstance = userService.getUser()
        String isAdminLoggedin = userService.isAdminLoggedin()
        respond Car.list(), model: [isAdminLoggedin:isAdminLoggedin, userInstance:userInstance]
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER', 'ROLE_ANONYMOUS'])
    def example() {
        Car carInstance = Car.get(1)
        List carProblemsSummaryReport = carService.generateCarProblemsSummaryReport(carInstance)
        List allCarProblems = Problem.findAllByCarAndApproved(carInstance, true, [sort:"dateSubmitted", order: "desc"])
        respond Car.get(1), view: 'carProfile', model: [carProblemsSummaryReport:carProblemsSummaryReport, allCarProblems:allCarProblems]
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER', 'ROLE_ANONYMOUS'])
    def carProfile (Car carInstance) {
        User userInstance = userService.getUser()
        List carProblemsSummaryReport = carService.generateCarProblemsSummaryReport(carInstance)
        List allCarProblems = Problem.findAllByCarAndApproved(carInstance, true, [sort:"dateSubmitted", order: "desc"])
        String isAdminLoggedin = userService.isAdminLoggedin()
        //String carBelongsToLoggedinUser = carService.carBelongsToLoggedinUser(carInstance)
        respond carInstance, model: [isAdminLoggedin:isAdminLoggedin,

                                     carProblemsSummaryReport:carProblemsSummaryReport,
                                     allCarProblems:allCarProblems,
                                     userInstance:userInstance]

    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER', 'ROLE_ANONYMOUS'])
    def carTest () {

        Car carInstance = Car.get(1)
        List carProblemsSummaryReport = []
        List allCarProblems = Problem.findAllByCarAndApproved(carInstance, true)

        List systems = []
        allCarProblems.each { systems << "${it.system}" }
        systems = systems.unique { a, b -> a <=> b }

        Integer i
        List mileages = []
        List summary = []
        def mileagesSize
        int midNumber
        def medianMileage


        for (i = 0; i < systems.size(); i++) {
            summary = []
            mileages = []
            summary << systems[i]

            allCarProblems.each {
                if ("${it.system}" == systems[i]) {
                    mileages << "${it.mileage}".toInteger()

                }
            }


            mileages.sort { a, b -> a <=> b }
            mileagesSize = mileages.size()
            midNumber = mileagesSize / 2
            medianMileage = mileagesSize % 2 != 0 ? mileages[midNumber] : (mileages[midNumber] + mileages[midNumber - 1]) / 2


            summary << medianMileage
            summary << mileages.min()
            summary << mileages.max()

            carProblemsSummaryReport << mileages
        }
        User userInstance = User.get(2)
        Set userCars = userInstance.cars
        def isAdminLoggedin = userService.isAdminLoggedin()
        def profileOwnerIsLoggedin = userService.profileOwnerIsLoggedin(userInstance)
        String carBelongsToLoggedinUser = carService.carBelongsToLoggedinUser(carInstance)
            respond carInstance, model: [carProblemsSummaryReport: carProblemsSummaryReport,
                                         allCarProblems:allCarProblems,
                                         mileage:mileages,
                                         userCars:userCars,
                                         isAdminLoggedin:isAdminLoggedin,
                                         profileOwnerIsLoggedin:profileOwnerIsLoggedin,
                                         carBelongsToLoggedinUser:carBelongsToLoggedinUser]

    }


    @Secured(['ROLE_ADMIN', 'ROLE_USER', 'ROLE_ANONYMOUS'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Car.list(params), model:[carInstanceCount: Car.count()]
    }

    @Secured(['ROLE_ADMIN'])
    def show(Car carInstance) {
        respond carInstance
    }

    @Secured(['ROLE_ADMIN'])
    def create() {
        respond new Car(params)
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def save(Car carInstance) {
        if (carInstance == null) {
            notFound()
            return
        }

        if (carInstance.hasErrors()) {
            respond carInstance.errors, view:'create'
            return
        }

        carInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'car.label', default: 'Car'), carInstance.id])
                redirect carInstance
            }
            '*' { respond carInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_ADMIN'])
    def edit(Car carInstance) {
        respond carInstance
    }

    @Transactional
    def update(Car carInstance) {
        if (carInstance == null) {
            notFound()
            return
        }

        if (carInstance.hasErrors()) {
            respond carInstance.errors, view:'edit'
            return
        }

        carInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Car.label', default: 'Car'), carInstance.id])
                redirect carInstance
            }
            '*'{ respond carInstance, [status: OK] }
        }
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def delete(Car carInstance) {

        if (carInstance == null) {
            notFound()
            return
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
