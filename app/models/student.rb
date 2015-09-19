class Student < ActiveRecord::Base
	self.table_name = "student"

	belongs_to :person
	has_many :student_tutors
	has_many :tutors, through: :student_tutors
	has_many :student_career_school_years
	has_many :course_subject_students
	has_many :student_approved_career_subjects

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

	def to_builder_for_tutor
		Jbuilder.new do |student|
			student.id id
			student.name "#{person.firstname}, #{person.lastname}"
			student._links(self_path)
		end
	end

	def marks_to_builder(school_year)
  	career_school_year = CareerSchoolYear.find_by(school_year: school_year)
 		@student_career_school_year = StudentCareerSchoolYear.find_by(student: self, career_school_year: career_school_year)
		Jbuilder.new do |student|
			student.school_year school_year
			student.year @student_career_school_year.year
			student.status @student_career_school_year.status
			student.course_subjects course_subjects_students_for(school_year).map { |css| css.to_builder.attributes! }
			student.global_average global_average(school_year)
		end
	end

	def course_subjects_students_for(school_year)
		course_subject_students.joins(:course_subject).joins(:course).where("course.school_year_id = ?", school_year.id)
	end

	def global_average(school_year)
		total_student_approved_career_subjects = student_approved_career_subjects.where(school_year_id: school_year.id)
		sum = total_student_approved_career_subjects.inject(0) {|total, x| total + x.mark }
		unless sum.zero?
			avg = (sum / total_student_approved_career_subjects.size).round(2)
			avg if avg >= 7
		end
	end

	private

  	def _links(path)
  		[ref: 'self', href: path, method: 'GET']
  	end
end

