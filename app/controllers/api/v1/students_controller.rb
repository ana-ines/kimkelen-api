class Api::V1::StudentsController < Api::V1::ApiController

  before_action :set_student_and_person, only: [:show]

  respond_to :json


  def show
    # consulta es postman: http://localhost:3000/api/v1/students/3
  end

  private

    def set_student_and_person
      @student = Student.find(params[:id])
      @person = Person.find(@student.person_id)
    end 
end