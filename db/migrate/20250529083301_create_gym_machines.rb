class CreateGymMachines < ActiveRecord::Migration[8.0]
  def change
    create_table :gym_machines do |t|
      t.references :gym, null: false, foreign_key: true
      t.references :machine, null: false, foreign_key: true

      t.timestamps
    end
  end
end
