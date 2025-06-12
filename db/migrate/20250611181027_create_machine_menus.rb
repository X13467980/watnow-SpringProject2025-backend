class CreateMachineMenus < ActiveRecord::Migration[8.0]
  def change
    create_table :machine_menus do |t|
      t.references :machine, null: false, foreign_key: true
      t.references :menu, null: false, foreign_key: true

      t.timestamps
    end
  end
end
