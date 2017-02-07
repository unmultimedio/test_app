class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def create
    @user = User.new(user_params)
    render(status: 401, json: {
           errors: @user.errors
         }) && return unless @user.save
    redirect_to @user
  end

  def show
    render json: @user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :email,
      :first_name,
      :last_name,
      :zipcode,
      :street,
      :country
    )
  end
end
