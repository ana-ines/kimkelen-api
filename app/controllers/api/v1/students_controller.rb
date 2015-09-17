class Api::V1::StudentsController < Api::V1::ApiController

  before_action :set_student, only: [:show]
  before_action :set_person, only: [:show]


  def show
    # consulta es postman: http://localhost:3000/api/v1/students/3
    render json: {error: "Invalid student id.", status: 404}, status: :not_found if @student.nil?
  end

  private
    def set_student
      @student = Student.find_by(id: params[:id])
    end

    def set_person
      @person = Person.find(@student.person_id) if @student
    end
end