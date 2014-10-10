#Massage Therapist Scheduling App
[ ![Codeship Status for jereln/scheduling_app](https://www.codeship.io/projects/721b7af0-32cb-0132-4537-5696ea0452a8/status)](https://www.codeship.io/projects/40479)
[![Coverage Status](https://coveralls.io/repos/jereln/scheduling_app/badge.png)](https://coveralls.io/r/jereln/scheduling_app)
[![forthebadge](http://forthebadge.com/badges/validated-html2.svg)](http://forthebadge.com)

##Overview
The purpose of this app is to allow clients to book a reservation for a massage. The two different users of this app are massage therapists and clients. All users must create an account to use the site.

###Creating an open reservation block
When a therapist is signed in, they can create an available slot for booking. They must choose a date, start time, and end time.

###Making a reservation
Available slots show up on the calendar on the main page. Clients can only see slots that aren't booked. To book a reservation click on the desired date and pick a time within the available slot for your reservation. When a reservation is made, a confirmation email is sent to the client and the therapist. 

###Viewing your account
When a user is signed in, they can access their account page by clicking the link in the top right. The account page shows a users account info (with a link to update their info) and a list of all their current reservations (with a link to cancel the reservation).

###Therapist admin access
As mentioned before, a therapist can create available reservation slots. Additionally, their view on the homepage shows all appointments regardless of whether or not they are reserved. Therapists also have access to a list of all their current clients. 

##Approach
We knew that we needed to set up some models wit associations. Our original approach was to create a client model, therapist model, and appointment model. After working with this for a while, we realized that this would make working with authentication and Devise a pain. Ryan helped us move to a single self-referencing users model. After the models were updated, we went to work on the views, controllers, and mailers. 

##Resources
http://railscasts.com/episodes/213-calendars-revised  
http://patterntap.com/code/signup-form  
http://guides.rubyonrails.org/association_basics.html  

##Collaborators
-Ryan Sobol
-Brook Riggio
-Marco Lindsay
-Erik Nilsen