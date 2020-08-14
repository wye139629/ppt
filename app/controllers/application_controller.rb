class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  
  helper_method :user_sign_in?, :current_user 
  # before_action :find_user

  private
  # def find_user
  #   if session[:user_token]
  #     @current_user = User.find(session[:user_token])
  #   end
  # end

  def user_sign_in?
    current_user != nil
  end

  def current_user
    # @current_user ||= User.find_by(id: session[:user_token])
    @current_user = @current_user || User.find_by(id: session[:user_token])

  end

  def not_found
    render file: '/public/404.html',status: 404, layout: false
  end

  def authenticate_user
    redirect_to root_path, notice: '請先登入' if not user_sign_in?
  end

end
