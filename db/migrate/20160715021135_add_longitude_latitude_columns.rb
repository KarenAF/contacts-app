class AddLongitudeLatitudeColumns < ActiveRecord::Migration
  def change
    add_column :contacts, :longitude, :float
    add_column :contacts, :latitude, :float
  end
end
