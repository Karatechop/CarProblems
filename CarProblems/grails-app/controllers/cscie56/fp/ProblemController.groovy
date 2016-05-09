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
        String isAdminLoggedin = userService.isAdminLoggedin()
        respond Problem.list(params), model:[problemInstanceCount: Problem.count(),
                                             isAdminLoggedin:isAdminLoggedin]
    }

    def show(Problem problemInstance) {
        String isAdminLoggedin = userService.isAdminLoggedin()
        respond problemInstance, model: [isAdminLoggedin:isAdminLoggedin]
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
            redirect(action: 'create', params: [invalidParams: true])
            return
        }

        problemInstance.save flush:true

        def isAdminLoggedin = userService.isAdminLoggedin()
        User loggedInUser = userService.getUser()
        String uid = loggedInUser.id.toString()
        String pid = problemInstance.id.toString()
        String uri = (isAdminLoggedin == 'yes')? "/problem/show/" + pid : "/user/userProfile/" + uid

        redirect(uri: uri, params: [problemSaved: true])
    }

    def edit(Problem problemInstance) {
        def isAdminLoggedin = userService.isAdminLoggedin()
        respond problemInstance, model: [isAdminLoggedin:isAdminLoggedin]
    }

    @Transactional
    def update(Problem problemInstance) {
        if (problemInstance == null) {
            notFound()
            return
        }

        if (problemInstance.hasErrors()) {
            String pid = problemInstance.id.toString()
            String uri = "/problem/edit/" + pid
            redirect(uri: uri, params: [invalidParams: true])

            return
        }

        problemInstance.save flush:true

        def isAdminLoggedin = userService.isAdminLoggedin()
        String pid = problemInstance.id.toString()
        String uri = (isAdminLoggedin == 'yes')? "/problem/show/" + pid : null

        redirect(uri: uri, params: [problemUpdated: true])


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
