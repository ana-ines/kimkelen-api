class TutorsController < ApplicationController
  before_action :set_tutor, only: [:show, :update, :destroy]

  # GET /tutors
  # GET /tutors.json
  def index
    # http://localhost:3000/tutors/
    @tutors = Tutor.all
    render json: @tutors
  end

  def show
    # http://localhost:3000/tutors/3
    @tutor = Person.joins(:tutors).find_by(id: @tutor.person_id)
    render json: @tutor
  end

  # http://localhost:3000/tutors/5/students/
  def students
    #Obtener listado de estudiantes a cargo de un tutor
    @students = StudentTutor.where(tutor_id: params[:id])
    render json: @students
  end

  # POST /tutors
  # POST /tutors.json
  def create
    @tutor = Tutor.new(tutor_params)

    if @tutor.save
      render json: @tutor, status: :created, location: @tutor
    else
      render json: @tutor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tutors/1
  # PATCH/PUT /tutors/1.json
  def update
    @tutor = Tutor.find(params[:id])

    if @tutor.update(tutor_params)
      head :no_content
    else
      render json: @tutor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tutors/1
  # DELETE /tutors/1.json
  def destroy
    @tutor.destroy

    head :no_content
  end

  private

    def set_tutor
      @tutor = Tutor.find(params[:id])
    end

    def tutor_params
      params.require(:tutor).permit(:person_id, :occupation_id, :tutor_type_id, :nationality, :occupation_category_id, :study_id, :is_alive)
    end
end
