package cscie56.fp

class Problem {

    static belongsTo = [car:Car]

    String system
    String description
    boolean approved

    static constraints = {
        system (blank: false, matches: "[a-zA-Z0-9 ]*", size: 1..50)
        description (blank: false, matches: "[a-zA-Z0-9 ]*", size: 1..250)
            }
}
