# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
   -  Using Rails 6 for this project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
   -  A User has_many Invitations
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
   -  An Invitation belongs_to a User
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
   -  A User has_many Languages, through LanguageUsers
   -  A Language has_many Users, through LanguageUsers
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
   -  A Flag has_and_belongs_to_many Languages
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
   -  A LanguageUser is able to specify whether a Language is foreign or not (native)
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
   -  Most models have validations for presence
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
   -  The User and Invitation models contain instance methods that would do the same, however, for the sake of formatting, I decided against using them as scope methods (i.e. /users/:id/friends)
- [x] Include signup
- [x] Include login
- [x] Include logout
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
   -  Login with GitHub
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
   -  users/invitation
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
   -  Administrators have access to a /users/:id/invitations/new route to manually create friend requests
- [x] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate