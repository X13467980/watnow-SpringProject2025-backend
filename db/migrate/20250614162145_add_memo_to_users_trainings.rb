class AddMemoToUsersTrainings < ActiveRecord::Migration[8.0]
  def change
    add_column :users_trainings, :memo, :string
  end
end
