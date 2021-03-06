class Api::V1::TutorsController < Api::V1::ApiController

  before_action :set_tutor, only: [:show]
  before_action :set_person, only: [:show]

  def show
   # consulta es postman: http://localhost:3000/api/v1/tutor/3
    render json: {error: "Invalid tutor id.", status: 404}, status: :not_found if @tutor.nil?
  end

  private

    def set_tutor
      @tutor = Tutor.find_by(id: params[:id])
    end

    def set_person
      @person = Person.find(@tutor.person_id) if @tutor
    end
end
