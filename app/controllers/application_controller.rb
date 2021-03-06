class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_user!
    redirect_to new_session_path, notice: "Please sign in." unless user_signed_in?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def current_post
    @current_post ||= Post.find params[:post_id]
  end

  def user_signed_in?
    session[:user_id].present?
  end
  helper_method :user_signed_in?

  def sign_in(user)
    session[:user_id] = user.id
  end

  def authenticate_user!
    redirect_to new_session_path, alert: "Please sign in" unless user_signed_in?
  end

  def full_name
    "#{first_name} #{last_name}".titleize
  end
  helper_method :full_name

end
