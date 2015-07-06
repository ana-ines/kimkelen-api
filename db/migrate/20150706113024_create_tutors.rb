class CreateTutors < ActiveRecord::Migration
  def self.up
    create_table :tutors do |t|
      t.integer :person_id
      t.integer :occupation_id
      t.integer :tutor_type_id
      t.integer :nationality
      t.integer :occupation_category_id
      t.integer :study_id
      t.boolean :is_alive

      t.timestamps null: false
    end
  end

  def self.down
    drop_table :tutors
  end
end
