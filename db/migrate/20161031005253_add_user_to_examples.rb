class AddUserToExamples < ActiveRecord::Migration
  def change
    add_column :examples, :user_id, :integer
    add_index :examples, :user_id
  end
end
