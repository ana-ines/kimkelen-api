class UsersController < ApplicationController

  before_action :authenticate_with_token!, only: [:update, :destroy]
  respond_to :json
  
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    render json: @users
  end

  # GET /users/1
  # GET /users/1.json
  def show
    render json: @user
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  #def update
    #@user = User.find(params[:id])

    #if @user.update(user_params)
     # head :no_content
    #else
    #  render json: @user.errors, status: :unprocessable_entity
   # end
  #end

  def update
    user = current_user
    if user.update(user_params)
      render json: user, status: 200, location: [:api, user]
    else
      render json: { errors: user.errors }, status: 422
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    current_user.destroy
    head 204
  end

  #def destroy
   # @user.destroy

    #head :no_content
  #end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:api_key, :username, :password)
    end
end
