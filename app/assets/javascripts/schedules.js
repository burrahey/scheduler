function Schedule(attributes){
  this.id = attributes.id;
  this.published = attributes.published;
  this.start_date = new Date(attributes.start_date);
  this.end_date = new Date(attributes.end_date);

  this.shifts = attributes.shifts.map(shift => new Shift(shift));
}

function Shift(attributes){
  this.id = attributes.id;
  this.date = new Date(attributes.date);
  this.start_time = new Date(attributes.start_time);
  this.end_time = new Date(attributes.end_time);
  this.published = attributes.published;
  this.employee_id = attributes.employee_id;
  this.schedule_id = attributes.schedule_id;

  this.employee = new Employee(attributes.employee);
}

function Employee(attributes){
  this.id = attributes.id;
  this.first_name = attributes.first_name;
  this.last_name = attributes.last_name;
}

Schedule.prototype.displaySchedule = function(){
 $("h1#title").append("Week of " + this.start_date.toUTCString()
 + " - " + this.end_date.toUTCString());

 this.shifts.forEach(function(shift){
   shiftString = shift.start_time.toUTCString() + " " + shift.end_time.toUTCString() + " " + shift.employee.first_name
  $("div#lol").append(shiftString);
 });
};

function getSchedule(id){
  $.getJSON("/schedules/" + id, function(response){
    schedule = new Schedule(response);
    schedule.displaySchedule();
  });
}
