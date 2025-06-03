class CreateUsersTrainings < ActiveRecord::Migration[8.0]
  def change
    create_table :users_trainings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :menu, null: false, foreign_key: true
      t.datetime :training_date

      t.timestamps
    end
  end
end
