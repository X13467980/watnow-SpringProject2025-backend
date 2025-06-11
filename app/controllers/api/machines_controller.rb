class Api::MachinesController < ApplicationController
  def identify
    uploaded_file = params[:image]
    return render json: { error: "画像ファイルが必要です" }, status: :bad_request unless uploaded_file

    temp_path = Rails.root.join("tmp", uploaded_file.original_filename)
    File.open(temp_path, "wb") { |f| f.write(uploaded_file.read) }

    recognizer = MachineRecognizer.new(temp_path)
    machine = recognizer.detect_machine

    if machine
      render json: {
        machine_name: machine.name,
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
      render json: { error: "マシンを特定できませんでした" }, status: :not_found
    end
  end
end