Notes

To do:
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
- shift date cannot be before employee's date hired

Employee
has_many shifts
has_many schedules through shifts

Schedule
published: true/false (publishing a schedule makes all its shifts created thus far public)

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
