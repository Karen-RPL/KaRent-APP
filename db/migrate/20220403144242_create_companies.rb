class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.time :time_open
      t.time :time_close
      t.text :address
      t.integer :user_id

      t.timestamps
    end
  end
end
