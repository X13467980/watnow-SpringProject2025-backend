module Api
  module V1
    class UsersTrainingsController < ApplicationController
      def create
        puts "セッションのuser_id: #{session[:user_id]}"  # デバッグ用ログ
        unless session[:user_id]
          render json: { error: "ログインしてください#{@user_id}" }, status: :unauthorized and return
        end
        users_training = UsersTraining.new(users_training_params)
        users_training.user_id = session[:user_id]  # セッションからセット
        if users_training.save
          render json: { message: "記録に成功しました", users_training: users_training }, status: :created
        else
          render json: { errors: users_training.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def index
        users_trainings = UsersTraining.includes(:user, :menu)
        render json: users_trainings.as_json(
          include: {
             user: { only: [:id, :name] },
            menu: { only: [:id, :name, :part] }
          }
        )
      end

      def show
        users_training = UsersTraining.find_by(id: params[:id])
        if users_training
          render json: users_training.as_json(
            include: {
              user: { only: [:id, :name] },
              menu: { only: [:id, :name, :part] }
            }
          )
        else
          render json: { error: "記録が見つかりません" }, status: :not_found
        end
      end

      def update
        users_training = UsersTraining.find_by(id: params[:id])
        if users_training
          # セッションのuser_idで上書き（不正なuser_id更新防止）
          if users_training.update(users_training_params.merge(user_id: session[:user_id]))
            render json: { message: "記録の更新に成功しました", users_training: users_training }, status: :ok
          else
            render json: { errors: users_training.errors.full_messages }, status: :unprocessable_entity
          end
        else
          render json: { error: "記録が見つかりません" }, status: :not_found
        end
      end

      def destroy
        users_training = UsersTraining.find_by(id: params[:id])
        if users_training
          users_training.destroy
          render json: { message: "記録を削除しました" }, status: :ok
        else
          render json: { error: "記録が見つかりません" }, status: :not_found
        end
      end

      private

      def users_training_params
        params.require(:users_training).permit(:menu_id, :weight, :reps, :set_count, :training_date, :memo)
      end
    end
  end
end
