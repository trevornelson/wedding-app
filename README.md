# Requirements

*  Create a basic Sinatra CRUD Application
*  3 or More Models / resources
     *  This includes the Users Model
*  2 or More Active Record Relations
*  Implement User Authentication
*  1 or more Model Tests
*  1 or more Controller Tests
*  1 or More AJAX GET methods
*  1 or More AJAX UPDATE methods
*  1 or More Javascript Objects

# User Stories

* As a user, I want to log in
* As a user, I want to view wedding details
* As a user, I want to respond to the invitation
* As a user, I want to post marriage advice
* As a user, I want to view a wedding gift registry
* As a user, I want to mark an item in the wedding gift registry as purchased
* As an admin, I want to view RSVP responses 
* As an admin, I want to add items to the registry
* As a user, I want to view flight options [optional]
* As a user, I want to view hotel options [optional]
* As a user, I want to post a reception song list recommendation [optional]
* As a user, I want to post images of the bride and groom [optional]
* As a user, I want to view images of the bride and groom [optional]
* As an admin, I want to add marriage advice/notes prompts

# Schema

### Users
* type -> string ('Admin', 'Attending', 'NotAttending', 'NoResponse')
* username -> string (defaults to their street address)
* password_digest -> string
* first_name -> string (not null)
* last_name -> string
* street_address -> string
* city -> string
* state -> string
* zip_code -> string
* invited_plus_one -> boolean (dictates if view shows wedding party size field)
* number_in_party -> integer (default is one)

### Notes
* prompt_id -> string [optional]
* content -> text
* user_id -> integer

### Gifts
* title -> string
* category -> string
* url -> string
* image -> string (product image url)
* purchased -> boolean

### Songs
* user_id -> integer
* name -> string
* artist -> string
* url -> string [optional]

### Prompts
* content -> string






