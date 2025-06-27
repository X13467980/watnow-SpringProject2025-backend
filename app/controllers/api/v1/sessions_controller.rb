module Api
  module V1
    class SessionsController < ApplicationController
      def create
        puts "Login attempt for email: #{params[:email]}" # デバッグ用ログ
        puts "Request headers: #{request.headers.to_h.select { |k, v| k.match(/cookie|session/i) }}" # デバッグ用ログ
        user = User.find_by(email: params[:email])
        if user&.authenticate(params[:password])
          session[:user_id] = user.id  # セッションにuser_idを保存
          puts "Login successful. Session user_id: #{session[:user_id]}" # デバッグ用ログ
          puts "Session after login: #{session.to_h}" # デバッグ用ログ
          puts "Response cookies: #{response.cookies}" # デバッグ用ログ
          render json: { message: "ログイン成功", user: user }, status: :ok
        else
          puts "Login failed for email: #{params[:email]}" # デバッグ用ログ
          render json: { error: "メールアドレスまたはパスワードが間違っています" }, status: :unauthorized
        end
      end

      def destroy
        reset_session
        render json: { message: "ログアウト成功" }, status: :ok
      end

      def current
        puts "Current user session: #{session[:user_id].inspect}" # デバッグ用ログ
        if session[:user_id]
          user = User.find_by(id: session[:user_id])
          if user
            render json: { user: user }, status: :ok
          else
            render json: { error: "ユーザーが見つかりません" }, status: :not_found
          end
        else
          render json: { user: nil }, status: :ok
        end
      end
    end
  end
end
