class AddColumnToReadings < ActiveRecord::Migration
  def change
    add_column :readings, :temperature, :integer
    add_column :readings, :created_at, :datetime
    add_column :readings, :updated_at, :datetime

  end
end
