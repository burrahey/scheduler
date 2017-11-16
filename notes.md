Notes

To do:
- Create migrations/models
- Add validations
- Check to make sure all models work (including login via regular methods and oauth)
- Create employees via db:seed, allow others to create employees, with shifts
- Allow all shifts to be "published"
- Build scope method to view associate level employees only
- allow for a new schedule to be created (has many through) - should be for a week only, assigns all employees a shift
- scheduler:
 For each day of the week:
  * assign a morning / afternoon chat shift, circling through associates evenly. assign phones to all the rest. repeat until completed.
  * assign supervisor roles to admins
- display the schedule somehow nicely per day

If you have time:
- add permissions for admins. disallow everything by non-logged in users

Shift
- must be unique if for the same employee and on the same start_date_time
- shift date cannot be before employee's date hired
belongs_to employee
belongs_to schedule
belongs_to channel
columns:
start_date_time - cannot be empty
end_date_time - cannot be empty
published: true/false
channel_id
employee_id
schedule_id

Employee
Devise's user models
has_many shifts
has_many schedules through shifts
name - cannot be empty
email - cannot be empty, must be unique
password - cannot be empty
date_hired
role (associate, supervisor, admin, etc) using enum http://edgeapi.rubyonrails.org/classes/ActiveRecord/Enum.html

Schedule
has many shifts
has many employees, through shifts
published: true/false (publishing a schedule makes all its shifts created thus far public)

Channel
type = (phone, email, chat, messaging, PTO, supervisor, comp day)

permissions
associates can add/edit/delete shifts for themselves on an existing schedule
associates can edit themselves
supervisors can add/edit/delete shifts for everyone on an existing schedule
supervisors can edit/delete employees

scope method
employee's shifts this week

nested employee
create an employee, as well as some shifts for that employee with a custom writer

standard user auth, along with o-auth with devise

nested urls: employees/1/shifts (indicate which ones are public or not) - can add/edit/delete if you're the employee who owns the shift. can view if you're logged in
