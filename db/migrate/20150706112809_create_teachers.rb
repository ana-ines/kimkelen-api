class CreateTeachers < ActiveRecord::Migration
  def self.up
    create_table :teachers do |t|
      t.integer :person_id
      t.float :salary
      t.date :sging_institution
      t.integer :file_number

      t.timestamps null: false
    end
  end

 def self.down
  	drop_table :teachers
  end
end
