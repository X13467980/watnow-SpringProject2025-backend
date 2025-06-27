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

      def destroy
        menu = Menu.find_by(id: params[:id])
        if menu
          menu.destroy
          render json: { message: "メニューを削除しました" }, status: :ok
        else
          render json: { error: "メニューが見つかりません" }, status: :not_found
        end
      end

      def update
        menu = Menu.find_by(id: params[:id])
        if menu
          if menu.update(menu_params)
            render json: { message: "メニューの更新に成功しました", menu: menu }, status: :ok
          else
            render json: { errors: menu.errors.full_messages }, status: :unprocessable_entity
          end
        else
          render json: { error: "メニューが見つかりません" }, status: :not_found
        end
      end

      def show
        menu = Menu.find_by(id: params[:id])
        if menu
          render json: menu.as_json(include: { machine: { only: [ :id, :name ] } })
        else
          render json: { error: "メニューが見つかりません" }, status: :not_found
        end
      end

      def grouped_by_part
        grouped = Menu.all.group_by(&:part)
        result = grouped.map do |part, menus|
          {
            name: part,
            exercises: menus.map(&:name).uniq
          }
        end
        render json: result
      end

      private

      def menu_params
        params.require(:menu).permit(:name, :machine_id, :part, :count, :set_count, :time, :weight)
      end
    end
  end
end
