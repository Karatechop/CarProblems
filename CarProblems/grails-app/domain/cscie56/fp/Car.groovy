package cscie56.fp

class Car {

    static belongsTo = [user:User]
    static hasMany = [problems:Problem, users:User]

    String manufacturer
    String carModel
    Integer year
    String fuel
    Integer doors

    static constraints = {
        manufacturer (blank: false, matches: "[a-zA-Z0-9 ]*", size: 1..50)
        carModel (blank: false, matches: "[a-zA-Z0-9 ]*", size: 1..50, unique: true, validator: {val, Car -> val.contains(Car.year.toString())})
        year (blank: false, validator:{val -> val <= Calendar.getInstance().get(Calendar.YEAR)})
        fuel (blank: false, inList: ["Gasoline", "Diesel", "Gas", "Electric", "Hybrid"])
        doors (blank: false, validator:{val -> val>=3 && val<10})

    }
}
