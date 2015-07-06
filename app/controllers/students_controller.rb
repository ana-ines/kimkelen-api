class StudentsController < ApplicationController
  before_action :set_student, only: [:show]

  # GET /students/1
  # GET /students/1.json
  def show
    render json: @student
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:first_name)
    end
end
