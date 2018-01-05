function Employee(attributes){
  this.id = attributes.id;
  this.first_name = attributes.first_name;
  this.last_name = attributes.last_name;
  this.email = attributes.email;
  this.role = attributes.role;
  this.hire_date = moment.utc(attributes.date_hired);
  this.preferences = attributes.preferences.map(preference => preference.day + preference.desc);
}

Employee.prototype.displayEmployee = function(){
  var employeeString = `<strong> Name: ${this.first_name} ${this.last_name} </strong> <br />`;
  employeeString += `Email: ${this.email}<br />`;
  employeeString += `Date Hired: ${this.hire_date.format('MMMM Do YYYY')}<br />`;
  if(this.preferences.length > 0){
    employeeString += `Role: ${this.preferences}<br />`;
  }
  employeeString += `Role: ${this.role}<br /><br />`;
  employeeString += `<a href="/supervisor/employees/${this.id}">View</a> | `;
  employeeString += `<a href="/supervisor/employees/${this.id}/shifts">View Existing Shifts</a> | `
  employeeString += `<a href="/supervisor/employees/${this.id}/edit">Edit</a> | `
  employeeString += `<a rel="nofollow" data-method="delete" href="/supervisor/employees/${this.id}">Delete</a> | `
  employeeString += `<a href="/supervisor/employees/${this.id}/shifts/new">Add a Shift</a>`
  employeeString += '<br /><br />'
  $('div.all').append(employeeString);
}

function getEmployees(){
  $.getJSON("/supervisor/employees", function(response){
    response.forEach(function(employee){
      employee = new Employee(employee)
      employee.displayEmployee()
    });
  });
}

function Preferences(attributes){
  this.day = attributes.day;
  this.desc = attributes.desc;
}
