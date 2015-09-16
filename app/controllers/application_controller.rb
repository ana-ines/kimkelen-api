class ApplicationController < ActionController::API

  include ActionController::ImplicitRender

  def invalid_request
    render json: {error: "Invalid request.", status: 400}, status: :bad_request
  end 
  
end
