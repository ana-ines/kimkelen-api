class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.integer :state_id
      t.integer :city_id
      t.string :street
      t.string :number
      t.string :floor
      t.string :flat

      t.timestamps null: false
    end
  end

  def self.down
    drop_table :addresses
  end
end
