package cscie56.fp

import grails.transaction.Transactional

@Transactional
class CarService {

    def userService

        Car createCar(String manufacturer, String carModel, Integer year, String fuel, Integer doors) {
            User carUser1 = userService.createUser('username', 'password')
            Car testCar = new Car()
            testCar.users = [carUser1]
            testCar.manufacturer = manufacturer
            testCar.carModel = carModel
            testCar.year = year
            testCar.fuel = fuel
            testCar.doors = doors

            testCar.save(failOnError: true)

            return testCar
        }

        def generateCarProblemsSummaryReport (Car carInstance) {

            List carProblemsSummaryReport = []
            List allCarProblems = Problem.findAllByCarAndApproved(carInstance, true)

            List systems = []
            allCarProblems.each {systems << "${it.system}"}
            systems = systems.unique { a, b -> a <=> b }

            Integer i
            List mileages = []
            List summary = []
            def mileagesSize
            int midNumber
            def medianMileage


            for (i = 0; i < systems.size(); i++) {
                mileages = []
                summary = []
                summary << systems[i]

                allCarProblems.each {
                    if ("${it.system}" == systems[i]){
                        mileages << "${it.mileage}".toInteger()

                    }
                }


                mileages.sort { a, b -> a <=> b }
                mileagesSize = mileages.size()
                midNumber = mileagesSize / 2
                medianMileage = mileagesSize % 2 != 0 ? mileages[midNumber] : (mileages[midNumber] + mileages[midNumber - 1]) / 2


                summary << medianMileage
                summary << mileages.min()
                summary << mileages.max()

                carProblemsSummaryReport << summary
            }


            return carProblemsSummaryReport
        }

}
