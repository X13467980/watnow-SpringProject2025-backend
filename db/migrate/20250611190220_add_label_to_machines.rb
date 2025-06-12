class AddLabelToMachines < ActiveRecord::Migration[8.0]
  def change
    add_column :machines, :label, :string
  end
end
