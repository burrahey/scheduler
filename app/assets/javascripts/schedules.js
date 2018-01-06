function Schedule(attributes){
  this.id = attributes.id;
  this.published = attributes.published;
  this.start_date = moment.utc(attributes.start_date);
  this.end_date = moment.utc(attributes.end_date);
  this.shifts = attributes.shifts.map(shift => new Shift(shift));
}

function scheduleEmployee(attributes){
  this.id = attributes.id;
  this.first_name = attributes.first_name;
  this.last_name = attributes.last_name;
}

Schedule.prototype.displaySchedule = function(){
   $("h1#title").append("Week of " + this.start_date.format('MMM D')
   + " - " + this.end_date.format('MMM D, YYYY'));

  var publishString = "";
  if(this.published){
     publishString += `<a rel="nofollow" data-method="post" href="/schedules/${this.id}/publish">Publish</a> || `
  };
  var deleteString = `<a rel="nofollow" data-method="delete" href="/schedules/${this.id}">Delete</a> || `;
  var addShiftString =  `<a href="/shifts/new">Add Shift</a>`
  $("h3#header-options").append(publishString + deleteString + addShiftString);
};

function getSchedule(id){
  $.getJSON("/schedules/" + id, function(response){
    schedule = new Schedule(response);
    schedule.displaySchedule();
    schedule.displayShifts();
  });
}

Schedule.prototype.displayShifts = function(){
  this.shifts.forEach(function(shift){
    shift.displayIndividualShift();
   })
};

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

Shift.prototype.displayIndividualShift = function(){
  var shiftString = this.start_time.format('h:mma') + " - " + this.end_time.format('h:mma') + " " + this.employee.first_name + " " + this.employee.last_name;
  if(this.published){
   shiftString += " - PUBLISHED"
  };
  shiftString += " - " + `<a href="/shifts/${this.id}/edit">EDIT</a>` + " | ";
  shiftString += `<a rel="nofollow" data-method="delete" href="/shifts/${this.id}">DELETE</a>` + "<br />";
  $("div#" + this.date.format('dddd')).append(shiftString);
}

function addShift(newShift){
  shift = new Shift(newShift);
  shift.displayIndividualShift();
}
