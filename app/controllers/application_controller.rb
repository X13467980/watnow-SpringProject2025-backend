class ApplicationController < ActionController::API
  include ActionController::Cookies
  # before_action :current_user

  def current_user
    puts "セッションのuser_id: #{session[:user_id]}"  # デバッグ用ログ
    @current_user ||= User.find_by(id: @user_id)
  end
end
