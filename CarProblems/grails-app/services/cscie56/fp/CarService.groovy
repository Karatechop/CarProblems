package cscie56.fp

import grails.transaction.Transactional

@Transactional
class CarService {

    def userService

        Car createCar(String manufacturer, String carModel, Integer year, String fuel, Integer doors) {
            User carUser = userService.createUser('username', 'password')
            Car testCar = new Car()
            testCar.user = carUser
            testCar.manufacturer = manufacturer
            testCar.carModel = carModel
            testCar.year = year
            testCar.fuel = fuel
            testCar.doors = doors

            testCar.save(failOnError: true)

            return testCar
        }
}
