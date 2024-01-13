class AddPicturesFieldToProperties < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :pictures, :json, default: []
  end
end
