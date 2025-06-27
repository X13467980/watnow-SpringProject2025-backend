module Api
  module V1
    class MenusController < ApplicationController
      def index
        menus = Menu.all
        render json: menus
      end

      def show
        menu = Menu.find_by(id: params[:id])
        if menu
          render json: menu
        else
          render json: { error: "メニューが見つかりません" }, status: :not_found
        end
      end

      def create
        menu = Menu.new(menu_params)
        if menu.save
          render json: { message: "メニュー作成に成功しました", menu: menu }, status: :created
        else
          render json: { errors: menu.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        menu = Menu.find_by(id: params[:id])
        if menu&.update(menu_params)
          render json: { message: "メニュー更新に成功しました", menu: menu }, status: :ok
        else
          render json: { error: "メニューが見つかりません or 更新失敗", errors: menu&.errors&.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        menu = Menu.find_by(id: params[:id])
        if menu&.destroy
          render json: { message: "メニュー削除に成功しました" }, status: :ok
        else
          render json: { error: "メニューが見つかりません or 削除失敗" }, status: :not_found
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
        params.require(:menu).permit(:name, :part)
      end
    end
  end
end
