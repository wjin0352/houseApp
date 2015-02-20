class AddColumnToThermometers < ActiveRecord::Migration
  def change
      add_column :thermometers, :maxTemp, :integer
      add_column :thermometers, :minTemp, :integer
      add_column :thermometers, :readingsOn, :boolean

  end
end
