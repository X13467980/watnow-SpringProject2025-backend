module Api
  module V1
    class SessionsController < ApplicationController
      def create
        user = User.find_by(email: params[:email])
        if user&.authenticate(params[:password])
          session[:user_id] = user.id
          render json: { message: "ログイン成功", user: user }, status: :ok
        else
          render json: { error: "メールアドレスまたはパスワードが間違っています" }, status: :unauthorized
        end
      end

      def destroy
        reset_session
        render json: { message: "ログアウト成功" }, status: :ok
      end

      def current
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
