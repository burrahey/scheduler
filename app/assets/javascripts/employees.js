function getEmployees(){
  $.getJSON("/employees", function(response){
    response.forEach(employee => new Employee(employee))
  });
}

let employeeArray = [];
function Employee(attributes){
  this.id = attributes.id;
  this.first_name = attributes.first_name;
  this.last_name = attributes.last_name;
  this.role = attributes.role

  this.preferences = attributes.preferences.map(preference => new Preference(preference));
  employeeArray.push(this);
}

function Preferences(attributes){
  this.day = attributes.day;
  this.desc = attributes.desc;
}
