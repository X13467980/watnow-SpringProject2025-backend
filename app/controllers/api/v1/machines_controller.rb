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

        # 両方のAPIを呼び出す
        label_response = vision.label_detection(image: uploaded_file.tempfile.path)
        web_response   = vision.web_detection(image: uploaded_file.tempfile.path)

        label_labels = label_response.responses.first.label_annotations.map(&:description).compact
        web_labels   = web_response.responses.first.web_detection.web_entities.map(&:description).compact

        # 両方をマージし、重複排除
        labels = (label_labels + web_labels).uniq
        Rails.logger.info "🔥 Combined labels: #{labels.inspect}"

        # 複数マッチに変更
        matched_machines = Machine.all.select do |m|
          labels.any? do |label|
            m.name.downcase.include?(label.downcase) ||
              (m.label && m.label.downcase.include?(label.downcase))
          end
        end

        if matched_machines.present?
          render json: matched_machines.map { |machine|
            {
              machine_name: machine.name,
              image_url: machine.image_url,
              menus: machine.menus.map do |menu|
                {
                  id: menu.id,
                  name: menu.name,
                  part: menu.part,
                  count: menu.count,
                  set_count: menu.set_count,
                  weight: menu.weight
                }
              end
            }
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
