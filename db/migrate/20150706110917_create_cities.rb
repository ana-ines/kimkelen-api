class CreateCities < ActiveRecord::Migration
  def self.up
    create_table :cities do |t|
      t.string :zip_code
      t.string :name
      t.integer :state_id

      t.timestamps null: false
    end
  end

  def self.down
  	drop_table :cities
  end
end
