class CreateThermometers < ActiveRecord::Migration
  def change
    create_table :thermometers do |t|

      t.timestamps null: false
    end
  end
end
