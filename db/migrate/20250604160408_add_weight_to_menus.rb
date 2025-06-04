class AddWeightToMenus < ActiveRecord::Migration[8.0]
  def change
    add_column :menus, :weight, :float
  end
end
