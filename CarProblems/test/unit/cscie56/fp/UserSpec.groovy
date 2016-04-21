package cscie56.fp

import grails.test.mixin.TestFor
import grails.test.mixin.TestMixin
import grails.test.mixin.support.GrailsUnitTestMixin
import spock.lang.Specification
import spock.lang.Unroll

/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
@TestFor(User)
class UserSpec extends ConstraintUnitSpec {

    def setup() {
        //mock User
        User testUser = new User(username:'username', password: 'password')
        mockForConstraintsTests(User,[testUser])
    }

    @Unroll("test user all constraints #field is #error")
    def "test user username constraints"() {
        when:
        def obj = new User("$field": val)

        then:
        validateConstraints(obj, field, error)

        where:
        error      | field      | val
        'nullable' | 'username' | ' '
        'unique'   | 'username' | 'username'
        'nullable' | 'username' | null
        'matches'  | 'username' | 'user+name'
        'valid'    | 'username' | 'user name'
        'size'     | 'username' | getLongString(31)
        'valid'    | 'username' | getLongString(15)
        'valid'    | 'username' | getLongString(8)
        'valid'    | 'username' | 'u'
    }

    @Unroll("test user all constraints #field is #error")
    def "test user password constraints"() {
        when:
        def obj = new User("$field": val)

        then:
        validateConstraints(obj, field, error)

        where:
        error      | field      | val
        'nullable' | 'password' | ' '
        'nullable' | 'password' | null
    }
}
