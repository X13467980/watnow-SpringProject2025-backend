class ApplicationController < ActionController::API
  include ActionController::Cookies
  # before_action :current_user

  def current_user
    puts "セッションのuser_id: #{session[:user_id]}"  # デバッグ用ログ
    puts "セッション全体: #{session.to_h}" # デバッグ用ログ
    puts "Request cookies: #{request.cookies}" # デバッグ用ログ
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_login
    unless logged_in?
      puts "Authentication required. Current user: #{current_user&.id}" # デバッグ用ログ
      render json: { error: "ログインが必要です" }, status: :unauthorized
    end
  end
end
