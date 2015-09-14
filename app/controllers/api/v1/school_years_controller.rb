class SchoolYearsController < ApplicationController

	before_action :set_school_year, only: [:show, :update, :destroy]

	respond_to :json

	def index
		@school_years = SchoolYear.all
		render json: @school_years
	end

	def show
		render json: @school_year
	end

	private

    def set_school_year
      @school_year = SchoolYear.find(params[:id])
    end

    def student_params
      params.require(:school_year).permit(:year)
    end
end
