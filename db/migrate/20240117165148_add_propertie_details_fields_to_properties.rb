class AddPropertieDetailsFieldsToProperties < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :bathrooms, :integer, default: 0
    add_column :properties, :car_spaces, :integer, default: 0
    add_column :properties, :floors, :integer, default: 1
    add_column :properties, :furnished, :boolean, default: false
    add_column :properties, :subway_close, :boolean, default: false
    add_column :properties, :pet_friendly, :boolean, default: false
  end
end
