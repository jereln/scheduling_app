class UsersController < ApplicationController
  before_action :set_user, only: [ :edit, :update]

  def index
    @clients = User.where(role: 'client').all
    authorize @clients
  end

  def show
    @user = current_user
    @appointments =  @user.therapist? ? @user.therapist_appts : @user.client_appts
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    authorize @user
    redirect_to client_list_path, notice: 'User was successfully destroyed.'
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params[:user]
  end
end
