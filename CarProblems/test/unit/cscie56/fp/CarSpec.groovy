package cscie56.fp

import grails.test.mixin.TestFor
import grails.test.mixin.TestMixin
import grails.test.mixin.support.GrailsUnitTestMixin
import spock.lang.Specification
import spock.lang.Unroll

/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
@TestFor(Car)
class CarSpec extends ConstraintUnitSpec {

    def setup() {
        //mock Car
        User testUser = new User(username: 'username', password: 'password')
        Car testCar = new Car(user:testUser, manufacturer:'Test Car Motors', carModel: '2016 Sport', year: 2016, fuel: 'Diesel', doors: 5)
        mockForConstraintsTests(Car,[testCar])
    }

    @Unroll("test car all constraints #field is #error")
    def "test car manufacturer constraints"() {
        when:
        def obj = new Car("$field": val)

        then:
        validateConstraints(obj, field, error)

        where:
        error      | field      | val
        'nullable' | 'manufacturer' | ' '
        'nullable' | 'manufacturer' | null
        'matches'  | 'manufacturer' | 'manu+facturer'
        'valid'    | 'manufacturer' | 'user name'
        'size'     | 'manufacturer' | getLongString(51)
        'valid'    | 'manufacturer' | getLongString(50)
        'valid'    | 'manufacturer' | getLongString(25)
        'valid'    | 'manufacturer' | 'm'
    }

    @Unroll("test car all constraints #field is #error")
    def "test car carModel constraints"() {
        when:
        def obj = new Car("$field": val, year:2016)

        then:
        validateConstraints(obj, field, error)

        where:
        error       | field      | val
        'nullable'  | 'carModel' | ' '
        'nullable'  | 'carModel' | null
        'unique'    | 'carModel' | '2016 Sport'
        'matches'   | 'carModel' | '2016 car+model'
        'valid'     | 'carModel' | '2016 car model'
        'size'      | 'carModel' | '2016' + getLongString(51)
        'valid'     | 'carModel' | '2016 ' + getLongString(45)
        'valid'     | 'carModel' | '2016' + getLongString(25)
        'valid'     | 'carModel' | '2016'
        'validator' | 'carModel' | 'Sport'
    }

    @Unroll("test car all constraints #field is #error")
    def "test car year constraints"() {
        when:
        def obj = new Car("$field": val)

        then:
        validateConstraints(obj, field, error)

        where:
        error       | field  | val
        'nullable'  | 'year' | ' '
        'nullable'  | 'year' | null
        'valid'     | 'year' | 2016
        'valid'     | 'year' | 2015
        'validator' | 'year' | 2017
    }

    @Unroll("test car all constraints #field is #error")
    def "test car doors constraints"() {
        when:
        def obj = new Car("$field": val)

        then:
        validateConstraints(obj, field, error)

        where:
        error       | field   | val
        'nullable'  | 'doors' | ' '
        'nullable'  | 'doors' | null
        'valid'     | 'doors' | 3
        'valid'     | 'doors' | 5
        'valid'     | 'doors' | 9
        'validator' | 'doors' | 10
        'validator' | 'doors' | 0
    }
}
