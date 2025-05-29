class CreateMenus < ActiveRecord::Migration[8.0]
  def change
    create_table :menus do |t|
      t.string :name
      t.references :machine, null: false, foreign_key: true
      t.string :part
      t.integer :count
      t.integer :set_count
      t.integer :time

      t.timestamps
    end
  end
end
