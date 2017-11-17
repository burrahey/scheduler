module Admin::EmployeeHelper
  def check_and_display_errors(object)
    if object.errors.any?
      object.errors.full_messages.join(".")
    end
  end
end
