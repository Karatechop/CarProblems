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
        Integer carCountBefore = Car.count()
        carService.createCar('Test Car Motors', '2016 Sport test', 2016, 'Diesel', 5)

        then: 'check if the Car table in db contains 1 more Car entry'
        Car.count() - carCountBefore == 1

    }

    void "generateCarProblemsSummaryReport() method"() {

        when: 'generateCarProblemsSummaryReport() method is used'
        Car carInstance = Car.findByCarModel("2002 Explorer")
        List carProblemsSummaryReport = carService.generateCarProblemsSummaryReport(carInstance)

        then: 'check if carProblemsSummaryReport returns correct data'
        carProblemsSummaryReport == [['Transmission', 117000, 95000, 135000], ['Brakes', 89000, 65000, 96000]]

    }
}
