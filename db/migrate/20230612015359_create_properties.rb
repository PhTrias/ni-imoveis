class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :business_type
      t.integer :value
      t.integer :iptu
      t.integer :condominium
      t.integer :size
      t.integer :rooms
      t.string :zone
      t.string :address
      t.string :number
      t.string :neighborhood
      t.string :complement
      t.string :cep
      t.integer :full_price

      t.timestamps
    end
  end
end
