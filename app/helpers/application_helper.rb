module ApplicationHelper
  def current_user
    @current_user ||= User.find_by(email: params['uid']) if params['uid']
  end
end