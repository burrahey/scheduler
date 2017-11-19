module ApplicationHelper
  def check_and_display_errors(object)
    if object.errors.any?
      object.errors.full_messages.join(". ") + "."
    end
  end

  def resource_scope(resource)
    if current_employee.supervisor?
      resource.all
    else
      resource.all.where(:published => true)
    end
  end
end
