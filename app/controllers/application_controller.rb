class ApplicationController < ActionController::Base
  include UsersHelper
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) ||
      if resource.is_a?(User) && secretary?
        patients_path
      elsif resource.is_a?(User) && admin?
        users_path
      super
    end
  end
end
