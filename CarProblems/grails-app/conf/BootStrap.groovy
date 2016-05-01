
import cscie56.fp.Role
import cscie56.fp.User
import cscie56.fp.UserRole
import cscie56.fp.Car
import cscie56.fp.Problem


class BootStrap {

    def init = { servletContext ->

        def adminRole = new Role('ROLE_ADMIN').save(failOnError: true)
        def userRole = new Role('ROLE_USER').save(failOnError: true)

        def adminUser = new User('admin', 'pass').save(failOnError: true)

        def testUser1 = new User('tu1', 'pass').save(failOnError: true)
        def testUser2 = new User('tu2', 'pass').save(failOnError: true)

        UserRole.create adminUser, adminRole, true
        UserRole.create testUser1, userRole, true
        UserRole.create testUser2, userRole, true

        def testCar1 = new Car(
                manufacturer: 'Ford',
                carModel: '2002 Explorer',
                year: 2002,
                fuel: 'Diesel',
                doors: 5
        ).save(failOnError: true).addToUsers(adminUser).addToUsers(testUser1)

        def testCar2 = new Car(
                manufacturer: 'Honda',
                carModel: '2003 Accord',
                year: 2003,
                fuel: 'Gasoline',
                doors: 5
        ).save(failOnError: true).addToUsers(adminUser).addToUsers(testUser1)

        def testCar3 = new Car(
                manufacturer: 'Honda',
                carModel: '2001 Civic',
                year: 2001,
                fuel: 'Gasoline',
                doors: 5
        ).save(failOnError: true).addToUsers(adminUser).addToUsers(testUser2)

        def testCar4 = new Car(
                manufacturer: 'Dodge',
                carModel: '2002 Ram 1500',
                year: 2002,
                fuel: 'Diesel',
                doors: 5
        ).save(failOnError: true).addToUsers(adminUser).addToUsers(testUser2)







    }

}
