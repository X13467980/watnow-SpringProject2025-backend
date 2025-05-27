module Api
  module V1
    class UsersController < ApplicationController
      
      def create
        user = User.new(user_params)
        if user.save
          render json: { message: "ユーザー登録に成功しました", user: user }, status: :created
        else
          render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def index
        users = User.select(:id, :name, :email, :created_at)
        render json: users
      end

      def destroy
        user = User.find_by(id: params[:id])
        if user
          user.destroy
          render json: { message: "ユーザーを削除しました" }, status: :ok
        elsif user == nil
          render json: { error: "ユーザーが見つかりません" }, status: :not_found
        else
          render json: { error: "ユーザーの削除に失敗しました" }, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end

    end
  end
end