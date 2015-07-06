class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string :last_name
      t.string :first_name
      t.integer :identification_type
      t.boolean :is_active
      t.string :email
      t.string :phone
      t.string :observations
      t.integer :addres_id
      t.integer :user_id
      t.integer :sex
      t.string :cuil
      t.date :birthdate
      t.string :birth_country
      t.string :birth_state
      t.string :birth_city
      t.string :photo

      t.timestamps null: false
    end
  end

  def self.down
    drop_table :people
  end
end
