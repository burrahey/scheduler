module SchedulesHelper

  def title_view_of_schedule(schedule)
    link_to "Week of " + schedule.start_date.strftime("%A, %B %e, %Y"), schedule_path(schedule)
  end
end
