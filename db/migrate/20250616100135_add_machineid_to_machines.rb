class AddMachineidToMachines < ActiveRecord::Migration[8.0]
  def change
    add_column :machines, :machineid, :integer
    add_index :machines, :machineid
  end
end
