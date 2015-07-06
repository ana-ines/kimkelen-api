class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.string		:global_file_number
      t.integer		:person_id
      t.integer		:occupation_id
	  t.datetime	:busy_starts_at
	  t.datetime	:busy_ends_at
	  t.string		:blood_group
	  t.string		:blood_factor
	  t.string		:emergency
	  t.integer		:health_coverage_id
	  t.string		:older_of_merit
	  t.string		:folio_number
      t.timestamps	null: false
    end
    #add_foreign_key :students, :health_coverages
  end

  def self.down
  	drop_table :students 
  end
end
