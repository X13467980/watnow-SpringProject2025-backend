module Api
  module V1
    class GymMachinesController < ApplicationController
      def create
        gym_machine = GymMachine.new(gym_machine_params)
        if gym_machine.save
          render json: { message: 'ジムとマシンの紐付けに成功しました', gym_machine: gym_machine }, status: :created
        else
          render json: { errors: gym_machine.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def index
        render json: GymMachine.all
      end

      private

      def gym_machine_params
        params.require(:gym_machine).permit(:gym_id, :machine_id)
      end
    end
  end
end