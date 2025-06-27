module Api
  module V1
    class UsersTrainingsController < ApplicationController
      before_action :require_login, only: [:create, :update, :destroy]
      
      def create
        puts "=== UsersTraining Create Debug ==="
        puts "セッションのuser_id: #{session[:user_id]}"  # デバッグ用ログ
        puts "Current user: #{current_user&.id}"  # デバッグ用ログ
        puts "Request origin: #{request.headers['Origin']}"  # デバッグ用ログ
        puts "Request cookies: #{request.cookies}"  # デバッグ用ログ
        puts "Request user agent: #{request.headers['User-Agent']}"  # デバッグ用ログ
        puts "=================================="
        
        users_training = UsersTraining.new(users_training_params)
        users_training.user_id = current_user.id
        if users_training.save
          render json: { message: "記録に成功しました", users_training: users_training }, status: :created
        else
          render json: { errors: users_training.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def index
        # ログインユーザーの記録のみ表示（セキュリティ向上）
        if current_user
          users_trainings = current_user.users_trainings.includes(:user, :menu)
          render json: users_trainings.as_json(
            include: {
              user: { only: [:id, :name] },
              menu: { only: [:id, :name, :part] }
            }
          )
        else
          # ログインしていない場合は全体を表示（または要認證にする）
          users_trainings = UsersTraining.includes(:user, :menu)
          render json: users_trainings.as_json(
            include: {
              user: { only: [:id, :name] },
              menu: { only: [:id, :name, :part] }
            }
          )
        end
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
          # 自分の記録のみ更新可能
          if users_training.user_id != current_user.id
            render json: { error: "この記録を更新する権限がありません" }, status: :forbidden
            return
          end
          
          if users_training.update(users_training_params.merge(user_id: current_user.id))
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
          # 自分の記録のみ削除可能
          if users_training.user_id != current_user.id
            render json: { error: "この記録を削除する権限がありません" }, status: :forbidden
            return
          end
          
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
