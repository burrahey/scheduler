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
  var employeeString = `<strong> Name: ${this.first_name} ${this.last_name} </strong> <br>`;
  employeeString += `Email: ${this.email}<br>`;
  employeeString += `Date Hired: ${this.hire_date.format('MMMM Do YYYY')}<br>`;
  employeeString += `Role: ${this.role}<br><br><br>`;

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
