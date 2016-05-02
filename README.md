#CarProblems

CarProblems is an MVP application that lets users submit and learn car problems by car mileage.
It was developed as a final project for Harvard University Extension School CSCIE-56 Web development using Groovy and Grails Spring 2016 course.

## Short description
Buying pre-owned cars is a gamble. Community sourced information on typical mileage related "health" issues of a given car model might provide critical information required for a successful purchase.

CarProblems will allow anonymous users to access such information while registered users will also be able to contribute it. Third type of users - admins - will manage the application.

Anonymous users will be able to brows cars and check their respective problem tracking pages.
Registered users will be able to login. Upon that they will be able to add to their profiles those car models that interest them most. This way they will have fast access to their problem details and will be able to contribute problems to these models. Apart from problem, specification and description, problem contributions will also contain basic information about submission author and time of submission. All relevant problem submissions will be displayed at car details page. Before becoming visible, each problem will have to be confirmed by an admin.
Admin users will have a dashboard displaying all problem submissions awaiting confirmation as well as lists of all users, cars and problems with buttons that allow basic CRUD functionalities.

##NOTES
+ Log in as admin - use un: admin, p: pass
+ Log in as user - use un: testUser1, p: pass
+ Check 2002 Ford Explorer for best functionality representation

## Current state at checkpoint 2
+ Bootstrap css
+ Main landing page with login functionality
+ Example car page
+ carProfile page with car details, promlems summary and all problems sections. Median mileage is used for summary report (more robust than mean value)
+ Bootstrap.groovy provides test data

## Current state at chaeckpoint 1
+ Domain models (simplified for MVP)
+ Domain models' unit tests
+ Simple services for creation of domain model instances
+ Integration tests for services
+ Grails generated CRUD controllers for domain models

##TODOs
+ Expand services with methods required for operation with domain model instances - partly achieved, but there is still more work to do
+ More unit or integration tests for service methods - some additional unit tests added, more integration tests still required
+ Create admin dashboard
+ Create user profile
+ Create problem submission functionality with admin approval
+ Create car addition functionality for users
+ Bootstrap more data
+ Add mobile friendly features
+ Create functional tests

## Dependencies

+ twitter-bootstrap:3.3.5
+ spring-security-core:2.0.0




