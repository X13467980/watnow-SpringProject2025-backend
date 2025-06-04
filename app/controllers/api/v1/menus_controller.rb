module Api
  module V1
    class MenusController < ApplicationController
      def create
        menu = Menu.new(menu_params)
        if menu.save
          render json: { message: "メニューの作成に成功しました", menu: menu }, status: :created
        else
          render json: { errors: menu.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def index
        menus = Menu.includes(:machine)
        render json: menus.as_json(include: { machine: { only: [ :id, :name ] } })
      end

      private

      def menu_params
        params.require(:menu).permit(:name, :machine_id, :part, :count, :set_count, :time, :weight)
      end
    end
  end
end
