class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :set_user, only: %i[show edit update destroy]
  def create; end
  def show; end
  def set_user 
    @user = User.find(params[:id])
  end
end
