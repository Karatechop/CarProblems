
import cscie56.fp.Role
import cscie56.fp.User
import cscie56.fp.UserRole
import cscie56.fp.Car
import cscie56.fp.Problem


class BootStrap {

    def init = { servletContext ->

        // ROLES

        def adminRole = new Role('ROLE_ADMIN').save(failOnError: true)
        def userRole = new Role('ROLE_USER').save(failOnError: true)


        //USERS

        def adminUser = new User('admin', 'pass').save(failOnError: true)
        UserRole.create adminUser, adminRole, true


        def testUser1 = new User('testUser1', 'pass').save(failOnError: true)
        def testUser2 = new User('testUser2', 'pass').save(failOnError: true)
        def testUser3 = new User('testUser3', 'pass').save(failOnError: true)
        def testUser4 = new User('testUser4', 'pass').save(failOnError: true)
        def testUser5 = new User('testUser5', 'pass').save(failOnError: true)
        def testUser6 = new User('testUser6', 'pass').save(failOnError: true)
        def testUser7 = new User('testUser7', 'pass').save(failOnError: true)
        def testUser8 = new User('testUser8', 'pass').save(failOnError: true)
        def testUser9 = new User('testUser9', 'pass').save(failOnError: true)
        def testUser10 = new User('testUser10', 'pass').save(failOnError: true)

        UserRole.create testUser1, userRole, true
        UserRole.create testUser2, userRole, true
        UserRole.create testUser3, userRole, true
        UserRole.create testUser4, userRole, true
        UserRole.create testUser5, userRole, true
        UserRole.create testUser6, userRole, true
        UserRole.create testUser7, userRole, true
        UserRole.create testUser8, userRole, true
        UserRole.create testUser9, userRole, true
        UserRole.create testUser10, userRole, true


        //CARS

        def testCar1 = new Car(
                manufacturer: 'Ford',
                carModel: '2002 Explorer',
                year: 2002,
                fuel: 'Diesel',
                doors: 5
        ).save(failOnError: true).addToUsers(adminUser).addToUsers(testUser1).addToUsers(testUser3).addToUsers(testUser4)

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


        // PROBLEMS

        //Ford 2002 Explorer problems
        // Ford 2002 Explorer transmission problems
        Problem problem1 = new Problem (
                user: testUser1,
                car:testCar1,
                system: 'Transmission',
                mileage: 100000,
                description: 'Taciti porttitor nullam ornare platea posuere ipsum eleifend accumsan quis massa congue dolor blandit, senectus velit sodales eget leo fames netus hac tristique id mauris. Viverra hendrerit venenatis vulputate ultricies tempus quisque porta turpis quisque tellus proin curabitur metus neque, himenaeos sed viverra id mi nibh ipsum tellus suspendisse nisl dolor consectetur quis. ',
                approved: true
        ).save(failOnError: true)

        Problem problem2 = new Problem (
                user: testUser1,
                car:testCar1,
                system: 'Transmission',
                mileage: 95000,
                description: 'Taciti porttitor nullam ornare platea posuere ipsum eleifend accumsan quis massa congue dolor blandit, senectus velit sodales eget leo fames netus hac tristique id mauris. Viverra hendrerit venenatis vulputate ultricies tempus quisque porta turpis quisque tellus proin curabitur metus neque, himenaeos sed viverra id mi nibh ipsum tellus suspendisse nisl dolor consectetur quis. ',
                approved: true
        ).save(failOnError: true)

        Problem problem3 = new Problem (
                user: testUser3,
                car:testCar1,
                system: 'Transmission',
                mileage: 117000,
                description: 'Taciti porttitor nullam ornare platea posuere ipsum eleifend accumsan quis massa congue dolor blandit, senectus velit sodales eget leo fames netus hac tristique id mauris. Viverra hendrerit venenatis vulputate ultricies tempus quisque porta turpis quisque tellus proin curabitur metus neque, himenaeos sed viverra id mi nibh ipsum tellus suspendisse nisl dolor consectetur quis. ',
                approved: true
        ).save(failOnError: true)

        Problem problem4 = new Problem (
                user: testUser4,
                car:testCar1,
                system: 'Transmission',
                mileage: 128000,
                description: 'Taciti porttitor nullam ornare platea posuere ipsum eleifend accumsan quis massa congue dolor blandit, senectus velit sodales eget leo fames netus hac tristique id mauris. Viverra hendrerit venenatis vulputate ultricies tempus quisque porta turpis quisque tellus proin curabitur metus neque, himenaeos sed viverra id mi nibh ipsum tellus suspendisse nisl dolor consectetur quis. ',
                approved: true
        ).save(failOnError: true)

        Problem problem5 = new Problem (
                user: testUser4,
                car:testCar1,
                system: 'Transmission',
                mileage: 135000,
                description: 'Taciti porttitor nullam ornare platea posuere ipsum eleifend accumsan quis massa congue dolor blandit, senectus velit sodales eget leo fames netus hac tristique id mauris. Viverra hendrerit venenatis vulputate ultricies tempus quisque porta turpis quisque tellus proin curabitur metus neque, himenaeos sed viverra id mi nibh ipsum tellus suspendisse nisl dolor consectetur quis. ',
                approved: true
        ).save(failOnError: true)

        //brakes problems
        Problem problem6 = new Problem (
                user: testUser1,
                car:testCar1,
                system: 'Brakes',
                mileage: 96000,
                description: 'Taciti porttitor nullam ornare platea posuere ipsum eleifend accumsan quis massa congue dolor blandit, senectus velit sodales eget leo fames netus hac tristique id mauris. Viverra hendrerit venenatis vulputate ultricies tempus quisque porta turpis quisque tellus proin curabitur metus neque, himenaeos sed viverra id mi nibh ipsum tellus suspendisse nisl dolor consectetur quis. ',
                approved: true
        ).save(failOnError: true)

        Problem problem7 = new Problem (
                user: testUser1,
                car:testCar1,
                system: 'Brakes',
                mileage: 90000,
                description: 'Taciti porttitor nullam ornare platea posuere ipsum eleifend accumsan quis massa congue dolor blandit, senectus velit sodales eget leo fames netus hac tristique id mauris. Viverra hendrerit venenatis vulputate ultricies tempus quisque porta turpis quisque tellus proin curabitur metus neque, himenaeos sed viverra id mi nibh ipsum tellus suspendisse nisl dolor consectetur quis. ',
                approved: true
        ).save(failOnError: true)

        Problem problem8 = new Problem (
                user: testUser3,
                car:testCar1,
                system: 'Brakes',
                mileage: 88000,
                description: 'Taciti porttitor nullam ornare platea posuere ipsum eleifend accumsan quis massa congue dolor blandit, senectus velit sodales eget leo fames netus hac tristique id mauris. Viverra hendrerit venenatis vulputate ultricies tempus quisque porta turpis quisque tellus proin curabitur metus neque, himenaeos sed viverra id mi nibh ipsum tellus suspendisse nisl dolor consectetur quis. ',
                approved: true
        ).save(failOnError: true)

        Problem problem9 = new Problem (
                user: testUser4,
                car:testCar1,
                system: 'Brakes',
                mileage: 65000,
                description: 'Taciti porttitor nullam ornare platea posuere ipsum eleifend accumsan quis massa congue dolor blandit, senectus velit sodales eget leo fames netus hac tristique id mauris. Viverra hendrerit venenatis vulputate ultricies tempus quisque porta turpis quisque tellus proin curabitur metus neque, himenaeos sed viverra id mi nibh ipsum tellus suspendisse nisl dolor consectetur quis. ',
                approved: true
        ).save(failOnError: true)

        Problem problem10 = new Problem (
                user: testUser4,
                car:testCar1,
                system: 'Brakes',
                mileage: 140000,
                description: 'Taciti porttitor nullam ornare platea posuere ipsum eleifend accumsan quis massa congue dolor blandit, senectus velit sodales eget leo fames netus hac tristique id mauris. Viverra hendrerit venenatis vulputate ultricies tempus quisque porta turpis quisque tellus proin curabitur metus neque, himenaeos sed viverra id mi nibh ipsum tellus suspendisse nisl dolor consectetur quis. ',
                approved: false
        ).save(failOnError: true)

        // Honda 2003 Accord problems
        Problem problem11 = new Problem (
                user: testUser2,
                car:testCar2,
                system: 'Body/Paint',
                mileage: 80000,
                description: 'Taciti porttitor nullam ornare platea posuere ipsum eleifend accumsan quis massa congue dolor blandit, senectus velit sodales eget leo fames netus hac tristique id mauris. Viverra hendrerit venenatis vulputate ultricies tempus quisque porta turpis quisque tellus proin curabitur metus neque, himenaeos sed viverra id mi nibh ipsum tellus suspendisse nisl dolor consectetur quis. ',
                approved: true
        ).save(failOnError: true)


        // Honda 20013 Civic problems
        Problem problem12 = new Problem (
                user: testUser2,
                car:testCar3,
                system: 'Fuel system',
                mileage: 150000,
                description: 'Taciti porttitor nullam ornare platea posuere ipsum eleifend accumsan quis massa congue dolor blandit, senectus velit sodales eget leo fames netus hac tristique id mauris. Viverra hendrerit venenatis vulputate ultricies tempus quisque porta turpis quisque tellus proin curabitur metus neque, himenaeos sed viverra id mi nibh ipsum tellus suspendisse nisl dolor consectetur quis. ',
                approved: true
        ).save(failOnError: true)


        // Dodge Ram 1500 problems

    }

}
