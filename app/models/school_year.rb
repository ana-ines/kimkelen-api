class SchoolYear < ActiveRecord::Base
	self.table_name = "school_year"

	has_many :career_school_years
	has_many :courses
end
