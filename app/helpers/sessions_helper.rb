module SessionsHelper
  def log_in user
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
    
  end

  def log_out
    @current_user = nil
    session[:user_id] = nil
  end
  
  def current_user?(given_user)
      current_user.name == given_user.name
  end
end
