package cscie56.fp

import grails.transaction.Transactional

@Transactional
class ProblemService {

    def carService

    def createProblemDescription() {
        String d = 'd' * 250
        return d
    }

    def createProblem(String system, String description, boolean approved) {
        Car testCar = carService.createCar('Test Car Motors', '2016 Sport', 2016, 'Diesel', 5)
        Problem problem = new Problem()
        problem.car = testCar
        problem.system = system
        problem.description = description
        problem.approved = approved

        problem.save(failOnError: true)
        return problem

    }
}
