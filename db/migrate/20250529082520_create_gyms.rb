class CreateGyms < ActiveRecord::Migration[8.0]
  def change
    create_table :gyms do |t|
      t.string :name, null: false
      t.string :location
      t.string :url

      t.timestamps
    end
  end
end
