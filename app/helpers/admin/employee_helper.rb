module Admin::EmployeeHelper
  def check_and_display_errors(object)
    if object.errors.any?
      object.errors.full_messages.join(". ") + "."
    end
  end

  def shift_included_in_params?(shift_params)
    shift_params.values[1..-1].any? {|answer| !answer.empty?}
  end
end
