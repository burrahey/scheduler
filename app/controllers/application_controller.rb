class ApplicationController < ActionController::Base
  include ApplicationHelper
  include ShiftsHelper

  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end

  def require_login
    redirect_to root_path, alert: "Please sign in first" unless employee_signed_in?
  end

  def require_supervisor
    redirect_to root_path, alert: "You must be a supervisor to complete this action" unless current_employee.supervisor?
  end

end
