class AddUserIdToUsers < ActiveRecord::Migration
  def change
    add_column :thermometers, :user_id, :integer
  end
end
