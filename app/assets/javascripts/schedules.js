function Schedule(attributes){
  this.id = attributes.id;
  this.published = attributes.published;
  this.start_date = moment.utc(attributes.start_date);
  this.end_date = moment.utc(attributes.end_date);

  this.shifts = attributes.shifts.map(shift => new Shift(shift));
}

function Shift(attributes){
  this.id = attributes.id;
  this.date = moment.utc(attributes.date);
  this.start_time = moment.utc(attributes.start_time);
  this.end_time = moment.utc(attributes.end_time);
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
 $("h1#title").append("Week of " + this.start_date.format('MMM D')
 + " - " + this.end_date.format('MMM D, YYYY'));

 var publishString = `<a rel="nofollow" data-method="post" href="/schedules/${this.id}/publish">Publish</a>`

 var deleteString = `<a rel="nofollow" data-method="delete" href="/schedules/${this.id}">Delete</a>`

 var addShiftString =  `<a href="/schedules/${this.id}/shifts/new">Add Shift</a>`
 $("h3#header-options").append(publishString + " || " + deleteString + " || " + addShiftString);

 this.shifts.forEach(function(shift){
   var shiftString = shift.start_time.format('h:mma') + " - " + shift.end_time.format('h:mma') + " " + shift.employee.first_name + " " + shift.employee.last_name;

   if(shift.published){
     shiftString += " - PUBLISHED - "
   };

   shiftString += `<a href="/schedules/${this.id}/shifts/${shift.id}/edit">Edit</a>` + " | ";

   shiftString += `<a rel="nofollow" data-method="delete" href="/schedules/${this.id}/shifts/${shift.id}">Delete</a>` + "<br />";

  $("div#" + shift.date.format('dddd')).append(shiftString);
 });
};

function getSchedule(id){
  $.getJSON("/schedules/" + id, function(response){
    schedule = new Schedule(response);
    schedule.displaySchedule();
  });
}
