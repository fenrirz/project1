class Admin::ApplicationController < ApplicationController
  protect_from_forgery

  def require_admin_login
    if current_user.nil? || !current_user.is_admin?
      flash[:notice] = "Only Admins are permitted"
      redirect_to log_in_path
    else
      return current_user
    end
  end

end
