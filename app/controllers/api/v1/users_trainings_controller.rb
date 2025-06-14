module Api
  module V1
    class UsersTrainingsController < ApplicationController
      def create
        training = UsersTraining.new(users_training_params)
        if training.save
          render json: { message: "記録の作成に成功しました", training: training }, status: :created
        else
          render json: { errors: training.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def index
        trainings = UsersTraining.includes(:user, :menu).order(training_date: :desc)
        render json: trainings.as_json(include: {
          user: { only: [ :id, :name ] },
          menu: { only: [ :id, :name, :part ] }
        })
      end

      private

      def users_training_params
        params.require(:users_training).permit(:user_id, :menu_id, :training_date, :reps, :weight, :set_count, :memo)
      end
    end
  end
end
