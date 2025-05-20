# frozen_string_literal: true

module Api
  module V1
    class SessionsController < ApplicationController
      def create
        user = User.find_by(email: params[:email])

        if user&.authenticate(params[:password])
          render json: { message: "ログイン成功", user: user }, status: :ok
        else
          render json: { error: "メールアドレスまたはパスワードが間違っています" }, status: :unauthorized
        end
      end

      def destroy
        # フロントエンド側でトークン削除の処理を行う前提
        render json: { message: "ログアウト成功" }, status: :ok
      end
    end
  end
end
