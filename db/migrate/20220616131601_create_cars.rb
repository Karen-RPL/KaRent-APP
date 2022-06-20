class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :name
      t.text :description
      t.integer :year
      t.integer :door
      t.integer :price
      t.string :transmittion
      t.integer :seat
      t.date :last_service_date
      t.string :petrol
      t.integer :id_company

      t.timestamps
    end
  end
end
