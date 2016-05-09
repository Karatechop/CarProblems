package cscie56.fp

import grails.test.spock.IntegrationSpec

class ProblemServiceIntegrationSpec extends IntegrationSpec {

    def problemService

    def setup() {
    }

    def cleanup() {
    }

    void "createProblemDescription() method"() {

        when: 'createProblemDescription method is used'
        String test = problemService.createProblemDescription()

        then: 'check if a 500 characters long string is generated'
        test.length() == 500

    }

    void "createProblem() method"() {

        when: 'createProblem() method is used'
        Integer problemCountBefore = Problem.count()
        problemService.createProblem('Transmission', 100000, 'description', false)

        then: 'check if the Problem table in db contains 1 entry'
        Problem.count() - problemCountBefore == 1

    }
}
