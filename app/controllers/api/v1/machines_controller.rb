module Api
  module V1
    class MachinesController < ApplicationController
      #   protect_from_forgery with: :null_session
      def identify
        render json: { message: "マシンの識別に成功しました！" }, status: :ok
      end

      def create
        machine = Machine.new(machine_params)
        if machine.save
          render json: { message: "マシンの登録に成功しました！", machine: machine }, status: :created
        else
          render json: { errors: machine.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def index
        machines = Machine.all
        render json: machines
        # 全マシン情報を取得
      end

      private

      def machine_params
        params.require(:machine).permit(:name, :image_url)
      end
    end
  end
end
