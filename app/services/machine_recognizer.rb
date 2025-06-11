require "google/cloud/vision"

class MachineRecognizer
  def initialize(image_path)
    @image_path = image_path
  end

  def detect_machine
    vision = Google::Cloud::Vision.image_annotator
    response = vision.label_detection(image: File.open(@image_path))
    labels = response.responses.first.label_annotations.map(&:description)

    # Machine.name に部分一致するかで検索
    Machine.all.each do |machine|
      return machine if labels.any? { |label| machine.name.downcase.include?(label.downcase) }
    end

    nil
  end
end