# [FINAL VERSION SUBMISSION]



# CarProblems
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

## A note on tests
Some integration tests depend on bootstrapped data and might fail after testing app's CRUD functionalities. Please run before editing/deleting original data.

##User experience

CarProblems caters to three types of users - anonymous, registered logged in and admin users.

### Anonymous user

CarProblems landing page offers anonymous users three options:

- "See example car" examine an exemplar car output
    * Example car section shows the profile of a first car in database. It shows basic car details, a summary of reported problems for this car and all admin approved problem submissions with details.
    * Example section has an "All cars" button in top left side of the screen. It leads to a simple index of all cars.
    
- "select car model" - choose a car to explore in a form in first tab
    * Upon selection of car model and a click on "Go" button, user will visit this car models' profile with car details, problem summary and approved problem submissions.
    
- "Log in" - use form in second tab to log in
    * if correct credentials are submitted a small menu will appear in top-right corner with a "logged in as" flag a button link to either User profile or Admin dashboard and a button link with log-out functionality.

### Logged in users

Upon successful login on the landing page, a logged in user has 4 options:
- Explore example car. Example car available to logged in user is similar to example car available to an anonymous user, but this time user will be able to navigate to user profiles by clicking on problem submission authors’ usernames.

- select a car to explore in the only visible tag "Browse cars" (the "log in" tab will not be visible anymore), click go and visit selected car profile.
    * Car profile will recognize the user if he owns this car with a statement that "this is one of his cars"
    * car profiles visible to logged in users also contain car details, problem summary and approved problem submissions, only this time problem submissions will also contain information on problem submission authors in form of a link to their user profiles.
    * If a logged in user visits a car profile of acar he does not own he will have an "add this car to your profile" button. If user clicks this button, car profile reloads and changes form - "this is one of your cars greeting appears". Also this car becomes visible in user's profile.
    
- click on "user profile" button link in top-right corner of the screen and visit his own profile
    * User profile will recognize its owner if he is logged in.
    * Logged in user's profile contains a table with car details of all cars he ownes with an option to remove this car from his profile.
    * Logged in user's profile contains a "submit a car new car problem button" that leads to a form that will allow user to submit a new car problem for one of the cars he owns.
        + If user submits form with wrong parameters, an error message will be displayed
        + If user submits correct parameters, he will be redirected to his profile. A message confirming his submission was received will be displayed and his new submission will be visible in the "Submissions waiting for admin approval" tab.
    * Logged in user's profile contains three tabs with his problem submissions:
        + "These problem submissions have been approved by admin" tab
        + "These problem submissions are waiting for admin approval" tab
        + "These problem submissions have been rejected by admin" tab
    * Click on a car problem submission author's username link in problem details table and visit this user's profile
        + Another user's profile will recognize that it is not its owner that is viewing it - no greeting and no problem submission button will be displayed.
        + Only admin approved problems tab will be visible

- use menu buttons in top-left side corner and navigate to car index
    * car index available to logged in user is similar to index available to an anonymous user, but this time user will be able to navigate to car profiles by clicking on car manufacturer names. 



### Admin user


Upon successful log-in on the landing page an admin user has 4 options:
- Explore example car. Will have same functionalities as for regular logged in user but with the addition of 4 buttons in top-left side of the screen - return Home and "Users", "Cars" and "Problems" all lead to respective admin only index pages with CRUD options.

- Navigate to car index clicking on "All cars" button in top-left corner. This time car index has multiple additional functionalities:
    * Edit button for every car
        + Takes admin to prefilled edit form, wrong parameters will result in error message, successful update will result in a confirmation and redirect to an admin only car instance presentation view ("Show car").
	+ "Show car" presents car details in a table and offers 4 buttons: Edit, Delete and Create car + visit publicly available car profile
    * Delete button for every car
    * Create a new car button
        + Takes admin to create car form, wrong parameters will result in error message, successful update will result in a confirmation and redirect to an admin only car instance presentation view ("Show car").
    * 4 buttons in top-left side of the screen - return Home and "Users", "Cars" and "Problems" all lead to respective admin only index pages with CRUD options.

- visit a car profile via landing page "Brows cars" tab
    * Looks and functions the same as described for example car.
    
- Navigate to admin dashboard via button in top-right screen corner. Admin dashboard offers several options ad information:
    * Collapsible "Manage" menu consisting of "Manage users", "Manage cars", "Manage problems" buttons - all lead to respective admin only index pages with CRUD options.
        + Manage users - takes admin to Users index table with "Edit" and "Delete" buttons and a "Create new user" button. If admin creates a new user, it will have a "ROLE_USER" by default. If a user is deleted, his former problem submissions remain in place.
        + Manage cars - described above.
        + Manage problems - takes admin to Users index table with "Edit" and "Delete" buttons and a "Create new problem" button.
    * An application summary table providing information on Total users, Total cars, Total problems submitted, total problems approved, Total problems awaiting approval, Total problems rejected.
    * A table with problem submission details that are waiting admin approval. Each problem submission has two buttons - "Approve" and "Reject". If approved or rejected problem submissions disappear from this table.



## Current state at checkpoint 2
+ Bootstrap css
+ Main landing page with login functionality
+ Example car page
+ carProfile page with car details, problems summary and all problems sections. Median mileage is used for summary report (more robust than mean value)
+ Bootstrap.groovy provides test data

## Current state at checkpoint 1
+ Domain models (simplified for MVP)
+ Domain models' unit tests
+ Simple services for creation of domain model instances
+ Integration tests for services
+ Grails generated CRUD controllers for domain models



## Dependencies

+ twitter-bootstrap:3.3.5
+ spring-security-core:2.0.0




