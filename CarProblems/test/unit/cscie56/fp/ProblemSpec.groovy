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
        Problem testProblem = new Problem(car: testCar, system: 'system', description: 'description', approved: true)
        mockForConstraintsTests(Problem,[testProblem])
    }

    @Unroll("test problem all constraints #field is #error")
    def "test problem system constraints"() {
        when:
        def obj = new Problem("$field": val)

        then:
        validateConstraints(obj, field, error)

        where:
        error      | field      | val
        'nullable' | 'system' | ' '
        'nullable' | 'system' | null
        'matches'  | 'system' | 'system+'
        'valid'    | 'system' | 'sys tem'
        'size'     | 'system' | getLongString(51)
        'valid'    | 'system' | getLongString(50)
        'valid'    | 'system' | getLongString(25)
        'valid'    | 'system' | 's'
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
        'valid'  | 'description' | 'des cription'
        'size'     | 'description' | getLongString(251)
        'valid'    | 'description' | getLongString(250)
        'valid'    | 'description' | getLongString(50)
        'valid'    | 'description' | 'd'
    }


}
