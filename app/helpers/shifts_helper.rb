module ShiftsHelper
  def shift_included_in_params?(shift_params)
    shift_params.values[1..-1].any? {|answer| !answer.empty?}
  end
end
