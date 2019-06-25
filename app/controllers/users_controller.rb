class UsersController < ApplicationController
  before_action :set_user, only: [:destroy, :show_grants, :set_grants]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Пользователь удален.' }
      format.json { head :no_content }
    end
  end

  # GET /users/1/show_grants
  def show_grants

  end

  # PATCH /users/1/set_grants
  def set_grants
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_url, notice: 'Профиль пользователя обновлен.' }
        format.json { render :index, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:role_id)
    end
end
