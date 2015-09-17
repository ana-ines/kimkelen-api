class Student < ActiveRecord::Base
	self.table_name = "student"

	belongs_to :person
	has_many :student_tutors
	has_many :tutors, through: :student_tutors

	def image_path
		"#{self.self_path}/image"
	end

	def self_path
		"/student/#{self.id}"
	end

	def to_builder
	    Jbuilder.new do |student|
	      student.id id
	      student.global_file_number global_file_number
	      student.person person.to_builder
	      student._links _links(image_path)
	    end
  	end

  	def _links(path)
  		[ref: 'self', href: path, method: 'GET']
  	end

  	def to_builder_for_tutor
  		Jbuilder.new do |student|
  			student.id id
  			student.name "#{person.firstname}, #{person.lastname}"
  			student._links(self_path)
  		end
  	end
end