class Student < ActiveRecord::Base
	self.table_name = "student"

	belongs_to :person

	def image_path
		"/student/#{self.id}/image"
	end

	def to_builder
	    Jbuilder.new do |student|
	      student.id id
	      student.global_file_number global_file_number
	      student.person person.to_builder
	      student._links _links
	    end
  	end

  	def _links
  		[ref: 'self', href: image_path, method: 'GET']
  	end
end
                  