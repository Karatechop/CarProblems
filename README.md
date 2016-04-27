#CarProblems

CarProblems is an MVP application that lets users submit and learn car problems by car mileage.
It was developed as a final project for Harvard University Extension School CSCIE-56 Web development using Groovy and Grails Spring 2016 course.

## Short description
Buying pre-owned cars is a gamble. Community sourced information on typical mileage related "health" issues of a given car model might provide critical information required for a successful purchase.

CarProblems will allow anonymous users to access such information while registered users will also be able to contribute it. Third type of users - admins - will manage the application.

Anonymous users will be able to brows cars and check their respective problem tracking pages.
Registered users will be able to login. Upon that they will be able to add to their profiles those car models that interest them most. This way they will have fast access to their problem details and will be able to contribute problems to these models. Apart from problem, specification and description, problem contributions will also contain basic information about submission author and time of submission. All relevant problem submissions will be displayed at car details page. Before becoming visible, each problem will have to be confirmed by an admin.
Admin users will have a dashboard displaying all problem submissions awaiting confirmation as well as lists of all users, cars and problems with buttons that allow basic CRUD functionalities.



## Current state
+ Domain models (simplified for MVP)
+ Domain models' unit tests
+ Simple services for creation of domain model instances
+ Integration tests for services
+ Grails generated CRUD controllers for domain models

##TODOs
+ Expand services with methods required for operation with domain model instances
+ More unit or integration tests for service methods
+ Implement Bootstrap
+ BootStrap.groovy with some test users, test cars and test problems
+ Create admin dashboard
+ Create problems details page
+ Create sign-up functionality
+ Create user profile
+ Create problem submission functionality with admin approval
+ Create functional tests

## Dependencies

+ twitter-bootstrap:3.3.5
+ spring-security-core:2.0.0




