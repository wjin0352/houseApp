class RemoveColumnFromThermometers < ActiveRecord::Migration
  def change
    remove_column :thermometers, :temperature, :integer
  end
end
