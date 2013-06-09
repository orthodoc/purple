module UsersHelper
  def secretary?
    user_signed_in? and current_user.has_role? :secretary
  end

  def admin?
    user_signed_in? and current_user.has_role? :admin
  end

end
