package cscie56.fp

import grails.test.spock.IntegrationSpec

class CarServiceIntegrationSpec extends IntegrationSpec {

    def carService

    def setup() {
    }

    def cleanup() {
    }

    void "createCar() method"() {

        when: 'createCar() method is used'
        carService.createCar('Test Car Motors', '2016 Sport', 2016, 'Diesel', 5)

        then: 'check if the Car table in db contains 1 entry'
        Car.count() == 1

    }
}
