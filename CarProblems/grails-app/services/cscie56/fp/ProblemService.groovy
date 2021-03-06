package cscie56.fp

import grails.transaction.Transactional

@Transactional
class ProblemService {

    def carService

    def createProblemDescription() {
        String d = 'd' * 500
        return d
    }

    def createProblem(String system, Integer mileage, String description, boolean approved) {
        User testUser = new User(username: 'username1', password: 'password').save()
        Car testCar = carService.createCar('Test Car Motors', '2016 Sport test', 2016, 'Diesel', 5)
        Problem problem = new Problem()
        problem.user = testUser
        problem.car = testCar
        problem.mileage = mileage
        problem.system = system
        problem.description = description
        problem.approved = approved

        problem.save(failOnError: true)
        return problem

    }
}
