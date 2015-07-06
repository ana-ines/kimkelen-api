class CreateTutorTypes < ActiveRecord::Migration
  def self.up
    create_table :tutor_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end

  def self.down
  	drop_table :tutor_types
  end
end
