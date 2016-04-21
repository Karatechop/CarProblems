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

        then: 'check if a 250 characters long string is generated'
        test.length() == 250

    }

    void "createProblem() method"() {

        when: 'createProblem() method is used'
        problemService.createProblem('test system', 'description', false)

        then: 'check if the Problem table in db contains 1 entry'
        Problem.count() == 1

    }
}
