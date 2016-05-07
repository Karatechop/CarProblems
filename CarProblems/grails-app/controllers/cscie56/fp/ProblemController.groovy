package cscie56.fp

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN'])
class ProblemController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def userService

    @Secured(['ROLE_ADMIN'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Problem.list(params), model:[problemInstanceCount: Problem.count()]
    }

    def show(Problem problemInstance) {
        respond problemInstance
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def create() {
        def isAdminLoggedin = userService.isAdminLoggedin()
        User loggedInUser = userService.getUser()
        respond new Problem(params), model: [isAdminLoggedin: isAdminLoggedin, loggedInUser: loggedInUser]
    }


    @Transactional
    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def save(Problem problemInstance) {
        if (problemInstance == null) {
            notFound()
            return
        }

        if (problemInstance.hasErrors()) {
            respond problemInstance.errors, view:'create'
            return
        }

        problemInstance.save flush:true

        def isAdminLoggedin = userService.isAdminLoggedin()
        User userInstance = userService.getUser()
        String id = userInstance.id.toString()
        String uri = (isAdminLoggedin == 'yes')? "/user/adminDashboard" : "/user/userProfile/" + id

        redirect(uri: uri, model: [isAdminLoggedin: isAdminLoggedin, userInstance: userInstance])
    }

    def edit(Problem problemInstance) {
        respond problemInstance
    }

    @Transactional
    def update(Problem problemInstance) {
        if (problemInstance == null) {
            notFound()
            return
        }

        if (problemInstance.hasErrors()) {
            respond problemInstance.errors, view:'edit'
            return
        }

        problemInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Problem.label', default: 'Problem'), problemInstance.id])
                redirect problemInstance
            }
            '*'{ respond problemInstance, [status: OK] }
        }


    }

    @Transactional
    def delete(Problem problemInstance) {

        if (problemInstance == null) {
            notFound()
            return
        }

        problemInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Problem.label', default: 'Problem'), problemInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'problem.label', default: 'Problem'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
