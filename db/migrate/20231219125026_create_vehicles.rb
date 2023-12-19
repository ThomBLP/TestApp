class CreateVehicles < ActiveRecord::Migration[7.1]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.text :description
      t.integer :price

      t.timestamps
    end
  end
end
