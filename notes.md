Notes

To do:
- need to fix edit and delete shifts on schedule
- refactor scheduling model its a beast
- do you care about displays at all?
- can add/edit/delete if you're the employee who owns the shift. can view if you're logged in
and create  employees/1/shifts/new
- allow for a new schedule to be created (has many through) - should be for a week only, assigns all employees a shift
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

- add permissions for admins. disallow everything by non-logged in users

Shift
- shift date cannot be before employee's date hired

Schedule
published: true/false (publishing a schedule makes all its shifts created thus far public)
