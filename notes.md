Notes

To do:
- allow others to create employees, with shifts. create an employee, as well as some shifts for that employee with a custom writer
- can add/edit/delete if you're the employee who owns the shift. can view if you're logged in
and create  employees/1/shifts/new
- Include nested resource show or index (URL e.g. users/2/recipes)
- allow for a new schedule to be created (has many through) - should be for a week only, assigns all employees a shift
nested employee form with shifts
- scheduler:
 For each day of the week:
  * assign a morning / afternoon chat shift, circling through associates evenly. assign phones to all the rest. repeat until completed.
  * assign supervisor roles to supervisors
- schedules index to display all
- schedules show page
- display the schedule somehow nicely per day
- get rid of all the extra devise files
- get rid of all the extra devise links

permissions
associates can add/edit/delete shifts for themselves on an existing schedule
associates can edit themselves
supervisors can add/edit/delete shifts for everyone on an existing schedule
supervisors can edit/delete employees
supervisors can view unpublished schedules
associates can only view published schedules

scope method
employee's shifts this week OR view only associates

- add permissions for admins. disallow everything by non-logged in users

Shift
- shift date cannot be before employee's date hired

Schedule
published: true/false (publishing a schedule makes all its shifts created thus far public)
