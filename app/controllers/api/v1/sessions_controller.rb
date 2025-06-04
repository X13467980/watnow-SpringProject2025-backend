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
    end
  end
end
