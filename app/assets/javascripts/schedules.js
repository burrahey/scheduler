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

  this.employee = new scheduleEmployee(attributes.employee);
}

function scheduleEmployee(attributes){
  this.id = attributes.id;
  this.first_name = attributes.first_name;
  this.last_name = attributes.last_name;
}

Schedule.prototype.displaySchedule = function(){
  var id = this.id;

   $("h1#title").append("Week of " + this.start_date.format('MMM D')
   + " - " + this.end_date.format('MMM D, YYYY'));

  var publishString = "";

  if(this.published){
     publishString += `<a rel="nofollow" data-method="post" href="/schedules/${id}/publish">Publish</a> || `
  };

  var deleteString = `<a rel="nofollow" data-method="delete" href="/schedules/${id}">Delete</a> || `;

  var addShiftString =  `<a href="/schedules/${id}/shifts/new">Add Shift</a>`
  $("h3#header-options").append(publishString + deleteString + addShiftString);

  this.shifts.forEach(function(shift){
  var shiftString = shift.start_time.format('h:mma') + " - " + shift.end_time.format('h:mma') + " " + shift.employee.first_name + " " + shift.employee.last_name;

  if(shift.published){
   shiftString += " - PUBLISHED"
};

shiftString += " - " + `<a href="/schedules/${id}/shifts/${shift.id}/edit">EDIT</a>` + " | ";

shiftString += `<a rel="nofollow" data-method="delete" href="/schedules/${id}/shifts/${shift.id}">DELETE</a>` + "<br />";

$("div#" + shift.date.format('dddd')).append(shiftString);
 });
};

function getSchedule(id){
  $.getJSON("/schedules/" + id, function(response){
    schedule = new Schedule(response);
    schedule.displaySchedule();
  });
}
