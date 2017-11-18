Notes
- when a shift is added, we look for a schedule
- when a schedule is not found, we say please make a schedule first
- when a schedule is found, we add the shift to that schedule

- develop a regular shifts index page (maybe enter a date range) - maybe 'search'

- you should be able to click the schedule to add, edit or delete a shift WITHOUT an employee. SHIFTS CONTROLLER!

- get rid of all the extra devise links


To do:
permissions
associates can add/edit/delete shifts for themselves on an existing schedule
associates can edit themselves
supervisors can add/edit/delete shifts for everyone on an existing schedule
supervisors can edit/delete employees
supervisors can view unpublished schedules
associates can only view published schedules
- can add/edit/delete if you're the employee who owns the shift. can view if you're logged in
and create  employees/1/shifts/new

- add permissions for admins. disallow everything by non-logged in users


round 2:
- display the schedule somehow nicely per day. use scope methods to isolate schedule for each day
- when you make a shift, it should get added to the appropriate schedule
- there should only be one schedule for that week - either published or not published
- you can assign an employee to a shift or switch it out easily
- you should be able to change employees for a shift - a shift should be tied to its schedule, NOT its employee
- when you create a shift, it should find_or_create_by_ a schedule that it should belong to: e.g. you create a shift, it looks for the beginning of the week of that date, find_or_create_by_ schedule
- then you can leave the employee shift functionality but you can add most of the same functionality thru the schedule
