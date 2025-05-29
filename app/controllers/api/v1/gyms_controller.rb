module Api
  module V1
    class GymsController < ApplicationController
      def create
        gym = Gym.new(gym_params)
        if gym.save
          render json: { message: 'Gym created successfully', gym: gym }, status: :created
        else
          render json: { errors: gym.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def index
        gyms = Gym.all
        render json: gyms
        # 全ジム情報を取得
      end

      private

      def gym_params
        params.require(:gym).permit(:name, :location, :url)
      end
    end
  end
end