package cscie56.fp

import spock.lang.Specification

abstract class ConstraintUnitSpec extends Specification {

    String getLongString(Integer length) {
        'a' * length
    }

    void validateConstraints(obj, field, error) {
        def validated = obj.validate()
        if (error && error != 'valid') {
            assert !validated
            assert obj.errors[field]
            assert error == obj.errors[field]
        } else {
            assert !obj.errors[field]
        }
    }
}