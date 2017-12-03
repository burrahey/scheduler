# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project. Check.
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes). An employee and a schedule has many shifts.
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User). A shift belongs to a schedule.
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients). An employee has many preferences through employee_preferences
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity). You can add / edit a preference 
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item). You can't add a shift for an employee twice in one day. Most fields can't be blank.
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes). You can choose to view only associates in Employee.
- [x] Include signup (how e.g. Devise) Done.
- [x] Include login (how e.g. Devise) Done.
- [x] Include logout (how e.g. Devise) Done.
- [x] Include third party signup/login (how e.g. Devise/OmniAuth). Done (Facebook).
- [x] Include nested resource show or index (URL e.g. users/2/recipes). Employees have shifts.
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients). You can make new shifts for employees.
- [x] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item). You can make new shifts for employees.
- [x] Include form display of validation errors (form URL e.g. /recipes/new). Yep, it will tell you if you filled out the form incorrectly.

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
