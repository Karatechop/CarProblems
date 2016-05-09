package cscie56.fp

import grails.test.mixin.TestFor
import grails.test.mixin.TestMixin
import grails.test.mixin.support.GrailsUnitTestMixin
import spock.lang.Specification
import spock.lang.Unroll

/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
@TestFor(Problem)
class ProblemSpec extends ConstraintUnitSpec {

    def setup() {
        //mock Problem
        User testUser = new User(username: 'username', password: 'password')
        Car testCar = new Car(user:testUser, manufacturer:'Test Car Motors', carModel: '2016 Sport', year: 2016, fuel: 'Diesel', doors: 5)
        Problem testProblem = new Problem(user: testUser, car: testCar, system: 'Transmission', mileage: 100000, description: 'description', approved: true)
        mockForConstraintsTests(Problem,[testProblem])
    }

    @Unroll("test problem all constraints #field is #error")
    def "test problem system constraints"() {
        when:
        def obj = new Problem("$field": val)

        then:
        validateConstraints(obj, field, error)

        where:
        error      | field    | val
        'nullable' | 'system' | ' '
        'nullable' | 'system' | null
        'inList'   | 'system' | 'Transmission manual'
        'valid'    | 'system' | 'Transmission'
        'valid'    | 'system' | 'Seat belt/Air bag'
    }

    @Unroll("test problem all constraints #field is #error")
    def "test problem description constraints"() {
        when:
        def obj = new Problem("$field": val)

        then:
        validateConstraints(obj, field, error)

        where:
        error      | field         | val
        'nullable' | 'description' | ' '
        'nullable' | 'description' | null
        'matches'  | 'description' | 'descrip/tion'
        'valid'    | 'description' | 'des cription'
        'size'     | 'description' | getLongString(501)
        'valid'    | 'description' | getLongString(500)
        'valid'    | 'description' | getLongString(50)
        'valid'    | 'description' | 'd'
    }

    @Unroll("test problem all constraints #field is #error")
    def "test problem mileage constraints"() {
        when:
        def obj = new Problem("$field": val)

        then:
        validateConstraints(obj, field, error)

        where:
        error       | field     | val
        'nullable'  | 'mileage' | ' '
        'nullable'  | 'mileage' | null
        'validator' | 'mileage' | -1
        'valid'     | 'mileage' | 0
        'validator' | 'mileage' | 550000
        'valid'     | 'mileage' | 1
        'valid'     | 'mileage' | 449999

    }

    @Unroll("test problem all constraints #field is #error")
    def "test problem approved constraints"() {
        when:
        def obj = new Problem("$field": val)

        then:
        validateConstraints(obj, field, error)

        where:
        error   | field      | val
        'valid' | 'approved' | null

    }

    @Unroll("test problem all constraints #field is #error")
    def "test problem user constraints"() {
        when:
        def obj = new Problem("$field": val)

        then:
        validateConstraints(obj, field, error)

        where:
        error   | field  | val
        'valid' | 'user' | null

    }



}
