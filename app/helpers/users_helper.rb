module UsersHelper
  def user_authorized?(user)
    user == current_user
  end
end
