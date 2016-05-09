package cscie56.fp

class Problem {

    static belongsTo = [car:Car, user:User]

    String system
    String description
    Integer mileage
    Date dateSubmitted = new Date()
    Boolean approved = null

    String toString(){
        system + " - " + mileage + " mi"
    }

    static constraints = {
        system (blank: false, inList: ["Transmission", "Body/Paint", "Interior accessories", "Wheels/Hubs",
                                       "Drivetrain", "Windows/Windshield", "Engine", "Suspension",
                                       "AC/Heater", "Exterior accessories", "Electrics", "Seat belt/Air bag",
                                       "Brakes", "Fuel system", "Lights", "Steering", "Cooling system",
                                       "Clutch", "Exhaust", "Misc"])
        description (blank: false, matches: "[a-zA-Z0-9,. ]*", size: 1..500)
        mileage (blank: false, validator:{val -> val>=0 && val<550000})
        approved (nullable: true)
        user (nullable: true)
            }
}
