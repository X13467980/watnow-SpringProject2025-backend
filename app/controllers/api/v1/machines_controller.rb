require "google/cloud/vision"

module Api
  module V1
    class MachinesController < ApplicationController
      # POST /api/v1/machines/identify
      def identify
        uploaded_file = params[:image]
        unless uploaded_file
          return render json: { error: "画像が送信されていません" }, status: :bad_request
        end

        vision = Google::Cloud::Vision.image_annotator
        response = vision.label_detection(image: uploaded_file.tempfile.path)
        labels = response.responses.first.label_annotations.map(&:description)

        machine = Machine.all.find do |m|
          labels.any? { |label| m.name.downcase.include?(label.downcase) }
        end

        if machine
          render json: {
            machine_name: machine.name,
            image_url: machine.image_url,
            menus: machine.menus.map do |menu|
              {
                name: menu.name,
                part: menu.part,
                count: menu.count,
                set_count: menu.set_count,
                weight: menu.weight
              }
            end
          }
        else
          render json: { error: "マシンが特定できませんでした。" }, status: :not_found
        end
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
      end

      private

      def machine_params
        params.require(:machine).permit(:name, :image_url)
      end
    end
  end
end