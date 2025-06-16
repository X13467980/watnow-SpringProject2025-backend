class AddDetailsToUsersTrainings < ActiveRecord::Migration[8.0]
  def change
    add_column :users_trainings, :reps, :integer
    add_column :users_trainings, :weight, :float
    add_column :users_trainings, :set_count, :integer
  end
end
