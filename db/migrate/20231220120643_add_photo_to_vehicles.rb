class AddPhotoToVehicles < ActiveRecord::Migration[7.1]
  def change
    add_column :vehicles, :photo, :string
  end
end
